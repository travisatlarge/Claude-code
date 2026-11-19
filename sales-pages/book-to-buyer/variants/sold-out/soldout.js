
// Sold-out variant: every call-to-action button opens the sold-out message instead of scrolling or checking out.
// Added after the page script at build time. Does nothing when the page has no #sold-out element.
(function () {
  var root = document.getElementById("lfsp-page");
  var modal = document.getElementById("sold-out");
  if (!root || !modal) return;

  // Move the message to the end of <body> so it always covers the whole screen, whatever wraps the page block.
  var portal = document.createElement("div");
  portal.className = "lfsp-page lfsp-portal";
  document.body.appendChild(portal);
  portal.appendChild(modal);

  var lastFocus = null;
  var prevOverflow = "";
  var focusables = function () {
    return Array.prototype.slice.call(modal.querySelectorAll("a[href], button")).filter(function (el) {
      return el.offsetParent !== null && !el.classList.contains("soldout-veil");
    });
  };
  var isOpen = function () { return modal.classList.contains("open"); };

  var open = function (from) {
    if (isOpen()) return;
    lastFocus = from || document.activeElement;
    prevOverflow = document.body.style.overflow;
    document.body.style.overflow = "hidden";
    modal.classList.add("open");
    modal.scrollTop = 0;
    var first = modal.querySelector(".btn-solid") || focusables()[0];
    if (first && first.focus) first.focus({ preventScroll: true });
  };
  var close = function () {
    if (!isOpen()) return;
    modal.classList.remove("open");
    document.body.style.overflow = prevOverflow;
    if (lastFocus && lastFocus.focus) lastFocus.focus({ preventScroll: true });
  };

  // Capture phase: runs before the page's own anchor scrolling, and before a plan button can leave the page.
  root.addEventListener("click", function (e) {
    var hit = e.target && e.target.closest ? e.target.closest('.btn-cta, a[href="#sold-out"]') : null;
    if (!hit) return;
    e.preventDefault();
    e.stopPropagation();
    open(hit);
  }, true);

  modal.addEventListener("click", function (e) {
    var c = e.target && e.target.closest ? e.target.closest("[data-close]") : null;
    if (!c) return;
    e.preventDefault();
    close();
  });

  document.addEventListener("keydown", function (e) {
    if (!isOpen()) return;
    if (e.key === "Escape" || e.key === "Esc") { e.preventDefault(); close(); return; }
    if (e.key !== "Tab") return;
    var f = focusables();
    if (!f.length) return;
    var first = f[0], last = f[f.length - 1];
    if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
    else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    else if (!modal.contains(document.activeElement)) { e.preventDefault(); first.focus(); }
  });

  if (window.location.hash === "#sold-out") open(null);
})();
