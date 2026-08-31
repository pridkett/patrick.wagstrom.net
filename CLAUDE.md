# Patrick Wagstrom's Website - Claude Code Documentation

This is the source code for Patrick Wagstrom's personal website and blog, built using [Hugo](https://gohugo.io/), a static site generator written in Go.

## Quick Start

```bash
# Build the site
make build

# Serve locally for development
make serve

# Upload to production
make upload
```

## Current Status

**Hugo Version**: v0.164.0+extended+withdeploy (as of 2026-08-30)

`make build` and `make serve` both work. Getting there required several
fixes for changes in Hugo since v0.102:

- `security.allowContent` in [config.yaml](config.yaml) re-allows raw `.html`
  files under `content/` (Hugo now rejects `text/html` content by default).
- `.Site.Author` was removed; the RSS templates use `params.authorName` /
  `params.authorEmail` instead.
- [layouts/_default/single.html](layouts/_default/single.html) is the fallback
  template for pages with no type-specific layout, so the standalone HTML pages
  under `content/mail` and `content/walking` render verbatim as they always have.
- The theme's RSS template was renamed `layouts/rss.xml` -> `layouts/index.rss`.
- `hugo --verbose` was removed, so it is gone from the Makefile.

**Known Issues**:
- `content/tutorials/index.md` should probably be `_index.md`. As named, it makes
  `tutorials` a leaf bundle, so `/tutorials/mythTV64/` is never rendered. It only
  still works in production because `make upload` rsyncs without `--delete`.
- Deprecation warnings remain for `languageCode` (use `locale`), `.Site.Data`
  (use `hugo.Data`), and `.Site.LanguageCode` (use `.Site.Language.Locale`); the
  last two live in the theme submodule.
- Sections other than `weblog` request an RSS output format they have no
  template for, which logs a warning per build.

## Project Structure

```
.
├── config.yaml           # Main Hugo configuration
├── Makefile             # Build automation
├── content/             # All site content (markdown files)
│   ├── weblog/         # Blog posts (400+ posts dating back to 2002)
│   ├── resume/         # Resume content and styling
│   ├── publications/   # Academic publications
│   └── ...
├── layouts/            # Site-specific layout overrides
│   ├── weblog/        # Weblog-specific layouts
│   ├── resume/        # Resume-specific layouts
│   └── _default/      # Default layouts and RSS templates
├── themes/            # Hugo themes
│   └── hugo-theme-patrick-custom/  # Custom theme (git submodule)
└── static/           # Static assets (images, CSS, etc.)
```

## Key Concepts

### Content Types
The site uses several Hugo content types:
- `weblog`: Blog posts (400+ posts)
- `resume`: Resume/CV content
- `page`: General pages
- `publications`: Academic publications
- `research`: Research projects

### Custom "weblog" Type
The site defines a custom content type called "weblog" for blog posts. This is configured in [config.yaml](config.yaml):
- Custom output formats (RSS + HTML)
- Custom RSS template at [layouts/weblog/rss.xml](layouts/weblog/rss.xml)
- Custom section template at [layouts/section/weblog.html](layouts/section/weblog.html)

### Theme Structure
The site uses a custom theme located at `themes/hugo-theme-patrick-custom/` (a git submodule). The theme provides base templates, and the root `layouts/` directory provides overrides and extensions.

## Common Tasks

For detailed information about specific tasks and technical details, see [AGENTS.md](AGENTS.md).

### Running the Development Server
```bash
make serve
```
This starts Hugo's built-in server with:
- Draft content enabled (`-D`)
- Future posts enabled (`-F`)
- Fast render disabled (`--disableFastRender`)
- Info-level logging

### Building for Production
```bash
make build
```
Generates static files in the `public/` directory.

### Deploying to Production
```bash
make upload
```
Uses rsync to upload to the production server.

## Git Information

**Current Branch**: master
**Main Branch**: (not configured in git)

**Notable Uncommitted Changes** (as of last check):
- Modified: Makefile, config.yaml, resume files
- New files in resume/ directory
- Modified theme submodule

## Important Notes

1. **Don't Break History**: The weblog contains 400+ posts dating back to 2002. URLs and permalinks should be preserved.

2. **Theme is a Git Submodule**: The `themes/hugo-theme-patrick-custom/` directory is a git submodule. Changes to the theme require separate commits in the theme repository.

3. **Resume Special Handling**: The resume section has custom CSS and print styles. There's a `resumeShowPhone` parameter in config.yaml that controls phone number display.

4. **Comment System**: The site uses IntenseDebate for comments with a mapping for legacy URLs.

## Getting Help

For detailed technical information about the Hugo configuration, template issues, and troubleshooting, see [AGENTS.md](AGENTS.md).

## License

See [LICENSE](LICENSE) for details.
