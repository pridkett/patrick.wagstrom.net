# Patrick Wagstrom's website

This personal website and weblog uses [Hugo](https://gohugo.io/) and a custom
Bootstrap/Bootswatch theme stored as a Git submodule.

## Development

```sh
git submodule update --init --recursive
make build
make serve
make check
```

`make serve` includes drafts and future posts. `make check` builds in a fresh
temporary directory, fails on warnings, and checks both the site and the theme
without site overrides. Use `HUGO=/absolute/path/to/hugo` to choose a binary.
`make upload` builds and deploys to production; use it only when requested.

## Compatibility

The publishing workflow pins Hugo extended **0.167.0**. Site and standalone theme
checks also pass on **0.164.0**. The theme requires **0.158.0** or later.
Templates use modern lookup paths (`home.html`, `_partials`, `_shortcodes`, and
`weblog/section.html`), `hugo.Data`, `.Site.Language.Locale`, and the embedded
pagination partial. RSS author fields come from `params.authorName` and
`params.authorEmail`.

The home and weblog feeds retain their `.rss` URLs and 15 full-content posts.
The shared renderer lives in the theme's `_partials/rss.html`; the site supplies
wrappers for its custom media extension. Non-blog sections and taxonomies use
HTML only. Raw HTML pages remain enabled through `security.allowContent` and a
site `single.html` fallback that emits the content verbatim.

## Structure and preservation

- `config.yaml` configures the site, outputs, menus, and legacy comment mappings.
- `content/` contains weblog posts, resume, publications, games, and other pages.
- `layouts/` contains site overrides and shortcodes.
- `themes/hugo-theme-patrick-custom/` contains the theme submodule.
- `static/` contains additional assets, including the Game Boy emulator.

Preserve existing URLs and explicit weblog front matter. Resume CSS and print
handling remain custom; `resumeShowPhone` controls phone display.

Theme changes need a separate theme commit and push before updating the site
submodule reference. The bundled Bootstrap 3.3.5 and jQuery 2.1.4 still use the
existing appearance and need a separate frontend migration if upgraded.

Historical tutorials are linked from navigation at `/tutorials/`, now a branch
bundle. The Python tutorial keeps `/tutorials/pygtkmozembed/` and its original
content with a dated archive note. The MythTV archive lives in
`static/tutorials/mythTV64/`, preserving original HTML and every case-sensitive
filename byte for byte. Checks cover all local tutorial links and fragments.
Investigate other historical output gaps before enabling deletion during deployment.

See [AGENTS.md](AGENTS.md) for agent instructions and
[docs/hugo-upgrade.md](docs/hugo-upgrade.md) for the audit and validation details.
