# Book To Buyer LIVE: SOLD OUT page, build 2 (2026-11-19)

Status: DRAFT until you approve the pop-up copy below.

Paste this file: `book-to-buyer-sold-out-ghl-custom-code_b2.html` (126 KB, one block)
Installed at: https://booktobuyer.com/book-to-buyer-is-sold-out (build 1 is live there; paste build 2 over it)
When: the day the event sells out. It replaces the selling page block.

## What it does

- Same page as the selling page, word for word.
- Every call-to-action button (8 RESERVE YOUR SEAT buttons, including the header one, and both ADD TO CART buttons) opens the sold-out pop-up.
- No button reaches an order page. The two order page links are not in this file at all.
- The eight header menu links and the FAQ work as before.
- The pop-up closes with the X, the "Keep reading" link, a click outside it, or the Escape key.

## What changed since build 1

- Hero counter: "11 of 12 Seats Remaining" is now "0 of 12 Seats Remaining". All 12 seat dots are filled and no longer pulse.
- Hero line under the counter: "Limited to 12 seats. When they are gone, they are gone." is now "All 12 seats are gone. Book To Buyer is now sold out." CHECK: this line was not word for word in the request.
- Phones: GoHighLevel pads the row 10px on each side, which left a white strip down both edges of the installed page. The page now stretches itself back to the screen edges.
- Checked on the installed page (build 1, desktop and phone): header slides in, every button opens the pop-up, both plan buttons point at the pop-up, no order page link in the block, no script errors.

The sold-out hero wording lives in `variants/sold-out/hero-sold-out.sed`.

## Swap it in

1. Open the page in the builder and open the Custom Code element that holds the selling page block.
2. Select everything in it, paste this whole file over it, save.
3. Preview in a new tab. Click any orange button: the pop-up opens.
4. Publish.

To go back to selling, paste the selling page file over it again (`out/book-to-buyer-ghl-custom-code_b1.html`).

## Pop-up copy (CHECK: yours to approve or change)

- Stamp: SOLD OUT
- Line above the headline: March 21 - 26, 2027 · ARIA Resort, Las Vegas
- Headline: Book To Buyer is now sold out.
- Counter: 12 of 12 Seats Taken
- Lead: Every seat at the table is spoken for.
- Body: We cap the room at 12 on purpose. Every author gets hands-on support and direct access to Joy and the team. That is why this room is closed.
- Body: Your book is still waiting to be written. Join the waitlist and you hear first if a seat opens up, and first when the next Book To Buyer LIVE dates are set.
- Button: JOIN THE WAITLIST →
- Link: Keep reading
- Small print: Joining takes one email to joy@healatscale.com. Joy reads and responds personally.
- Image: the boardroom photo already on the page ("Your Seat at the Table").

Edit the words in `variants/sold-out/sections/97-soldout.html`, then run `./build.sh --sold-out`.

## Still open (yours to decide)

- CHECK, the waitlist promise: the pop-up says waitlisters hear first if a seat opens and first about the next dates. Keep it only if you will honor both.
- CHECK, where the waitlist button goes: it opens an email to joy@healatscale.com with the subject "Book To Buyer LIVE waitlist". If you have a GoHighLevel form or waitlist page, send me the link and I will point the button there.
- CHECK, the buttons still say RESERVE YOUR SEAT and ADD TO CART, and the hero still shows "12 Seats Only". Left as is: only the counter and the line under it were changed.
- FAIL, price math gate: same as the selling page ($16,500 plan total is not printed). Same owner decision.
- Not checked: inside a real GoHighLevel page. Tested in the hostile test page (`test-harness_b1.html`).

Checked: 24 of 25 gates passed. Desktop and 375px: all 10 buttons open the pop-up, the page does not scroll or leave, no new tab opens, all three ways of closing work, no console errors. With scripts off, the two plan buttons still open the pop-up.
