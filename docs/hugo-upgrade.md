# Hugo upgrade audit

Audit date: October 4, 2026.

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

The existing feeds remain `/index.rss` and `/weblog/index.rss`, each containing
the same 15 weblog entries and full post content. Both retain the weblog channel
title and page link; their self links now identify the actual feed being read.
Author metadata is preserved. Locale output now uses `en-US`.

The site's wrapper names are `home.rss.rss` and `weblog/section.rss.rss`: the first
`rss` identifies the output format and the second identifies the custom media
extension. The standalone theme supplies `home.rss.xml` and `list.rss.xml` for
Hugo's default XML feed URLs. These all call the same renderer. The theme's
generic feeds support section, taxonomy, and term pages when enabled by a site.

The Hugo compatibility upgrade preserves all **1,592 production file paths**
from a fresh baseline build, including historical weblog URLs, local assets,
and standalone HTML. The subsequent tutorial restoration adds three previously
missing HTML files while retaining every existing path. Tutorial instructions
remain unchanged, and no deployment deletion settings were changed.

## Validation

`make check` now builds in a fresh temporary directory and fails on warnings.
It checks generated output and separately builds a small site using only the
theme, so project overrides cannot hide obsolete theme templates. It uses
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

The theme bundles Bootstrap **3.3.5**, jQuery **2.1.4**, Bootswatch styles, and
Font Awesome. The Hugo migration preserves those files and the current visual
appearance. Updating them requires its own migration: Bootstrap's grid,
navigation, buttons, labels, and custom CSS cannot be replaced by current
Bootstrap assets without adapting the templates. Review the game showcase and
resume print styling as part of that work.

### Publishing the theme changes

The theme is a Git submodule, so the work belongs to two repositories. Before
publishing the updated site:

1. Review and commit the theme changes in
   `themes/hugo-theme-patrick-custom`, using the project's Conventional Commit
   and co-author trailer requirements.
2. Commit the site changes and the updated theme submodule reference together.
3. Run `make check` from a fresh checkout with submodules initialized before
   deploying.
4. When publishing, push the theme commit before the site commit so GitHub
   Actions can fetch the updated submodule.

Committing only the site changes would retrieve the previous theme on a clean
checkout. Leave the pre-existing untracked game-showcase documents and shortcode
backup out of this migration.
