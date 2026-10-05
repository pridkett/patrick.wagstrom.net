# Agent instructions

## Commit messages

Use Conventional Commits for every commit: `type(scope): concise description`
(the scope is optional). Use a specific, imperative subject. Include at most two
explanatory paragraphs when needed. End every commit with this exact trailer,
separated from the subject or body by a blank line:

```text
Co-Authored-By: OpenAI Codex <noreply@openai.com>
```

## Project and Hugo compatibility

This is Patrick Wagstrom's personal website, built with Hugo. All templates,
archetypes, and frontend assets live in this repository; no theme or submodule
checkout is required. Preserve existing public URLs,
including explicit weblog `url` front matter and legacy comment mappings.

The production workflow pins Hugo extended **0.167.0**. Site and isolated
template checks pass on **0.164.0** and **0.167.0**. `config.yaml` declares a
minimum Hugo version of **0.158.0**, which introduced the locale API we use.
See [docs/hugo-upgrade.md](docs/hugo-upgrade.md) for the migration audit.

```sh
make build                         # Generate public/ with installed Hugo
make serve                         # Development server with drafts and future posts
make check                         # Fresh build plus site, template, and feed checks
make check HUGO=/absolute/path/hugo # Check another Hugo binary
```

`make upload` builds and rsyncs to production. Only deploy when requested.

## Templates

The site follows Hugo's modern template lookup conventions:

- `layouts/home.html`: homepage.
- `layouts/single.html`: fallback for regular pages. The site's fallback emits
  `.Content` verbatim for standalone HTML pages under `mail` and `walking`.
- `layouts/weblog/section.html`: weblog year archive; legacy pagination URLs
  continue to render post summaries.
- `layouts/weblog/recent.html`: recent post summaries and pagination.
- `layouts/weblog/single.html`: weblog posts and IntenseDebate mappings.
- `layouts/resume/single.html`: resume wrapper.
- `layouts/games/list.html` and `single.html`: game library and emulator.
- `layouts/_partials/`: reusable HTML and games helpers.
- `layouts/_shortcodes/`: bibliography, screenshots, phone, year, and other helpers.

The header and footer provide shared navigation and a contact footer.
`static/css/site.css` supplies the homepage palette and interior
page shell; `static/css/weblog.css` styles the archive and article reading layout.
Shared-shell pages use focused native CSS, with Grid/Flexbox layouts and semantic
page classes. Do not add Bootstrap/Bootswatch or jQuery runtime includes.
Font Awesome remains a separate icon stylesheet. The résumé uses
`content/resume/resume.css` and its scoped `print.css`; keep its 11.8pt print
type, 1.23 line height, 0.5in body margins, and hidden print controls intact.
Keep prose left-aligned, summaries bounded to 45 words, and the résumé's print
styles intact.

`single.html` and `list.html` remain supported standard layout names. Do not
reintroduce `_default`, `partials`, `shortcodes`, `index.html`, or the legacy
`section/weblog.html` layout paths. Use `partial "pagination.html" .` for Hugo's
embedded pager. The Go `template` action remains valid for named template
blocks; arbitrary layout files should not be treated as named includes.

Use `hugo.Data`, `.Site.Language.Locale`, and `now.Year`; do not use the removed
`.Site.Author`, or deprecated `.Site.Data` and `.Site.LanguageCode` APIs.

## Configuration and feeds

`config.yaml` defines `locale: en-US`, menus, author metadata,
Goldmark raw HTML support, and IntenseDebate mappings. Keep
`security.allowContent` enabled for the handwritten HTML under `content/`.

The canonical feeds are `/index.rss` (RSS 2.0) and `/index.atom` (Atom 1.0),
with the same 15 full-content weblog entries. Other sections and taxonomies
render HTML only; `content/weblog/_index.md` does not enable separate feeds.
The site's `weblog-feed.html` partial selects published weblog pages recursively
and excludes drafts and future posts even in preview builds. Preserve existing
RSS GUIDs and use the same permalink identifiers for Atom entries. Sort by
publication date, and advance update dates only through explicit editorial
`lastmod` (falling back to publication date), never Git, file, or build times.

Site feed wrappers are `layouts/home.rss.rss` and `layouts/home.atom.atom`.
The repeated suffix represents the output format and its custom media extension.
They call the local shared RSS/Atom renderers and feed content helpers.
`params.canonicalFeeds` makes pages with the shared shell advertise both home feeds and show
subscription links. Feed metadata uses `params.authorName` and
`params.authorEmail`; `params.author` remains a string for the HTML author tag.

Local `home.rss.xml` and `list.rss.xml` support Hugo's standard XML feed extension.
The isolated template fixture in `scripts/check-hugo.py` exercises these fallback
templates, plus post/link/list layouts that normal site builds would hide.

`ops/feeds.caddy` supplies permanent redirects for legacy home, weblog, and
taxonomy feeds, correct content types, caching, and public CORS.
`ops/webpage-docker-containers-feeds.patch` adds the required Caddy configuration
mount to the hosting repository's `personal-website` service, plus its backend
Caddyfile and a copy of the feed rules. Keep the rule copies synchronized. Apply
and validate the hosting patch during an explicitly requested deployment; see
`docs/hugo-upgrade.md` for the targeted container rollout commands.
Old feed files can remain after rsync uploads; the redirects must take precedence
over them. Do not enable global rsync deletion to remove these files.
`make check-feeds-http` tests this snippet with a temporary local Caddy server.

## Content and assets

- `content/weblog/`: historical blog posts, custom URLs, and media.
- `content/resume/`: resume, local assets, and screen/print CSS. The
  `resumeShowPhone` parameter controls phone display.
- `content/publications/`: bibliography shortcode backed by `data/bib`.
- `content/screenshots/`: screenshot gallery backed by `data/screenshots`.
- `content/games/`: game pages and screenshots; emulator assets are in `static/`.
- `content/tutorials/_index.md`: historical tutorial listing, retained for old
  inbound links. Tutorials are omitted from the shared navigation; Publications
  and Research appear in the top navigation.
- `content/tutorials/pygtkmozembed/`: the 2004 Python tutorial, rendered with its
  original content and a dated archive note. Its URL is explicitly pinned.
- `static/tutorials/mythTV64/`: the 2005–2006 MythTV archive, copied verbatim to
  preserve original HTML, downloads, and case-sensitive paths.

The tutorial listing is a branch bundle with a `tutorials/section.html` template.
Preserve `/tutorials/`, `/tutorials/pygtkmozembed/`, `/tutorials/mythTV64/`, and
all archive filenames, including `googleLinks.html`. `make check` verifies local
links and fragments, navigation, and exact static archive bytes. Do not enable
rsync `--delete` until other missing historical pages have been investigated.

## Assets and verification

Edit layouts and frontend assets directly in this repository. Keep the migrated
theme's MIT notice in `docs/licenses/hugo-theme-patrick-custom.txt`, and preserve
the license comments in bundled third-party assets. Legacy Bootswatch, Bootstrap,
and jQuery files remain under `static/` to preserve historical public URLs; they
are not runtime dependencies, and `params.theme` is no longer used. Do not
delete archive assets or include unrelated local changes in commits.

`make check` fails on Hugo warnings and verifies feed XML and URLs, core pages,
legacy comments, assets, native résumé markup and unchanged downloads, absence
of retired framework includes, bibliography and screenshot shortcodes,
game rendering, and an isolated local template fixture including post, link,
weblog, menu-only, generic page, and taxonomy feeds. Builds run in fresh
temporary directories so stale generated pages cannot mask missing output.

Some historical files in `public/resources/` are still tracked. Do not clean
that directory as part of verification; use temporary destinations instead.

Do not claim external services or client-side interactions were verified just
because the generated HTML contains their scripts. Keep future frontend
dependency changes separate from Hugo compatibility work.
