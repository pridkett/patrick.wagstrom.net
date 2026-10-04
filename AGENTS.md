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

This is Patrick Wagstrom's personal website, built with Hugo and the custom
`hugo-theme-patrick-custom` Git submodule. Preserve existing public URLs,
including explicit weblog `url` front matter and legacy comment mappings.

The production workflow pins Hugo extended **0.167.0**. The full site and the
standalone theme checks pass on **0.164.0** and **0.167.0**. The theme declares a
minimum Hugo version of **0.158.0**, which introduced the locale API it uses.
See [docs/hugo-upgrade.md](docs/hugo-upgrade.md) for the migration audit.

```sh
make build                         # Generate public/ with installed Hugo
make serve                         # Development server with drafts and future posts
make check                         # Fresh build plus site and standalone theme checks
make check HUGO=/absolute/path/hugo # Check another Hugo binary
```

`make upload` builds and rsyncs to production. Only deploy when requested.

## Templates

Both the site and theme follow Hugo's modern template lookup conventions:

- `layouts/home.html`: homepage.
- `layouts/single.html`: fallback for regular pages. The site's fallback emits
  `.Content` verbatim for standalone HTML pages under `mail` and `walking`.
- `layouts/weblog/section.html`: weblog list and pagination.
- `layouts/weblog/single.html`: weblog posts and IntenseDebate mappings.
- `layouts/resume/single.html`: resume wrapper.
- `layouts/games/list.html` and `single.html`: game library and emulator.
- `layouts/_partials/`: reusable HTML and games helpers.
- `layouts/_shortcodes/`: bibliography, screenshots, phone, year, and other helpers.

`single.html` and `list.html` remain supported standard layout names. Do not
reintroduce `_default`, `partials`, `shortcodes`, `index.html`, or the legacy
`section/weblog.html` layout paths. Use `partial "pagination.html" .` for Hugo's
embedded pager. The Go `template` action remains valid for named template
blocks; arbitrary layout files should not be treated as named includes.

Use `hugo.Data`, `.Site.Language.Locale`, and `now.Year`; do not use the removed
`.Site.Author`, or deprecated `.Site.Data` and `.Site.LanguageCode` APIs.

## Configuration and feeds

`config.yaml` defines `locale: en-US`, the theme, menus, author metadata,
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
They call the theme's shared RSS/Atom renderers and feed content helpers.
`params.canonicalFeeds` makes themed pages advertise both home feeds and show
subscription links. Feed metadata uses `params.authorName` and
`params.authorEmail`; `params.author` remains a string for the HTML author tag.

The standalone theme also supplies `home.rss.xml` and `list.rss.xml` for Hugo's
standard XML feed extension. Do not remove these just because the site overrides
its own feeds. The standalone theme fixture in `scripts/check-hugo.py` exercises
templates that normal site builds would hide.

`ops/feeds.caddy` supplies permanent redirects for legacy home, weblog, and
taxonomy feeds, correct content types, caching, and public CORS. Import it into
the existing production site block during an explicitly requested deployment.
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
- `content/tutorials/_index.md`: historical tutorial listing, linked from navigation.
- `content/tutorials/pygtkmozembed/`: the 2004 Python tutorial, rendered with its
  original content and a dated archive note. Its URL is explicitly pinned.
- `static/tutorials/mythTV64/`: the 2005–2006 MythTV archive, copied verbatim to
  preserve original HTML, downloads, and case-sensitive paths.

The tutorial listing is a branch bundle with a `tutorials/section.html` template.
Preserve `/tutorials/`, `/tutorials/pygtkmozembed/`, `/tutorials/mythTV64/`, and
all archive filenames, including `googleLinks.html`. `make check` verifies local
links and fragments, navigation, and exact static archive bytes. Do not enable
rsync `--delete` until other missing historical pages have been investigated.

## Submodule and verification

Theme edits belong to the theme repository. Commit and push that repository
first, then commit the updated submodule reference in the site repository.
Otherwise a clean checkout or publishing workflow will retrieve the old theme.
Do not include unrelated local changes in either commit.

`make check` fails on Hugo warnings and verifies feed XML and URLs, core pages,
legacy comments, assets, resume styles, bibliography and screenshot shortcodes,
game rendering, and a standalone theme fixture including post, link, weblog,
menu-only, generic page, pagination, and taxonomy feeds. Builds run in fresh
temporary directories so stale generated pages cannot mask missing output.

Some historical files in `public/resources/` are still tracked. Do not clean
that directory as part of verification; use temporary destinations instead.

Do not claim external services or client-side interactions were verified just
because the generated HTML contains their scripts. Keep Bootstrap and other
frontend asset upgrades separate from Hugo compatibility work.
