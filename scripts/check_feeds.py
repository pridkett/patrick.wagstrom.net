"""Feed contracts and isolated regression fixtures (standard library only)."""

from datetime import datetime
from email.utils import parsedate_to_datetime
from html.parser import HTMLParser
from pathlib import Path
import shutil
import subprocess
import tempfile
from urllib.parse import unquote, urlsplit
import xml.etree.ElementTree as ET

ATOM = "{http://www.w3.org/2005/Atom}"
BASE = "https://patrick.wagstrom.net/"


def require(condition, message):
    if not condition:
        raise AssertionError(message)


class Article(HTMLParser):
    """Check explicit tag nesting and feed URLs; this is not an HTML5 validator."""

    void = set("area base br col embed hr img input link meta param source track wbr".split())

    def __init__(self, content):
        super().__init__()
        self.stack = []
        self.elements = []
        self.text = []
        self.feed(content)
        require(not self.stack, f"Unclosed article elements: {self.stack}")

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        self.elements.append((tag, attrs))
        require(tag not in ("script", "iframe", "style"), f"Unsupported feed element: {tag}")
        require("style" not in attrs, "Feed readability must not depend on inline styles")
        if tag not in self.void:
            self.stack.append(tag)

    def handle_endtag(self, tag):
        require(self.stack and self.stack[-1] == tag,
                f"Mismatched article closing tag {tag}: {self.stack}")
        self.stack.pop()

    def handle_data(self, text):
        self.text.append(text)


def read_feeds(output):
    rss = ET.parse(output / "index.rss").getroot()
    atom = ET.parse(output / "index.atom").getroot()
    require(rss.tag == "rss" and rss.get("version") == "2.0", "Expected RSS 2.0")
    require(atom.tag == ATOM + "feed", "Expected Atom 1.0 namespace")
    channel = rss.find("channel")
    for element in ("title", "link", "description"):
        require(channel.findtext(element), f"Missing RSS channel {element}")
    for element in ("title", "id", "updated", "author/" + ATOM + "name"):
        require(atom.findtext(ATOM + element), f"Missing Atom feed {element}")
    return channel, atom, channel.findall("item"), atom.findall(ATOM + "entry")


def check_feeds(output, count=15, local_links=True):
    generated = {str(path.relative_to(output)) for path in output.rglob("*")
                 if path.suffix in (".rss", ".atom")}
    require(generated == {"index.rss", "index.atom"}, f"Unexpected feeds: {generated}")
    for path in output.rglob("*.xml"):
        require(ET.parse(path).getroot().tag not in ("rss", ATOM + "feed"),
                f"Unexpected XML feed: {path}")
    channel, atom, rss_items, atom_entries = read_feeds(output)
    require(len(rss_items) == len(atom_entries) == count, "Incorrect feed entry count")
    self_rss = channel.find(ATOM + "link")
    self_atom = atom.find(f"{ATOM}link[@rel='self']")
    for link, name, mime in ((self_rss, "index.rss", "application/rss+xml"),
                             (self_atom, "index.atom", "application/atom+xml")):
        require(link is not None and link.get("href") == BASE + name
                and link.get("rel") == "self" and link.get("type") == mime,
                f"Incorrect {name} self link")
    require(atom.findtext(ATOM + "id") == BASE + "index.atom", "Unstable Atom feed ID")
    require(channel.findtext("link") == BASE + "weblog/", "Incorrect weblog channel link")
    require(channel.findtext("language") == "en-US", "Incorrect RSS language")
    require("patrick@wagstrom.net" in channel.findtext("managingEditor", ""), "RSS author missing")
    require(atom.findtext(ATOM + "author/" + ATOM + "email") == "patrick@wagstrom.net",
            "Atom author missing")
    require(atom.get("{http://www.w3.org/XML/1998/namespace}lang") == "en-US",
            "Incorrect Atom language")
    dates, updated, ids = [], [], []
    for item, entry in zip(rss_items, atom_entries):
        url = item.findtext("link")
        require(url.startswith(BASE + "weblog/"), f"Non-weblog entry: {url}")
        if local_links:
            target = output / unquote(urlsplit(url).path).lstrip("/") / "index.html"
            require(target.is_file(), f"Feed points to missing article: {url}")
        require(item.findtext("guid") == entry.findtext(ATOM + "id") == url,
                f"Post ID changed: {url}")
        require(item.find("guid").get("isPermaLink") == "true", "RSS GUID must be a permalink")
        ids.append(url)
        require(entry.find(f"{ATOM}link[@rel='alternate']").get("href") == url,
                "Atom article link mismatch")
        require(item.findtext("title") == entry.findtext(ATOM + "title"), "Title mismatch")
        require("&#" not in item.findtext("title"), "Title contains undecoded numeric entities")
        published = parsedate_to_datetime(item.findtext("pubDate"))
        require(published == datetime.fromisoformat(entry.findtext(ATOM + "published")),
                "Publication date mismatch")
        modified = datetime.fromisoformat(entry.findtext(ATOM + "updated"))
        require(modified >= published, "Update precedes publication")
        dates.append(published)
        updated.append(modified)
        content = entry.find(ATOM + "content")
        require(content.get("type") == "html" and content.text == item.findtext("description"),
                "Formats must contain identical full HTML content")
        require(content.text.strip(), "Empty article body")
        article = Article(content.text)
        for tag, attrs in article.elements:
            urls = [attrs[k] for k in ("href", "src", "poster") if k in attrs]
            if "srcset" in attrs:
                urls.extend(candidate.strip().split()[0] for candidate in attrs["srcset"].split(","))
            for value in urls:
                parsed = urlsplit(value)
                require(parsed.scheme, f"Relative article URL: {value}")
                if tag in ("img", "source", "video", "audio"):
                    require(parsed.scheme in ("https", "data"), f"Insecure media: {value}")
                if local_links and parsed.hostname == "patrick.wagstrom.net":
                    target = output / unquote(parsed.path).lstrip("/")
                    require(target.is_file() or (target / "index.html").is_file(),
                            f"Missing feed content target: {value}")
        require([x.text for x in item.findall("category")] ==
                [x.get("term") for x in entry.findall(ATOM + "category")], "Category mismatch")
    require(len(set(ids)) == len(ids), "Duplicate entry IDs")
    require(dates == sorted(dates, reverse=True), "Feeds must sort by publication date")
    feed_updated = datetime.fromisoformat(atom.findtext(ATOM + "updated"))
    require(feed_updated == parsedate_to_datetime(channel.findtext("lastBuildDate")),
            "Feed update timestamps differ")
    require(feed_updated == (max(updated) if updated else datetime.fromisoformat("1970-01-01T00:00:00+00:00")),
            "Feed timestamp must reflect included weblog entries")


def check_discovery(output):
    # Standalone handwritten mail/walking/archive HTML intentionally bypasses the shared shell.
    for name in ("index.html", "weblog/index.html", "weblog/page/2/index.html",
                 "weblog/2003/05/23/lpdforfunandmp3playing/index.html", "resume/index.html",
                 "tags/index.html", "tags/firewall/index.html", "games/index.html"):
        class Links(HTMLParser):
            def __init__(self):
                super().__init__()
                self.feeds = []
                self.visible = []

            def handle_starttag(self, tag, attrs):
                attrs = dict(attrs)
                if tag == "link" and attrs.get("type") in ("application/rss+xml", "application/atom+xml"):
                    self.feeds.append(attrs)
                if tag == "a" and attrs.get("href") in ("/index.rss", "/index.atom"):
                    self.visible.append(attrs["href"])

        links = Links()
        links.feed((output / name).read_text())
        require([(x.get("href"), x.get("type"), x.get("rel")) for x in links.feeds] ==
                [(BASE + "index.rss", "application/rss+xml", "alternate"),
                 (BASE + "index.atom", "application/atom+xml", "alternate")],
                f"Incorrect canonical feed discovery on {name}")
        require(set(links.visible) == {"/index.rss", "/index.atom"},
                f"Missing subscription links on {name}")


def check_feed_regressions(hugo):
    repo = Path(__file__).resolve().parents[1]
    with tempfile.TemporaryDirectory(prefix="hugo-feed-regressions-") as directory:
        source = Path(directory)
        shutil.copyfile(repo / "config.yaml", source / "config.yaml")
        (source / "layouts").symlink_to(repo / "layouts", target_is_directory=True)
        weblog = source / "content/weblog"
        weblog.mkdir(parents=True)
        shutil.copyfile(repo / "content/weblog/_index.md", weblog / "_index.md")
        for number in range(16):
            (weblog / f"post-{number}.md").write_text(
                f'---\ntitle: "Post {number}"\ndate: 2024-01-{number + 1:02}T12:00:00Z\n'
                f'url: /weblog/stable-{number}/\ntags: [regression]\n---\nBody {number}.\n')
        nested = weblog / "nested"
        nested.mkdir()
        edited = nested / "edited.md"
        body = '''
<p id="anchor">Full body &amp; punctuation.</p>
<p><a href="?a=1&amp;b=2#anchor">Query</a> <a href='#anchor'>Fragment</a>
<a href=/target/>Unquoted</a> <a href="mailto:test@example.org">Email</a></p>
<img src="../photo.png" srcset="../photo.png 1x, /photo-large.png 2x" alt="Photo">
<iframe src="//www.youtube.com/embed/example"></iframe>
<pre style="color:white;background:black"><code>&lt;a href="../literal"&gt;Example&lt;/a&gt;</code></pre>
<script>unwantedScript()</script><style>unwantedStyles {}</style>
'''
        frontmatter = ('---\ntitle: "Edited &amp; &lt;test&gt;"\ndate: 2025-01-01T12:00:00Z\n'
                       'url: /weblog/stable-edited/\ntags: [one, two]\n')
        edited.write_text(frontmatter + '---\n' + body)
        output = source / "output"

        def build(preview=False):
            shutil.rmtree(output, ignore_errors=True)
            command = [hugo, "--source", str(source), "--destination", str(output), "--panicOnWarning"]
            if preview:
                command += ["--buildDrafts", "--buildFuture"]
            result = subprocess.run(command, capture_output=True, text=True)
            require(result.returncode == 0, result.stdout + result.stderr)
            check_feeds(output, local_links=False)
            return tuple((output / name).read_bytes() for name in ("index.rss", "index.atom"))

        baseline = build()
        article = Article(read_feeds(output)[2][0].findtext("description"))
        hrefs = {attrs["href"] for _, attrs in article.elements if "href" in attrs}
        require(BASE + "weblog/stable-edited/?a=1&b=2#anchor" in hrefs, "Query escaping failed")
        require(BASE + "weblog/stable-edited/#anchor" in hrefs, "Fragment resolution failed")
        require(BASE + "target/" in hrefs, "Unquoted URL resolution failed")
        require("https://www.youtube.com/embed/example" in hrefs, "Embed fallback missing")
        image = next(attrs for tag, attrs in article.elements if tag == "img")
        require(image["src"] == BASE + "weblog/photo.png", "Post-relative image resolution failed")
        require(image["srcset"] == BASE + "weblog/photo.png 1x, " + BASE + "photo-large.png 2x",
                "Responsive image resolution failed")
        require('<a href="../literal">Example</a>' in "".join(article.text), "Code examples were rewritten")
        require("unwantedScript" not in baseline[0].decode(), "Feed contains script content")

        other = source / "content/other/newest.md"
        other.parent.mkdir()
        other.write_text('---\ntitle: Newer unrelated page\ndate: 2026-01-01\n---\nUnrelated.\n')
        require(build() == baseline, "Adding a non-weblog page changed feeds")
        other.write_text('---\ntitle: Changed unrelated page\ndate: 2026-01-02\n---\nChanged.\n')
        require(build() == baseline, "Editing a non-weblog page changed feeds")
        for name, metadata in (("draft", "draft: true\ndate: 2026-01-01"),
                               ("future", "date: 2999-01-01"),
                               ("scheduled", "date: 2025-01-01\npublishDate: 2999-01-01")):
            (weblog / f"{name}.md").write_text(f'---\ntitle: {name}\n{metadata}\n---\nHidden.\n')
        require(build() == baseline, "Draft or future weblog posts changed feeds")
        require(build(preview=True) == baseline, "Preview build leaked drafts/future posts into feeds")

        original_ids = [item.findtext("guid") for item in read_feeds(output)[2]]
        edited.write_text(frontmatter + 'lastmod: 2026-01-03T12:00:00Z\n---\n' + body + '\nEditorial update.\n')
        require(build() != baseline, "Editorial update did not change feeds")
        channel, atom, items, entries = read_feeds(output)
        require(original_ids == [item.findtext("guid") for item in items], "Editorial edit changed IDs/order")
        require(atom.findtext(ATOM + "updated") == "2026-01-03T12:00:00Z", "Editorial update date missing")
        require(entries[0].findtext(ATOM + "published") == "2025-01-01T12:00:00Z", "Publication date changed")
        stable = build()
        require(build() == stable, "Repeated builds changed feeds")

        shutil.rmtree(weblog)
        weblog.mkdir()
        shutil.copyfile(repo / "content/weblog/_index.md", weblog / "_index.md")
        shutil.rmtree(output)
        subprocess.run([hugo, "--source", str(source), "--destination", str(output), "--panicOnWarning"],
                       check=True, capture_output=True)
        check_feeds(output, count=0, local_links=False)
