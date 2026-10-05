# Non-résumé CSS migration

This records the task 2 checkpoint. The subsequent
[résumé migration](../resume-css/README.md) removes the final runtime dependency
and replaces the temporary résumé-only assertions described below.

Task 2 completed locally after the JavaScript cleanup chat completed successfully.
Non-résumé pages no longer select Bootstrap/Bootswatch CSS. The shared header
retains it on the résumé until the separate résumé migration. Legacy stylesheet,
JavaScript, and font files remain at their existing URLs.

Page wrappers, fallback lists/posts, gallery entries, and game actions use
purpose-specific classes. Grid/Flexbox handles the gallery and list rows; a small
native typography layer defines element spacing, tables, quotes, code, and
controls. Hugo's embedded pagination markup is styled only inside `pw-pagination`.
The homepage, Font Awesome, feed renderers, résumé content/templates, and raw
historical archives were not edited.

Visible adjustments are limited to usable mobile gallery captions, list rows
with their own headings and dates, scrolling long code lines, and an archive
note using the site's palette. Taxonomies now show their own title rather than
“Posts.” Bibliography data and its existing page styles are unchanged.

Validation:

- `make check` passed on installed Hugo **0.164.0** and
  `/private/tmp/patrick-hugo-0.167.0/unpacked/Payload/hugo` (**0.167.0**).
- Regression checks require the résumé stylesheet and reject Bootstrap on other
  shared-shell pages; they recognize the native screenshot markup.
- Before/after captures cover 19 routes/fixtures at **1440 × 1000** and
  **390 × 844**, with both light and dark palettes. No final view overflows the
  viewport or returns a non-200 status. The populated fixtures cover fallback
  posts/lists and taxonomy index/term pages, including quotes, code, and tables.
- Homepage, résumé, and year-archive screenshots are byte-identical in all four
  combinations. All **408** generated weblog article bodies remain unchanged.
  Legacy static assets, MythTV archive bytes, and standalone mail/walking pages
  are unchanged; public page routes are preserved.
- On the migrated game page, pause/resume, sound/mute, fullscreen/exit worked in
  all four combinations. Download/fullscreen actions are at least 44 px tall.
- `git diff --check` passed. No staging, commit, upload, or deployment occurred.

The screenshots block external requests to isolate local styling; they do not
verify comment submission, external links, or external services. Game captures
wait for the ROM to initialize; the animated game screen can differ between
captures. Some historical article media already has missing files in both builds.

| Comparison group | Desktop light | Desktop dark | Mobile light | Mobile dark |
| --- | --- | --- | --- | --- |
| Research, publications, gallery, tutorials | [View](pages-desktop-light.jpg) | [View](pages-desktop-dark.jpg) | [View](pages-mobile-light.jpg) | [View](pages-mobile-dark.jpg) |
| Writing and old articles | [View](writing-desktop-light.jpg) | [View](writing-desktop-dark.jpg) | [View](writing-mobile-light.jpg) | [View](writing-mobile-dark.jpg) |
| Homepage, games, résumé, categories | [View](games-shell-desktop-light.jpg) | [View](games-shell-desktop-dark.jpg) | [View](games-shell-mobile-light.jpg) | [View](games-shell-mobile-dark.jpg) |
| Populated fallback fixtures | [View](fallbacks-desktop-light.jpg) | [View](fallbacks-desktop-dark.jpg) | [View](fallbacks-mobile-light.jpg) | [View](fallbacks-mobile-dark.jpg) |
| Fullscreen game | [View](fullscreen-desktop-light.jpg) | [View](fullscreen-desktop-dark.jpg) | [View](fullscreen-mobile-light.jpg) | [View](fullscreen-mobile-dark.jpg) |

[The bounded migration diff](migration.diff) excludes earlier shared-checkout
work. [Before metrics](before-metrics.json), [fixture baseline metrics](before-fixture-metrics.json),
and [final metrics](after-metrics.json) record routes, stylesheets, dimensions,
heading sizes, action sizes, and game smoke results.

At this checkpoint, the remaining Bootstrap runtime dependency was **résumé only**. Task 3 replaces
its content/template classes, remove its header selection and the temporary
résumé-only assertions, and retire the `.pw-resume` Bootstrap overrides in
`site.css`. Keep legacy asset files available.
