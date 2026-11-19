# Hub: long-form sales page skill

## Setup answers

| # | Question | Answer | Status |
|---|---|---|---|
| 1 | Where sales page projects live | `sales-pages/`, one subfolder per page | default, CHECK |
| 2 | Approved copy, offer facts, testimonial bank; who approves copy | For Book To Buyer: the live page at booktobuyer.com. Bank and approver: MISSING | CHECK |
| 3 | Design tokens | Book To Buyer: the live page's own design, held in `sales-pages/book-to-buyer/engine/`. Other Map To Millions pages: the skill engine's default tokens | CHECK |
| 4 | Voice skill for furniture labels | MISSING (no new labels were written for Book To Buyer) | open |
| 5 | GoHighLevel domain, funnel, who pastes | booktobuyer.com. The owner pastes | INFERRED |
| 6 | Decision log | this file | default |
| 7 | Reference page for side-by-side checks | Book To Buyer: the live booktobuyer.com page | set |

## Decision log

### 2026-11-19 · internalonly-mtm-long-form-sales-page · project `book-to-buyer`

- READ: booktobuyer.com (live page, desktop 1440, tablet 1024 and 800, phone 390); the skill's references, scripts and section templates.
- DECIDED: mode = recode an existing page. 15 sections plus header, in the live page's own sequence. Look = the live Book To Buyer design in a page-specific engine folder; the skill's scripts run unchanged against it. Footer left out of the block (Global Element).
- CHECKED FIRST: no project existed. Price math: 3 x 5,500 = 16,500; pay in full 15,000; saving 1,500, which agrees with the page's "Save $1,500". Dates on the page are in the future (March 2027). Checkout pages: NOT opened (domain not reachable from the session).
- ACTED: build 1 written to `sales-pages/book-to-buyer/out/`. Gates: 24 of 25 passed, 1 FAIL (plan total not printed on the page, as on the live page), 3 WARN. Words: 0 differences against the live page. Nothing pasted, saved or published in GoHighLevel.
- WAITING FOR APPROVAL: the open items in `sales-pages/book-to-buyer/out/INSTALL-IN-GOHIGHLEVEL.md` (price total line, repeated deliverable cards, six listed differences), then paste and publish.
- MISSING: testimonial permission notes, an independent quality check, order page price confirmation, setup answers 2 and 4.
