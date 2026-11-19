# Book To Buyer LIVE: sales page, build 1 (2026-11-19)

Status: DRAFT until you approve the open items below.

Paste this file: `book-to-buyer-ghl-custom-code_b1.html` (115 KB, one block)
Where: the Book To Buyer funnel, the step that serves booktobuyer.com

## Install

1. Clone the current funnel step first. Build on the clone so the live page stays untouched until you swap.
2. On the clone, remove every section except the footer. That includes the header section (the block carries its own header).
3. Add one section above the footer: full width, padding 0 top and bottom, no background. One row, full width, padding 0. One column. One Custom Code element.
4. Open the Custom Code element, select everything in it, paste the whole file, save.
5. Leave the Global footer under that section. The block has no footer of its own.
6. Preview in a new tab. The builder canvas blocks scripts, so the page looks unfinished there.
7. Check in the preview: scroll 150px and the header slides in; any orange button lands on the pricing box; both ADD TO CART buttons open the right order pages.
8. Publish when you are happy. Nothing is live until you publish.

If the Custom Code element refuses the block, use `split_b1/`: file 1 in Settings > Tracking Code > Header, file 2 in the Custom Code element, file 3 in Settings > Tracking Code > Footer.

## Page settings (not code, set them on the step)

- SEO title, CHECK: `Book To Buyer - Reserve Your Seat` (same as the live page)
- Meta description, CHECK: `Join Book To Buyer LIVE and learn how to write, publish, and launch a business book that builds authority, attracts clients, and supports long-term revenue.` (same as the live page)
- Share image: the current one, `https://assets.cdn.filesafe.space/kk3vQipkzejClUIZNuel/media/6a2c0eedc5c6223206297868.png`
- Tracking code: stays in the funnel or page tracking settings, never in the block.

## What changed since the last build

First build. It reproduces the live page as of 2026-11-19.

## How close it is to the live page

- Words: 4,797 visible words on the live page, 4,797 in the rebuild, 0 differences.
- Desktop (1440px): all 15 sections start at the same pixel and have the same height. 312 text blocks compared for position, size, font, weight and colour: no mismatch above 1px.
- Phone (390px): every section within 6px of the live height. Total drift 20px over a 39,000px page.
- Tablet (1024px): 14 of 15 sections identical in height. The case study section is 33px shorter (the three orange pills sit on one line).
- Evidence: `checks/` (side-by-side screenshots and the two geometry reports).

## Where it differs from the live page, on purpose

1. Footer: not in the block. Your Global footer section stays as it is.
2. Phone and tablet: the live page shows a 20px white strip above the hero. The rebuild starts the hero at the top.
3. Phone menu: the live menu opens as a white panel with near-white links (unreadable). The rebuild opens a dark panel with the same eight links.
4. Email link in the last section: the live link points at `joy@healatscale.com` as a page address, which goes nowhere. The rebuild uses `mailto:joy@healatscale.com`.
5. FAQ: the first answer on the live page carries one stray empty line. Not carried over.
6. Scroll animation: the live page mixes two GoHighLevel entrance effects per element. The rebuild uses one rise (text and cards) and one fade (section titles).

Say the word and any of these goes back to exactly what the live page does.

## Still open (yours to decide)

- FAIL, price math gate: the skill's gate expects the payment plan total on the page. 3 x $5,500 = $16,500. The live page does not print $16,500, so the rebuild does not either. Options: add a "$16,500 total" line to the plan tile, or accept the page as is.
- CHECK, copy: the first three deliverable cards all read "Your Core Concept locked in." with the same body text. Reproduced as is. Cards 2 and 3 look like they need their own copy.
- CHECK, copy: Dr. Brewer's story reads "I spent 20 hour speaking my content" and her intro line ends with a comma. Reproduced as is.
- CHECK, seat counter: "11 of 12 Seats Remaining" is fixed text in `sections/01-hero.html`. It does not count down on its own.
- Not checked: the two order pages (`maptomillions.com/book-to-buyer-enroll-1p` and `-3p`). This session could not open that domain. The links are copied from the live page. Open both and confirm $15,000 and 3 x $5,500.
- Not checked: the block inside a real GoHighLevel page. It was tested inside a hostile test page that carries the live page's own CSS (`test-harness_b1.html`). The header uses sticky positioning: confirm it slides in during step 7.
- WARN, no guarantee line under the buttons: the live page has no guarantee. Nothing added.
- WARN, FAQ starts closed: same as the live page.
- WARN, two neighbouring sections share a ground (case studies and deliverables): same as the live page.
- 16 quotes on the page: each needs the client's written permission on file.
- No independent quality check was run. This pack is the full evidence.

Checked: 24 of 25 gates passed. Desktop and 375px, offer box, header, phone menu, FAQ, anchor scrolling, no console errors, no sideways scroll.
