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

**Hugo Version**: v0.152.2+extended+withdeploy (as of 2025-11-30)

**Known Issues**:
- The site currently fails to build/serve with template errors
- Primary error: `html/template:weblog/rss.xml:2:13: no such template "_default/rss.xml"`
- Warning: `Unknown kind "weblog" in outputs configuration`

These issues are related to template system changes in newer versions of Hugo and need to be addressed.

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
