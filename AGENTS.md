# Technical Reference for Claude Agents

This document provides detailed technical information for AI agents working on patrick.wagstrom.net. For a general overview, see [CLAUDE.md](CLAUDE.md).

## Current Critical Issues

### Template Error on Startup

**Error Message**:
```
WARN  Unknown kind "weblog" in outputs configuration.
Error: html/template:weblog/rss.xml:2:13: no such template "_default/rss.xml"
```

**Root Cause Analysis**:

1. **Template Reference Issue**: The file [layouts/weblog/rss.xml](layouts/weblog/rss.xml) attempts to reference `_default/rss.xml` using the old template syntax:
   ```
   {{- template "_default/rss.xml" . }}
   ```

2. **Hugo Version Changes**: Modern Hugo versions (v0.152.2+) have changed how templates are resolved and referenced. The `template` function for referencing templates has different behavior.

3. **Output Configuration**: The [config.yaml](config.yaml) file defines custom outputs for "weblog" kind:
   ```yaml
   outputs:
     weblog:
       - RSS
       - html
   ```
   However, "weblog" is not a recognized Hugo kind (valid kinds are: page, home, section, taxonomy, term). This is likely causing the warning.

**Files Involved**:
- [layouts/weblog/rss.xml](layouts/weblog/rss.xml) - Custom RSS template that fails
- [layouts/_default/rss.xml](layouts/_default/rss.xml) - The template being referenced
- [layouts/section/weblog.rss.xml](layouts/section/weblog.rss.xml) - Another RSS template
- [themes/hugo-theme-patrick-custom/layouts/rss.xml](themes/hugo-theme-patrick-custom/layouts/rss.xml) - Theme's RSS template
- [config.yaml](config.yaml):84-95 - Output configuration

**Potential Solutions**:

1. **Update Template Reference**: Change from `template` to `define` and `block` patterns, or directly inline the RSS template
2. **Fix Output Configuration**: Change `weblog:` to `section:` in the outputs configuration, since weblog is a section, not a kind
3. **Consolidate RSS Templates**: Consider whether all these RSS templates are necessary or if they should be merged
4. **Use Hugo's Built-in RSS**: Consider using Hugo's internal RSS template with customization via params

## Hugo Configuration Details

### Config File Structure ([config.yaml](config.yaml))

**Base Settings**:
- Base URL: `https://patrick.wagstrom.net/`
- Title: "patrick dot wagstrom dot net"
- Language: en-us
- Theme: `hugo-theme-patrick-custom`

**Important Parameters** ([config.yaml](config.yaml):22-81):
- `subtitle`: Site tagline
- `author`: Patrick Wagstrom <patrick@wagstrom.net>
- Social media links (GitHub, YouTube, Stack Overflow, LinkedIn)
- `theme.inverse`: true (Bootstrap inverse theme)
- `theme.name`: "superhero"
- `commentsengine`: intensedebate
- `commentsmapping`: Legacy URL mappings for comments (60 entries)
- `relativePaths`: true
- `resumeShowPhone`: true (controls phone display in resume)

**Markup Configuration** ([config.yaml](config.yaml):17-20):
- Goldmark renderer with `unsafe: true` enabled (allows raw HTML in markdown)

**Output Formats** ([config.yaml](config.yaml):84-96):
```yaml
outputs:
  weblog:      # PROBLEM: "weblog" is not a valid Hugo kind
    - RSS
    - html
  page:
    - html

outputFormats:
  RSS:
    mediaType: "application/rss+xml"
    baseName: "index"
    suffixes: ".rss"
```

### Menu Configuration ([config.yaml](config.yaml):6-11)

Single menu item pointing to the blog:
```yaml
menu:
  main:
  - identifier: Blog
    name: Blog
    url: /weblog/
    weight: -100
```

## Content Structure

### Weblog Content

**Location**: [content/weblog/](content/weblog/)

**Statistics**:
- 400+ markdown files
- Date range: 2002 to 2021
- File naming: `YYYY-MM-DD-slug.md` or `YYYY-MM-DD-slug.markdown.md`

**Front Matter Example** (from [content/weblog/2021-07-19-disabling-ipv6-dns-on-a-udm-pro.md](content/weblog/2021-07-19-disabling-ipv6-dns-on-a-udm-pro.md)):
```yaml
---
title: "Disabling IPv6 DNS on Unifi Devices"
slug: disabling-ipv6-dns-on-unifi
date: 2021-07-19T21:03:22-04:00
tags:
- unifi
- unifios
url: /weblog/2021/07/21/disabling-ipv6-dns-on-unifi
draft: true
---
```

**Important Notes**:
- Many posts have custom `url` field for backwards compatibility
- Posts use `Type: weblog` implicitly from directory structure
- No [content/weblog/_index.md](content/weblog/_index.md) file exists (may need to be created)

### Other Content Sections

- **resume/** - Resume content with custom CSS ([content/resume/print.css](content/resume/print.css), [content/resume/resume.css](content/resume/resume.css))
- **publications/** - Academic publications
- **research/** - Research projects
- **media/** - Media files and screenshots
- **thesis/** - Thesis-related content
- **tutorials/** - Tutorial content
- **walking/** - Walking-related content

## Layout/Template Architecture

### Template Hierarchy

The site uses a two-layer template system:

1. **Theme Layer**: [themes/hugo-theme-patrick-custom/layouts/](themes/hugo-theme-patrick-custom/layouts/)
   - Base templates
   - Partials (header, footer, navbar)
   - Default RSS template

2. **Override Layer**: [layouts/](layouts/)
   - Site-specific overrides
   - Section-specific templates
   - Custom RSS templates

### Key Layout Files

**Root Layouts** ([layouts/](layouts/)):
- [index.html](layouts/index.html) - Homepage
- [_default/rss.xml](layouts/_default/rss.xml) - Default RSS template (simple version)
- [_default/post-snippet.html](layouts/_default/post-snippet.html) - Post excerpt display

**Weblog Layouts** ([layouts/weblog/](layouts/weblog/)):
- [single.html](layouts/weblog/single.html) - Individual blog post
- [rss.xml](layouts/weblog/rss.xml) - **BROKEN** - Tries to call `_default/rss.xml`

**Section Layouts** ([layouts/section/](layouts/section/)):
- [weblog.html](layouts/section/weblog.html) - Weblog list page
- [weblog.rss.xml](layouts/section/weblog.rss.xml) - Another weblog RSS template

**Shortcodes** ([layouts/shortcodes/](layouts/shortcodes/)):
- [bib.html](layouts/shortcodes/bib.html) - Bibliography formatting
- [year.html](layouts/shortcodes/year.html) - Current year display
- [screenshots.html](layouts/shortcodes/screenshots.html) - Screenshot galleries
- [infolink.html](layouts/shortcodes/infolink.html) - Info links
- [phonelink.html](layouts/shortcodes/phonelink.html) - Phone number linking

**Resume Layouts** ([layouts/resume/](layouts/resume/)):
- [single.html](layouts/resume/single.html) - Resume page with custom print handling

**Theme Layouts** ([themes/hugo-theme-patrick-custom/layouts/](themes/hugo-theme-patrick-custom/layouts/)):
- [rss.xml](themes/hugo-theme-patrick-custom/layouts/rss.xml) - Theme's RSS template (checks for "post" and "link" types)
- [index.html](themes/hugo-theme-patrick-custom/layouts/index.html) - Theme homepage
- [_default/list.html](themes/hugo-theme-patrick-custom/layouts/_default/list.html) - Default list template
- [post/single.html](themes/hugo-theme-patrick-custom/layouts/post/single.html) - Post single page
- [page/single.html](themes/hugo-theme-patrick-custom/layouts/page/single.html) - Page single page

### Template Partials ([themes/hugo-theme-patrick-custom/layouts/partials/](themes/hugo-theme-patrick-custom/layouts/partials/))

- [header.html](themes/hugo-theme-patrick-custom/layouts/partials/header.html) - Site header
- [footer.html](themes/hugo-theme-patrick-custom/layouts/partials/footer.html) - Site footer
- [navbar.html](themes/hugo-theme-patrick-custom/layouts/partials/navbar.html) - Navigation bar

## Build System

### Makefile Configuration ([Makefile](Makefile))

**Variables**:
```makefile
THEME=hugo-theme-patrick-custom
HUGO_BUILD_OPTS=--logLevel info --verbose
HUGO_SERVE_LOGFILE=hugo_serve.log
HUGO_SERVE_OPTS=--logLevel info --disableFastRender -D -F
```

**Targets**:
- `make build` - Builds site with verbose logging
- `make serve` - Runs dev server with drafts (-D) and future posts (-F)
- `make upload` - Rsyncs to production server (patrick@pridkett.xen.prgmr.com:public_html)

**Note**: The `--theme ${THEME}` flag is used in Makefile but is also set in config.yaml. This redundancy is fine but could be simplified.

## RSS Template Issues

### Multiple RSS Templates

The project has **4 different RSS template files**:

1. [layouts/_default/rss.xml](layouts/_default/rss.xml) - Simple RSS 2.0 template
2. [layouts/weblog/rss.xml](layouts/weblog/rss.xml) - **BROKEN** - Tries to call #1
3. [layouts/section/weblog.rss.xml](layouts/section/weblog.rss.xml) - Empty/minimal
4. [themes/hugo-theme-patrick-custom/layouts/rss.xml](themes/hugo-theme-patrick-custom/layouts/rss.xml) - Full template for "post" and "link" types

### Template Lookup Order

For weblog RSS, Hugo looks for templates in this order:
1. `layouts/weblog/rss.xml` ← This exists and is BROKEN
2. `layouts/section/weblog.rss.xml` ← This also exists
3. `layouts/_default/rss.xml` ← This exists
4. `themes/hugo-theme-patrick-custom/layouts/rss.xml` ← This exists

The problem is that #1 finds [layouts/weblog/rss.xml](layouts/weblog/rss.xml) first, which tries to call `_default/rss.xml` but fails.

### RSS Template Content Type Detection

The theme's RSS template ([themes/hugo-theme-patrick-custom/layouts/rss.xml](themes/hugo-theme-patrick-custom/layouts/rss.xml):14-34) checks for:
- `Type "post"` - Regular blog posts
- `Type "link"` - Linklog entries

But the weblog content has `Type "weblog"`, not "post", so this template wouldn't work correctly either.

## Git Repository Structure

### Submodules

The project uses git submodules for the theme:
```
[submodule "themes/hugo-theme-patrick-custom"]
    path = themes/hugo-theme-patrick-custom
    url = [theme repository URL]
```

**Current Status**: The submodule shows as modified in git status (`m themes/hugo-theme-patrick-custom`)

### Ignored Files ([.gitignore](. gitignore))

- `public/` - Generated site
- `.hugo_build.lock` - Hugo lock file (but this is currently tracked!)
- Various build artifacts

## Development Environment

**Hugo Version**: v0.152.2+extended+withdeploy darwin/arm64 BuildDate=2025-10-24T15:31:49Z
**Platform**: macOS (darwin/arm64)
**Installation**: via Homebrew

## Troubleshooting Guide

### Template Errors

**Issue**: `no such template "_default/rss.xml"`

**Debug Steps**:
1. Check template lookup order
2. Verify template syntax (use `define`/`block` instead of `template`)
3. Check Hugo version compatibility
4. Review output format configuration

**Fix Approaches**:
1. Remove [layouts/weblog/rss.xml](layouts/weblog/rss.xml) and let Hugo use default lookup
2. Fix the template reference syntax
3. Inline the RSS template directly
4. Use Hugo's internal RSS template

### Output Configuration Warnings

**Issue**: `Unknown kind "weblog" in outputs configuration`

**Explanation**: Hugo has specific "kinds" (page, home, section, taxonomy, term). "weblog" is a content TYPE, not a KIND. The weblog directory is a SECTION.

**Fix**: Change [config.yaml](config.yaml):85 from:
```yaml
outputs:
  weblog:
```
to:
```yaml
outputs:
  section:
```

### Content Not Appearing

**Possible Causes**:
1. Draft status (`draft: true` in front matter)
2. Future date (requires `-F` flag)
3. Missing `_index.md` in section
4. Template not matching content type

## Migration Notes (Hugo Version Compatibility)

### Changes in Modern Hugo

1. **Template Function Changes**: The `template` function has different behavior
2. **Output Format Configuration**: More strict validation of kinds vs types
3. **RSS Template**: Internal templates have changed
4. **Goldmark**: Default markdown renderer (already configured)

### Deprecated Patterns

1. Using `template` to include other templates (use `define`/`block`)
2. Configuring outputs by content type instead of kind
3. `.Data.Pages` (use `.Pages` directly)

### Recommended Updates

1. Update all RSS templates to use modern Hugo patterns
2. Fix output configuration to use proper kinds
3. Consider consolidating multiple RSS templates
4. Add section `_index.md` files where missing
5. Review and update theme templates for modern Hugo

## Testing Checklist

Before considering the site fixed:

- [ ] `hugo server` starts without errors
- [ ] Homepage loads correctly
- [ ] Weblog list page (/weblog/) displays posts
- [ ] Individual blog posts render correctly
- [ ] RSS feed generates without errors (/weblog/index.rss)
- [ ] Resume section renders with custom CSS
- [ ] All shortcodes work correctly
- [ ] Legacy URLs redirect properly
- [ ] IntenseDebate comments load on appropriate posts
- [ ] Navigation menu works
- [ ] `hugo build` completes successfully
- [ ] No warnings in console output

## Reference Links

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Template Lookup Order](https://gohugo.io/templates/lookup-order/)
- [Hugo Output Formats](https://gohugo.io/templates/output-formats/)
- [Hugo Content Types](https://gohugo.io/content-management/types/)
- [Hugo RSS Templates](https://gohugo.io/templates/rss/)
- [Goldmark Configuration](https://gohugo.io/getting-started/configuration-markup/)

## Quick Reference: File Locations

### Configuration
- Main config: [config.yaml](config.yaml)
- Build config: [Makefile](Makefile)

### Content
- Blog posts: [content/weblog/](content/weblog/)
- Resume: [content/resume/](content/resume/)
- Home page: [content/_index.md](content/_index.md)

### Templates
- Site layouts: [layouts/](layouts/)
- Theme layouts: [themes/hugo-theme-patrick-custom/layouts/](themes/hugo-theme-patrick-custom/layouts/)
- Weblog templates: [layouts/weblog/](layouts/weblog/) and [layouts/section/weblog.html](layouts/section/weblog.html)
- RSS templates: Multiple locations (see RSS Template Issues section)

### Static Assets
- Static files: [static/](static/)
- Resume CSS: [content/resume/*.css](content/resume/)

### Theme
- Custom theme: [themes/hugo-theme-patrick-custom/](themes/hugo-theme-patrick-custom/) (git submodule)
- Alternate theme: [themes/hugo-theme-patrick-custom-working/](themes/hugo-theme-patrick-custom-working/) (appears to be a backup)
