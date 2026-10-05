#!/usr/bin/env python3
"""Check the standalone site's output, templates, and feed behavior."""

import argparse
from html import unescape
from html.parser import HTMLParser
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
from urllib.parse import unquote, urljoin, urlsplit
import xml.etree.ElementTree as ET
from check_feeds import check_feeds, check_discovery, check_feed_regressions


class HTML(HTMLParser):
    def __init__(self, path):
        super().__init__()
        self.elements = []
        self.text = path.read_text()
        self.feed(self.text)

    def handle_starttag(self, tag, attrs):
        self.elements.append((tag, dict(attrs)))


def require(condition, message):
    if not condition:
        raise AssertionError(message)


def local_file(output, url):
    path = unquote(urlsplit(url).path).lstrip("/")
    # Historical downloads include filenames without an extension, such as lircrc.
    if (output / path).is_file():
        return output / path
    return output / path / "index.html" if not Path(path).suffix else output / path


def check_tutorials(output):
    root_url = "https://patrick.wagstrom.net"
    routes = ("/tutorials/", "/tutorials/pygtkmozembed/", "/tutorials/mythTV64/")
    for route in routes:
        path = local_file(output, route)
        require(path.is_file(), f"Missing historical tutorial URL: {route}")
        page = HTML(path)
        for tag, attrs in page.elements:
            for key in ("href", "src"):
                value = attrs.get(key)
                if not value:
                    continue
                url = urlsplit(urljoin(root_url + route, value))
                if url.scheme not in ("http", "https") or url.hostname != "patrick.wagstrom.net":
                    continue
                target = local_file(output, url.path)
                require(target.is_file(), f"Broken local tutorial link from {route}: {value}")
                if url.fragment and target.suffix == ".html":
                    anchors = {
                        value for _, attributes in HTML(target).elements
                        for key, value in attributes.items() if key in ("id", "name")
                    }
                    require(unquote(url.fragment) in anchors,
                            f"Broken tutorial section link from {route}: {value}")

    listing = HTML(local_file(output, "/tutorials/"))
    for route in routes[1:]:
        require(any(tag == "a" and urljoin(root_url + "/tutorials/", attrs.get("href", ""))
                    == root_url + route for tag, attrs in listing.elements),
                f"Historical tutorial is missing from the listing: {route}")
    require("2004" in listing.text and "2005" in listing.text and "2006" in listing.text,
            "Tutorial listing must preserve the original publication dates")
    browser = HTML(local_file(output, routes[1]))
    require("Historical tutorial, originally published August 18, 2004" in browser.text,
            "Python tutorial archive context is missing")

    repo = Path(__file__).resolve().parents[1]
    archive = repo / "static/tutorials/mythTV64"
    for source in archive.rglob("*"):
        if source.is_file():
            target = output / "tutorials/mythTV64" / source.relative_to(archive)
            require(target.is_file() and target.read_bytes() == source.read_bytes(),
                    f"Historical archive file changed or disappeared: {source.relative_to(archive)}")


def check_site(output):
    for name in (
        "index.html", "weblog/index.html", "weblog/page/2/index.html",
        "resume/index.html", "publications/index.html", "screenshots/index.html",
        "mail/index.html", "walking/index.html", "games/index.html",
        "games/amelias-sea-turtle-adventure/index.html",
    ):
        require((output / name).is_file(), f"Missing generated page: {name}")

    home = HTML(output / "index.html")
    require(any(t == "html" and a.get("lang") == "en-US" for t, a in home.elements),
            "Homepage must declare the configured locale")
    require(any(t == "a" and a.get("href") == "/weblog/" for t, a in home.elements),
            "Blog navigation link is missing")
    for tag, attrs in home.elements:
        asset = attrs.get("src") if tag == "script" else attrs.get("href") if (
            tag == "link" and attrs.get("rel") == "stylesheet") else None
        if asset and asset.startswith("/"):
            require(local_file(output, asset).is_file(), f"Missing site asset: {asset}")

    check_feeds(output)
    check_discovery(output)

    resume = HTML(output / "resume/index.html")
    require(any(t == "main" and a.get("class") == "resume-sheet"
                for t, a in resume.elements), "Missing native résumé wrapper")
    require(any(t == "aside" and a.get("class") == "resume-sidebar"
                for t, a in resume.elements), "Missing résumé contact sidebar")
    require(not any(t == "pre" for t, _ in resume.elements),
            "Résumé HTML must not become an indented Markdown code block")
    require('mailto:patrick@wagstrom.net' in resume.text and 'fa-envelope' in resume.text,
            "Missing résumé email address or inline icon")
    require(any(t == "a" and a.get("class") == "resume-action"
                and local_file(output, "/resume/" + a.get("href", "")).is_file()
                for t, a in resume.elements), "Missing résumé download control or PDF")
    require(any(t == "button" and a.get("onclick") == "window.print();"
                for t, a in resume.elements), "Missing résumé print control")
    for _, attrs in resume.elements:
        require(not any(re.fullmatch(r"row|container|col-(?:xs|sm|md|lg)-.*|btn(?:-.*)?", c)
                        for c in attrs.get("class", "").split()),
                "Résumé still uses Bootstrap layout or button classes")
    for source in (Path(__file__).resolve().parents[1] / "content/resume").glob("*.pdf"):
        target = output / "resume" / source.name
        require(target.is_file() and target.read_bytes() == source.read_bytes(),
                f"Résumé download changed or disappeared: {source.name}")
    for css in ("/resume/resume.css", "/resume/print.css"):
        require(any(t == "link" and a.get("href") == css for t, a in resume.elements),
                f"Missing resume stylesheet: {css}")
        require(local_file(output, css).is_file(), f"Missing resume asset: {css}")
    require("bibliography-conference" in (output / "publications/index.html").read_text(),
            "Bibliography shortcode did not render")
    require('class="pw-gallery-entry"' in (output / "screenshots/index.html").read_text(),
            "Screenshots shortcode did not render")
    post = output / "weblog/2003/05/23/lpdforfunandmp3playing/index.html"
    require(post.is_file(), "Legacy weblog URL is missing")
    require('idcomments_post_id = "60"' in post.read_text(),
            "Legacy comment mapping changed")
    game = (output / "games/amelias-sea-turtle-adventure/index.html").read_text()
    require("/emulator/" in game and "w2-player" in game, "Game player did not render")
    check_frontend(output)
    check_tutorials(output)
    check_writing(output)


def check_frontend(output):
    """Historical framework URLs remain available; shared-shell pages must not load them."""
    for path in output.rglob("*.html"):
        text = path.read_text()
        if 'class="pw-site' not in text and 'class="pw-home' not in text:
            continue
        page = HTML(path)
        for tag, attrs in page.elements:
            asset = attrs.get("src", "") if tag == "script" else attrs.get("href", "") if (
                tag == "link" and attrs.get("rel") == "stylesheet") else ""
            require(not re.search(r"css/theme/|bootstrap|jquery", asset, re.I),
                    f"Shared-shell page loads a retired framework: {path.relative_to(output)}: {asset}")


def check_writing(output):
    archive = HTML(output / "weblog/index.html")
    links = [a.get("href") for t, a in archive.elements if t == "a"]
    require("/weblog/recent/" in links, "Recent writing view is missing from the archive")
    require(any(a.get("id") == "year-2002" for _, a in archive.elements),
            "The year archive omits the oldest writing")
    # Every published article must remain discoverable from the archive.
    for path in (output / "weblog").rglob("index.html"):
        if 'class="pw-post"' in path.read_text():
            url = "/" + path.parent.relative_to(output).as_posix() + "/"
            require(links.count(url) == 1, f"Archive omits or duplicates an article: {url}")
    for route in ("/weblog/recent/", "/weblog/recent/page/2/", "/weblog/page/2/"):
        page = HTML(local_file(output, route))
        summaries = re.findall(r'<article class="pw-entry">.*?<p>(.*?)</p>', page.text, re.S)
        require(summaries, f"Writing page has no article summaries: {route}")
        require(all(len(unescape(summary).split()) <= 45 for summary in summaries),
                f"Writing excerpts are too long: {route}")
        for tag, attrs in page.elements:
            if tag == "a" and attrs.get("href", "").startswith("/weblog/"):
                require(local_file(output, attrs["href"]).is_file(),
                        f"Broken writing or pagination link: {attrs['href']}")


def check_templates(hugo):
    """Exercise inherited fallback layouts and XML feeds using only local files."""
    repo = Path(__file__).resolve().parents[1]
    with tempfile.TemporaryDirectory(prefix="hugo-template-check-") as directory:
        source = Path(directory)
        for name in ("layouts", "static"):
            shutil.copytree(repo / name, source / name)
        (source / "hugo.toml").write_text(
            'baseURL = "https://example.org/"\nlocale = "en-US"\n'
            '[params]\nauthor = "Example Author"\nauthorName = "Example Author"\n'
            'authorEmail = "example@example.org"\n'
        )
        for kind in ("post", "link", "weblog", "page", "other"):
            section = source / "content" / kind
            section.mkdir(parents=True)
            (section / "example.md").write_text(
                f'---\ntitle: "Example {kind}"\ndate: 2026-01-01\n'
                'tags: [hugo]\ncategories: [migration]\nauthor: "Link Author"\n'
                'ref: "https://example.org/target/"\n---\nExample content.\n'
            )
        for number in range(16):
            (source / "content/post" / f"post-{number}.md").write_text(
                f'---\ntitle: "Post {number}"\ndate: 2025-01-{number + 1:02}\n---\nPost content.\n'
            )
        (source / "content/post/menu.md").write_text(
            '---\ntitle: "Menu only"\ndate: 2026-02-01\nmenu: main\n---\nMenu content.\n'
        )
        subprocess.run([hugo, "--source", str(source), "--panicOnWarning"], check=True)
        output = source / "public"
        for kind in ("post", "link", "weblog", "page", "other"):
            require((output / kind / "example/index.html").is_file(),
                    f"Local templates failed to render {kind}")
        post_list = (output / "post/index.html").read_text()
        require("Example post" in post_list and 'href="https://example.org/post/menu/"' not in post_list,
                "Fallback list must include posts and exclude menu-only pages")
        require('url=https://example.org/target/' in (output / "link/example/index.html").read_text(),
                "Link redirect template changed")
        for kind in ("post", "page", "other"):
            require("Example content." in (output / kind / "example/index.html").read_text(),
                    f"Local {kind} layout lost page content")
        weblog = (output / "weblog/index.html").read_text()
        require("Example weblog" in weblog, "Weblog archive omitted its post")
        channel = ET.parse(output / "index.xml").find("channel")
        titles = [item.findtext("title") for item in channel.findall("item")]
        require(len(titles) == 15 and "Menu only" not in titles, "Fallback feed filtering failed")
        require("Example weblog" in titles and "Linklog: Example link" in titles,
                "Fallback feed omitted weblog or link content")
        for path in output.rglob("*.xml"):
            ET.parse(path)
        require(ET.parse(output / "tags/index.xml").findall("./channel/item"),
                "Fallback taxonomy feed is empty")
        check_frontend(output)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path, nargs="?", help="Existing build; omit for a fresh temporary build")
    parser.add_argument("--hugo", default="hugo")
    args = parser.parse_args()
    if args.output is not None:
        check_site(args.output)
    else:
        with tempfile.TemporaryDirectory(prefix="hugo-site-check-") as directory:
            repo = Path(__file__).resolve().parents[1]
            subprocess.run([args.hugo, "--source", str(repo), "--destination", directory,
                            "--panicOnWarning"], check=True)
            check_site(Path(directory))
    check_templates(args.hugo)
    check_feed_regressions(args.hugo)
    print("Standalone Hugo site, template fixtures, and feed regressions passed.")
