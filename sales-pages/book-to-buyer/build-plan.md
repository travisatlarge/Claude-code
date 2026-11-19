# Book To Buyer LIVE: build plan

Mode: recode an existing page. Source of words and design: the live page at booktobuyer.com, read on 2026-11-19. No copy was written or changed.

```
PAGE: Book To Buyer LIVE, recode, for the funnel step that serves booktobuyer.com
SECTIONS: 15 page sections plus header (the live page's own sequence, not the 23-section reference sequence)
MISSING: none
CHECK: nothing new. Every label, button and nav word is the live page's
LOOK: the live Book To Buyer design, held in this project's engine/ folder · MEDIA: 10 images, all already hosted in GoHighLevel Media Storage
NEXT: owner decides the open items in out/INSTALL-IN-GOHIGHLEVEL.md, pastes, previews, publishes
```

## How this project is put together

| Part | Where | Notes |
|---|---|---|
| Words | `sections/*.html` | One file per section, in page order. Markup only, no styles or scripts. |
| Look | `engine/engine.css` | Every selector starts with `.lfsp-page`. Tokens are the first rule. Phone rules start at 767px. |
| Behaviour | `engine/engine.js` | Header, anchor scrolling, scroll reveals, stat counters, FAQ. |
| Settings | `page-config.json` | Checkout links, button label, prices, fonts. |
| Build | `build.sh` | Runs the long-form sales page skill's own `assemble_block.py` and `check_block.py`, unchanged, against this project's `engine/`. |
| Output | `out/` | Paste block, three-piece fallback, test page, build report, install note, check evidence. |

The skill's engine carries the Profitable Online Offer look. This page keeps the Book To Buyer look, so it has its own engine files. The skill itself was not edited.

## Offer facts (all read from the live page, owner confirms)

| Fact | Value | Source |
|---|---|---|
| Pay in full | $15,000 | live page, pricing section |
| Payment plan | 3 x $5,500 (total $16,500, saving $1,500) | live page; total computed |
| Pay in full checkout | https://maptomillions.com/book-to-buyer-enroll-1p | live page button |
| Payment plan checkout | https://maptomillions.com/book-to-buyer-enroll-3p | live page button |
| Dates | March 21 to 26, 2027 | live page |
| Place | ARIA Resort, Las Vegas | live page |
| Seats | 12 total, counter reads 11 of 12 remaining | live page |
| Guarantee | none stated. Refunds: not offered (FAQ) | live page |

## Change together

A price, date or seat change touches more than one place:
- Dates: hero fact, schedule (7 entries), experience "Dates" card, bonuses, close line.
- Prices: `sections/12-offer.html` (tiles and the "Save $1,500" band) and `page-config.json`.
- Seats: hero fact, seat counter, hero note, experience "Capacity" card, offer note, close line.
- Checkout links: `page-config.json` only.

## Section map

| File | Live section | Anchor |
|---|---|---|
| 00-nav | header | nav |
| 01-hero | hero | #overview |
| 02-problem | The Problem | |
| 03-audience | Who This Is For | #audience |
| 04-method | The Book To Buyer Method | #method |
| 05-cases | Results From Real Authors | |
| 06-deliverables | What You Walk Away With | #deliverables |
| 07-schedule | 5 Days. 1 Book. | #schedule |
| 08-graduates | Social Proof | |
| 09-experience | The Experience | #experience |
| 10-bonuses | Bonus Experiences | |
| 11-team | Your Team | |
| 12-offer | Choose Your Path | #order |
| 13-note | A Note From Joy | |
| 14-faq | FAQ | #faq |
| 15-close | Two Paths | |
| 99-sticky | none (empty, hidden: the live page has no floating bar) | |
