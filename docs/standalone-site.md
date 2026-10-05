# Standalone Hugo site

The site no longer requires a Hugo theme or Git submodule. The remaining files
from `pridkett/hugo-theme-patrick-custom` at commit
`33319dbb039ba1e67bcc846058729210741a1a27` were brought into this repository.
Existing site templates and styles took precedence during the move.

- `layouts/` owns all page templates, fallback lists and post/link layouts,
  feed renderers, and shared helpers.
- `archetypes/` owns the existing post and external-link content templates.
- `static/` owns the existing Bootswatch CSS, Font Awesome fonts/CSS, jQuery,
  Bootstrap JavaScript, and favicon assets. Their public paths and bytes are
  preserved, including the alternate Bootswatch stylesheets.
- `docs/licenses/hugo-theme-patrick-custom.txt` preserves the theme's MIT notice.
  Third-party license comments remain in their original assets.

The old theme's overridden layouts, unused navigation/homepage helpers, preview
images, and theme metadata are not needed by the site. `.gitmodules`, the theme
Git link, the Hugo `theme` setting, Makefile `--theme` arguments, and CI submodule
checkout were removed. The subsequent frontend cleanup also removed
`params.theme` and all shared-shell Bootstrap/Bootswatch and jQuery includes.
`config.yaml` retains the minimum Hugo version
of 0.158.0, and production uses extended 0.167.0.

Use `make build`, `make serve`, and `make check` directly after cloning.
`make check` builds in temporary directories, exercises the local fallback
templates and standard XML feeds in an isolated fixture, and runs the existing
canonical feed regressions. It does not download a theme. The canonical site
feeds remain `/index.rss` and `/index.atom`; other sections still produce HTML only.

The initial consolidation was an ownership change for templates and assets.
The subsequent frontend cleanup replaced Bootstrap layout and control classes
with semantic classes and focused Grid/Flexbox CSS, including the résumé.
Shared-shell pages load no Bootstrap CSS/JavaScript or jQuery. Font Awesome
remains separate, and all historical asset URLs, handwritten HTML, downloadable
résumés, and deployment behavior are preserved. The résumé keeps its scoped
11.8pt print typography and three-page Chromium Letter layout.

See [the non-résumé migration evidence](frontend-cleanup/non-resume-css/README.md)
and [the résumé and final cleanup evidence](frontend-cleanup/resume-css/README.md).

Validation with Hugo extended 0.164.0 and 0.167.0 passed the site, isolated template,
and feed regression checks. A fresh before/after build with 0.167.0 preserved all
1,640 generated file paths; assets and canonical feeds were byte-identical. Six
HTML files differed only in the display casing of the existing `OpenBSD` term,
whose historical front matter uses mixed capitalization. No taxonomy URLs changed.
