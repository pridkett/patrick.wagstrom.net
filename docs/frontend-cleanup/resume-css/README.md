# Résumé migration and final frontend cleanup

Task 3 completed after the non-résumé CSS migration chat finished successfully.
The résumé now uses a semantic `main`, contact `aside`, identity heading, and
experience/education sections. Grid supplies the desktop sidebar; the layout
stacks below 992 px. Flexbox supplies contact icon alignment and Download/Print
controls. The résumé's text, phone shortcode, headshot, and existing PDF target
are preserved.

The final Bootstrap/Bootswatch stylesheet include and obsolete `params.theme`
configuration are removed. All shared-shell pages use focused native CSS and
load no Bootstrap CSS, Bootstrap JavaScript, or jQuery. Font Awesome remains
separate. Temporary résumé framework overrides in `site.css` and unused
`.white-rounded`/`.jumbotron` rules in `style.css` are removed; source inspection
found no remaining consumers in templates, content, or active assets.
Historical framework assets, third-party license notices, public URLs, and
the pre-existing shared-checkout work are preserved.

Validation on October 4, 2026:

- `make check` passed on installed Hugo extended **0.164.0** and
  `make check HUGO=/private/tmp/patrick-hugo-0.167.0/unpacked/Payload/hugo`
  passed on extended **0.167.0**. These include site, isolated fallback template,
  legacy URL, archive byte, canonical feed, and shortcode regressions.
- Permanent checks now reject framework includes on every shared-shell page
  and isolated fixture. They verify native résumé structure and controls,
  reject layout/button classes and accidental Markdown code blocks, and check
  that every résumé PDF is copied without byte changes.
- The source audit found no Bootstrap/jQuery runtime references or theme
  selection in `layouts/`, `assets/`, or `archetypes/`. Framework files remain
  under `static/`; historical blog prose and the unrendered `resume_data.md`
  resource retain their archival references/content.
- Chromium checked **48** page/viewport/palette combinations: 12 routes at
  **1440 × 900** and **390 × 900**, each in light and dark mode. There was no
  horizontal page overflow, framework request, or JavaScript exception.
  Routes cover the résumé, homepage, publications, research, screenshots,
  tutorials and the Python archive, weblog archive, recent-page pagination,
  a legacy article, games library, and Amelia's game page.
- Additional résumé checks at **320**, **820**, and **992** px passed. The email
  address and envelope icon remain inline within the sidebar. Download returns
  the original PDF bytes; the Print button calls `window.print()`.
- Default phone visibility remains off. A separate build with
  `params.resumeShowPhone: true` renders the phone; its icon appears on screen
  and hides in print while the contact text remains.
- All **19** downloadable résumé PDFs retain their original SHA-256 hashes.
  The résumé source text and shortcode data also match the baseline.
- `git diff --check` passed. No staging, commit, upload, or deployment occurred.

Print was captured before and after with Chromium's Letter PDF output and
rendered to PNG with Poppler. All three final pages were visually inspected.
Both versions have **three pages**, with identical text and the same distribution
of **445 / 471 / 47 words**. Computed body type is **11.8pt** (15.7333 px), line
height **1.23** (19.352 px), and margins **0.5in** (48 px). The existing 15 px
content inset is retained. Shared navigation/footer, skip link, photo, controls,
contact icons, and selected non-print details are hidden. Links print without
appended URLs, job metadata keeps its compact inline layout, and ligatures are
disabled. The print styling is scoped to `pw-resume`. Minor text rasterization
and spacing differences remain; the output is not claimed to be pixel-identical.

| Evidence | Before | Final |
| --- | --- | --- |
| Desktop light | [View](before-desktop-top.png) | [View](final-1440-light.png) |
| Desktop dark | [View](before-dark.png) | [View](final-1440-dark.png) |
| Mobile dark | [View](before-mobile-top.png) | [View](final-390-dark.png) |
| Mobile light | — | [View](final-390-light.png) |
| Letter print PDF | [View](before-print.pdf) | [View](final-print.pdf) |
| Print page 1 | [View](before-page-1.png) | [View](final-page-1.png) |
| Print page 2 | [View](before-page-2.png) | [View](final-page-2.png) |
| Print page 3 | [View](before-page-3.png) | [View](final-page-3.png) |

[Browser results](browser-checks.json), [print comparison](print-comparison.json),
[download hashes](downloads.sha256), and the [bounded task diff](migration.diff)
record concrete verification. The saved [browser checks](qa.cjs) and
[capture script](capture.cjs) document the local runner; their runtime, workspace,
and temporary paths must be adjusted for another machine.

Rendering and interaction checks used Chromium locally on port 13139. They do
not establish print pagination in Safari/Firefox, physical printer behavior,
external services, or live production behavior. Game runtime interactions were
verified in task 2; task 3 checked the surrounding page and framework loading.
The coordination board was unavailable because this chat had no configured
token. All changes remain reviewable in the shared checkout.
