# Hugo upgrade audit

Audit date: October 4, 2026.

The theme was subsequently consolidated into this repository. The findings below
record the earlier compatibility audit; current templates and assets live under
`layouts/`, `archetypes/`, and `static/`. There is no theme/submodule dependency.
See [the standalone migration notes](standalone-site.md) for the current structure.

The project had already received partial Hugo compatibility repairs. The local
Hugo installation was **0.164.0**, while the GitHub publishing workflow still
installed **0.152.2**. The latest stable release at the time of the audit is
[Hugo 0.167.0](https://github.com/gohugoio/hugo/releases/tag/v0.167.0).
The migration and historical tutorial restoration have been validated locally.
Publishing and deployment are separate steps.

## Findings and changes

| Finding | Change |
| --- | --- |
| Publishing used a different Hugo version from local builds. | Pin the workflow to extended 0.167.0 and run `make check` before building deployment output. |
| Templates relied on the compatibility mappings for the pre-0.146 layout structure. | Move `_default` templates to the layout root, rename `partials` and `shortcodes` to `_partials` and `_shortcodes`, rename homepage templates to `home.html`, and move the weblog list to `weblog/section.html`. |
| `languageCode`, `.Site.LanguageCode`, and `.Site.Data` generated deprecation warnings. | Use `locale: en-US`, `.Site.Language.Locale`, and `hugo.Data`. The year shortcode uses `now.Year`. |
| The theme's RSS template still called the removed `.Site.Author` API. Normal builds concealed this because site templates overrode it. | Replace it with a shared RSS partial using the existing `params.authorName` and `params.authorEmail` fields. Test the theme without site overrides. |
| RSS was requested for sections, taxonomies, and terms with no matching template. Their HTML could advertise nonexistent feeds. | Generate site RSS only for the home and weblog pages. Explicitly enable the weblog feed in its existing `_index.md`; make other list outputs HTML only. |
| Feeds used `application/rss`, while HTML advertised `application/rss+xml`. Their Atom self links pointed to the section HTML URL. | Use `application/rss+xml` consistently, retain the `.rss` extension, and obtain each self URL from its RSS output format. |
| RSS markup was duplicated in the site and theme. | Use the theme's `_partials/rss.html` from thin site feed wrappers and standalone theme templates. |
| Theme homepage collection used `.Pages`, which contains section pages on the home page. It filtered only `post` and `link`, omitting this site's `weblog` type. | Paginate matching `.Site.RegularPages`, support `post`, `link`, and `weblog`, and exclude menu-only posts before pagination. |
| Theme had no fallback single template for arbitrary content types. | Add a generic theme `single.html`; retain the site's verbatim HTML fallback and specialized templates. |
| Theme metadata claimed support for Hugo 0.14. | Declare a minimum of 0.158.0 in theme metadata and module configuration; verify the standalone theme on that version. |
| Theme HTML declared duplicate language attributes and used a separate parameter rather than the configured locale. | Emit one language attribute using `.Site.Language.Locale`. |
| Embedded pagination was called through the legacy `_internal` template name. | Call `partial "pagination.html" .` in both site and theme. |

The layout changes follow Hugo's
[new template system documentation](https://gohugo.io/templates/new-templatesystem-overview/).
`single.html` and `list.html` remain supported standard layout names. The Go
`template` action remains supported for named blocks; the older agent notes
incorrectly described it as generally deprecated.

## Feed behavior and preserved output

The compatibility migration initially retained `/index.rss` and
`/weblog/index.rss`. The subsequent feed improvements consolidate generation
at `/index.rss` and add Atom 1.0 at `/index.atom`. Both contain the same 15
published weblog entries, selected recursively and sorted by publication date.
Other sections and taxonomies render HTML only. Drafts and future posts are
excluded even when the development server enables them for HTML previews.

The site's wrappers are `home.rss.rss` and `home.atom.atom`: the first suffix
identifies the output format and the second identifies the custom media
extension. They share weblog selection, limits, timestamps, and article content
preparation. Local fallback templates retain `home.rss.xml` and `list.rss.xml` for
Hugo's default XML feed URLs, including generic section and taxonomy behavior.

RSS GUIDs remain the existing HTTPS post permalinks, and Atom uses those same
entry IDs. Publication dates remain unchanged. For significant editorial updates,
add `lastmod` to the post's front matter; otherwise update dates equal the original
publication date. Each feed's update timestamp is the maximum among its included
entries. Empty feeds use a stable Unix epoch timestamp. Git history, file times,
rebuilds, and edits outside the weblog do not advance these timestamps.

Both formats retain full article HTML. Feed preparation decodes title entities,
resolves content URLs against each article's permalink, strips scripts and CSS,
and replaces iframe embeds with ordinary links. Quoted and unquoted links,
fragments, query strings, protocol-relative media, and ordinary responsive image
URL lists are supported. Historical external HTTP hyperlinks are retained;
embedded media must use HTTPS. Code samples remain verbatim. A mismatched figure
closing tag in the historical JazzHub article was repaired at its source.

Themed pages advertise the canonical RSS and Atom URLs and display subscription
links. Handwritten mail, walking, and tutorial archive HTML remains unchanged.

### Feed HTTP configuration and deployment

The hosting repository is
[webpage-docker-containers](https://github.com/pridkett/webpage-docker-containers).
Its `personal-website` service already uses `caddy:alpine`, with the website output
mounted at `/usr/share/caddy`. The `caddy-gen` container handles public hostnames
and HTTPS, forwarding to the website backend on port 80.

`ops/webpage-docker-containers-feeds.patch` applies to hosting repository revision
`9e93dd9`. It adds one read-only configuration mount to `personal-website`:

```yaml
      - ./personal-website:/etc/caddy:ro
```

The patch also adds `personal-website/feeds.caddy`, copied from `ops/feeds.caddy`,
and the following backend `personal-website/Caddyfile`:

```caddyfile
:80 {
    root * /usr/share/caddy
    import /etc/caddy/feeds.caddy
    file_server
}
```

The snippet redirects `/index.xml`, `/weblog/index.rss`, `/weblog/index.xml`, and
legacy tag/category `.xml` or `.rss` feeds to `/index.rss` with HTTP 308. These
routes take precedence over stale files left by historical deployments. Keep the
redirects indefinitely for old subscriptions. It sets the RSS/Atom MIME types,
`Cache-Control: public, max-age=3600`, and `Access-Control-Allow-Origin: *` on the
two canonical feeds. Caddy's file server retains ETag/Last-Modified and 304 support.

Apply the patch from the hosting repository checkout. Publish the website output
containing the two canonical feeds, validate the backend configuration, then
recreate only the website service:

```sh
git apply /path/to/patrick.wagstrom.net/ops/webpage-docker-containers-feeds.patch
docker compose run --rm --no-deps personal-website caddy validate --config /etc/caddy/Caddyfile --adapter caddyfile
docker compose up -d --no-deps --force-recreate personal-website
```

The hosting patch leaves the website content mount and proxy labels in place.
Keep its `personal-website/feeds.caddy` synchronized with `ops/feeds.caddy` when
changing feed delivery settings. After subsequent configuration edits, reload
the backend with:

```sh
docker compose exec personal-website caddy reload --config /etc/caddy/Caddyfile --adapter caddyfile
```

Publishing Hugo output alone will **not** install or reload the server configuration.
Do not enable rsync `--delete`: other historical pages still require investigation.
No production upload or server reload was performed during implementation.

The hosting patch was checked against a clean archive of revision `9e93dd9`, and
the modified Compose configuration parses successfully. Its exact Caddyfile was
validated and exercised in a temporary local Docker container using the same
`caddy:alpine` image (Caddy 2.11.6 at verification). Canonical feed bytes, MIME
types, caching, CORS, both 304 mechanisms, legacy redirects, hostname aliases,
and the historical tutorial archive all passed. This tests the website backend;
the live frontend proxy still requires verification after deployment.

```sh
make check                 # Site, local template, and isolated feed regression checks
make check-feeds-http      # Temporary local server; requires Caddy
```

The HTTP check uses fresh build output, simulates stale feed files, and verifies
redirects, MIME types, caching, CORS, and both conditional request mechanisms.
The feed regression fixture checks identical formats, stable IDs and dates,
editorial updates, exclusion of unrelated pages/drafts/future posts, empty feeds,
URL resolution, code preservation, and deterministic rebuilds. It needs only the
Python standard library and Hugo. The W3C validator code was also run separately
against both generated feeds at their canonical URLs with no errors or warnings;
its dependencies are not required by `make check`. Actual reader UI rendering has
not been tested. After deployment, recheck canonical feeds and legacy redirects
against production and inspect articles in representative readers.

The Hugo compatibility upgrade preserves all **1,592 production file paths**
from a fresh baseline build, including historical weblog URLs, local assets,
and standalone HTML. The subsequent tutorial restoration adds three previously
missing HTML files while retaining every existing path. Tutorial instructions
remain unchanged, and no deployment deletion settings were changed.

## Validation

`make check` now builds in a fresh temporary directory and fails on warnings.
It checks generated output and separately builds a small site using the local
templates, exercising fallback layouts and standard XML feeds. It uses
Python's standard library and needs no additional packages.

Verified:

- Fresh production builds and `make check` with Hugo extended **0.164.0** and
  **0.167.0**, without warnings.
- Standalone theme fixture with Hugo extended **0.158.0**, the declared minimum.
- Draft and future-content build with 0.167.0, without warnings.
- Development server startup with 0.167.0; HTTP 200 for the homepage, weblog,
  pagination, a historical post, feeds, resume, games, mail, and walking pages.
- Valid feed XML, matching 15-entry lists, actual feed self URLs, author metadata,
  full descriptions, and `application/rss+xml` HTTP content type.
- Resume stylesheet references and files; bibliography and screenshot shortcodes;
  legacy IntenseDebate ID mapping; theme asset references; game player markup.
- Standalone theme post/link/weblog rendering, menu exclusion, pagination,
  arbitrary content types, and feed XML including taxonomy outputs.
- Exact equality of generated production file path sets before and after.

This verification covers generation and local HTTP responses. It does not
confirm external comment service availability or browser interaction with the
game emulator. The publishing workflow itself was edited but not run remotely.

To repeat the checks with the installed Hugo:

```sh
make check
```

To check another downloaded Hugo binary without replacing the installed version:

```sh
make check HUGO=/absolute/path/to/hugo
```

Official release packages used for verification were downloaded and extracted
in temporary directories; their SHA-256 digests matched the release metadata.
The installed Homebrew Hugo was left at 0.164.0.

## Remaining work

### Historical tutorials: restored

`content/tutorials/index.md` creates a leaf bundle, so its child tutorial pages
are not generated. Both `/tutorials/pygtkmozembed/index.html` and
`/tutorials/mythTV64/index.html` were missing in the fresh baseline build. This
issue predated this migration and has now been fixed.

The parent is now `content/tutorials/_index.md` with a dedicated section template
and a dated introduction to the archive. A Tutorials navigation link makes both
pages discoverable. The Python tutorial remains in Hugo with the explicit URL
`/tutorials/pygtkmozembed/`, its original instructions and screenshots, and a short
archive note identifying its August 18, 2004 publication date.

The entire MythTV directory was moved to `static/tutorials/mythTV64/`. All 22
files retain their exact original bytes, filenames, and relative paths, including
`index.html`, `googleLinks.html`, XML/XSL source, images, and downloads. Serving
this handwritten archive verbatim preserves `/tutorials/mythTV64/` and avoids
Hugo transforming mixed-case filenames or wrapping its existing HTML document.

Fresh builds retain all 1,592 existing files and add only
`tutorials/pygtkmozembed/index.html`, `tutorials/mythTV64/index.html`, and
`tutorials/mythTV64/googleLinks.html`. `make check` passes on 0.164.0 and 0.167.0,
including navigation, listing dates, local links and section fragments, and exact
byte comparisons for every static archive file. Original tutorial text was kept;
the listing now describes the pages as historical tutorials from 2004–2006.

The current rsync command does not delete remote files, which may have let old
production tutorial pages survive despite their previously missing build output.
Do not add deletion until other historical output gaps have been reconciled.

Some historical assets in `public/resources/` are still tracked despite
`public/` being ignored. They were restored after clean-build verification and
are unchanged by this migration. Avoid cleaning the working tree's `public/`
directory during checks; the new check command uses temporary output instead.

### Frontend dependencies

The Hugo migration preserved Bootstrap **3.3.5**, jQuery **2.1.4**, Bootswatch
styles, and Font Awesome. A subsequent frontend cleanup removed the Bootstrap
and jQuery runtime includes, migrated layouts and controls to semantic native
CSS, and removed `params.theme`. Font Awesome remains separate. Legacy framework
files retain their public URLs; deployment still must not delete archive assets.
The résumé keeps its custom screen/print styles, 11.8pt print type, 1.23 line
height, and 0.5in body margins. See the
[frontend cleanup validation](frontend-cleanup/resume-css/README.md) for rendered
desktop/mobile, palette, and print evidence.

### Publishing site changes

All template and asset changes now belong in this repository. Review and commit
them using the project's Conventional Commit and co-author trailer requirements.
Run `make check` from a fresh checkout before deploying; no submodule initialization
or separate theme push is needed. Deployment still requires an explicit request.
Leave the pre-existing untracked game-showcase documents and shortcode backup
out of this migration.
