# Patrick Wagstrom's website

This personal website and weblog uses [Hugo](https://gohugo.io/). Templates,
archetypes, and frontend assets live in this repository; there is no external theme.

## Development

```sh
make build
make serve
make check
```

`make serve` includes drafts and future posts. `make check` builds in a fresh
temporary directory, fails on warnings, and checks the site, isolated fallback
templates, and feed regressions. Use `HUGO=/absolute/path/to/hugo` to choose a binary.
`make upload` builds and deploys to production; use it only when requested.

## Compatibility

The publishing workflow pins Hugo extended **0.167.0**. Site and template
checks also pass on **0.164.0**. The site requires **0.158.0** or later.
Templates use modern lookup paths (`home.html`, `_partials`, `_shortcodes`, and
`weblog/section.html`), `hugo.Data`, `.Site.Language.Locale`, and the embedded
pagination partial. RSS author fields come from `params.authorName` and
`params.authorEmail`.

The canonical `/index.rss` and `/index.atom` feeds contain the same 15 full-content posts.
Shared renderers live in `layouts/_partials/`, with home wrappers for the custom
media extensions. Non-blog sections and taxonomies use
HTML only. Raw HTML pages remain enabled through `security.allowContent` and a
site `single.html` fallback that emits the content verbatim.

## Structure and preservation

- `config.yaml` configures the site, outputs, menus, and legacy comment mappings.
- `content/` contains weblog posts, resume, publications, games, and other pages.
- `layouts/` contains all templates, shared helpers, and shortcodes.
- `archetypes/` contains post and external-link content templates.
- `static/` contains frontend assets, including the Game Boy emulator.

Preserve existing URLs and explicit weblog front matter. Resume CSS and print
handling remain custom; `resumeShowPhone` controls phone display.

Template and asset changes belong in this repository. The former theme's MIT
notice is retained in `docs/licenses/hugo-theme-patrick-custom.txt`.
Shared-shell pages use focused native CSS and semantic Grid/Flexbox layouts.
Bootstrap/Bootswatch and jQuery are no longer runtime dependencies; their legacy
asset URLs remain available. Do not reintroduce their includes or `params.theme`.
Font Awesome remains separate. The résumé has scoped screen and print styles,
with 11.8pt print type, 1.23 line height, and 0.5in body margins.

Historical tutorials remain available at `/tutorials/`, a branch bundle, but are
omitted from shared navigation. The Python tutorial keeps `/tutorials/pygtkmozembed/` and its original
content with a dated archive note. The MythTV archive lives in
`static/tutorials/mythTV64/`, preserving original HTML and every case-sensitive
filename byte for byte. Checks cover all local tutorial links and fragments.
Investigate other historical output gaps before enabling deletion during deployment.

See [AGENTS.md](AGENTS.md) for agent instructions and
[docs/hugo-upgrade.md](docs/hugo-upgrade.md) for the audit and validation details.
