# Sold-out wording for the hero. Applied by build.sh --sold-out to a staged copy of sections/01-hero.html,
# so the selling page's hero stays the single source for everything else.
# 1. All 12 seat dots filled (no open seats pulsing).
s#<i></i>#<i class="taken"></i>#g
# 2. The seat counter.
s#11 of 12 Seats Remaining#0 of 12 Seats Remaining#
# 3. The line under the counter.
s#Limited to 12 seats. When they are gone, they are gone.#All 12 seats are gone. Book To Buyer is now sold out.#
