#!/usr/bin/env bash
# Build and gate the Book To Buyer LIVE sales page with the long-form sales page skill's own scripts.
#
# The skill's assembler reads its look from an assets/ folder beside its scripts/ folder. This page keeps the
# Book To Buyer look, so the build stages the skill's scripts next to THIS project's engine/ folder
# (engine.css and engine.js) and runs them unchanged. Nothing in the skill is edited.
#
# Usage:
#   SKILL_DIR=/path/to/internalonly-mtm-long-form-sales-page ./build.sh [saved-host-page.html]
#       the selling page. Output: out/
#   SKILL_DIR=... ./build.sh --sold-out [saved-host-page.html]
#       the sold-out page: the same sections plus the sold-out message. Every call-to-action button opens
#       the message and no button reaches the order pages. Output: variants/sold-out/out/
set -euo pipefail

PROJECT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
: "${SKILL_DIR:?Set SKILL_DIR to the folder of the internalonly-mtm-long-form-sales-page skill}"

MODE="selling"
if [ "${1:-}" = "--sold-out" ]; then MODE="sold-out"; shift; fi
HOST_PAGE="${1:-}"

STAGE="$(mktemp -d)"
mkdir -p "$STAGE/scripts" "$STAGE/assets"
cp "$SKILL_DIR/scripts/assemble_block.py" "$SKILL_DIR/scripts/check_block.py" "$STAGE/scripts/"
cp "$PROJECT/engine/engine.css" "$PROJECT/engine/engine.js" "$STAGE/assets/"

HOST_ARGS=()
if [ -n "$HOST_PAGE" ]; then HOST_ARGS=(--ghl-css "$HOST_PAGE"); fi

if [ "$MODE" = "selling" ]; then
  python3 "$STAGE/scripts/assemble_block.py" "$PROJECT" "${HOST_ARGS[@]}"
  echo
  python3 "$STAGE/scripts/check_block.py" "$PROJECT" "${HOST_ARGS[@]}" || true
  exit 0
fi

# ---- sold-out: the selling page's sections, one extra section, its own settings, styles and script
VARIANT="$PROJECT/variants/sold-out"
WORK="$STAGE/proj"
mkdir -p "$WORK/sections" "$WORK/out" "$VARIANT/out"
cp "$PROJECT"/sections/*.html "$WORK/sections/"
cp "$VARIANT"/sections/*.html "$WORK/sections/"
cp "$VARIANT/page-config.json" "$VARIANT/soldout.css" "$WORK/"
cp -R "$VARIANT/out/." "$WORK/out/"
# The plan buttons stay on the page (they open the message), so they must not open a new tab.
sed -i 's/ target="_blank" rel="noopener"//g' "$WORK/sections/12-offer.html"
cat "$VARIANT/soldout.js" >> "$STAGE/assets/engine.js"

python3 "$STAGE/scripts/assemble_block.py" "$WORK" "${HOST_ARGS[@]}"
echo
python3 "$STAGE/scripts/check_block.py" "$WORK" "${HOST_ARGS[@]}" || true
cp -R "$WORK/out/." "$VARIANT/out/"
echo
echo "Sold-out build copied to $VARIANT/out/"
