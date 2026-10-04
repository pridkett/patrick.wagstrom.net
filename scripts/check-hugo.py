#!/usr/bin/env python3
"""Check generated site behavior and exercise theme templates without overrides."""

import argparse
from html.parser import HTMLParser
from pathlib import Path
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
            require(local_file(output, asset).is_file(), f"Missing theme asset: {asset}")

    check_feeds(output)
    check_discovery(output)

    resume = HTML(output / "resume/index.html")
    for css in ("/resume/resume.css", "/resume/print.css"):
        require(any(t == "link" and a.get("href") == css for t, a in resume.elements),
                f"Missing resume stylesheet: {css}")
        require(local_file(output, css).is_file(), f"Missing resume asset: {css}")
    require("bibliography-conference" in (output / "publications/index.html").read_text(),
            "Bibliography shortcode did not render")
    require("screenshot col-md" in (output / "screenshots/index.html").read_text(),
            "Screenshots shortcode did not render")
    post = output / "weblog/2003/05/23/lpdforfunandmp3playing/index.html"
    require(post.is_file(), "Legacy weblog URL is missing")
    require('idcomments_post_id = "60"' in post.read_text(),
            "Legacy comment mapping changed")
    game = (output / "games/amelias-sea-turtle-adventure/index.html").read_text()
    require("/emulator/" in game and "w2-player" in game, "Game player did not render")
    check_tutorials(output)


def check_theme(hugo):
    repo = Path(__file__).resolve().parents[1]
    with tempfile.TemporaryDirectory(prefix="hugo-theme-check-") as directory:
        source = Path(directory)
        (source / "hugo.toml").write_text(
            'baseURL = "https://example.org/"\nlocale = "en-US"\n'
            'theme = "hugo-theme-patrick-custom"\n'
            f'themesDir = "{repo / "themes"}"\n'
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
                    f"Theme failed to render {kind} without site overrides")
        home = (output / "index.html").read_text()
        for title in ("Example post", "Example link", "Example weblog"):
            require(title in home, f"Theme homepage omitted {title}")
        require('href="/page/2/"' in home and (output / "page/2/index.html").is_file(),
                "Theme homepage pagination failed")
        require('href="https://example.org/post/menu/"' not in home,
                "Menu-only page appeared in theme post list")
        channel = ET.parse(output / "index.xml").find("channel")
        titles = [item.findtext("title") for item in channel.findall("item")]
        require(len(titles) == 15 and "Menu only" not in titles, "Theme feed filtering failed")
        require("Example weblog" in titles and "Linklog: Example link" in titles,
                "Theme feed omitted weblog or link content")
        for path in output.rglob("*.xml"):
            ET.parse(path)
        require(ET.parse(output / "tags/index.xml").findall("./channel/item"),
                "Theme taxonomy feed is empty")


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
    check_theme(args.hugo)
    check_feed_regressions(args.hugo)
    print("Hugo site, feed regressions, and standalone theme checks passed.")
