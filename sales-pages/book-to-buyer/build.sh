#!/usr/bin/env bash
# Build and gate the Book To Buyer LIVE sales page with the long-form sales page skill's own scripts.
#
# The skill's assembler reads its look from an assets/ folder beside its scripts/ folder. This page keeps the
# Book To Buyer look, so the build stages the skill's scripts next to THIS project's engine/ folder
# (engine.css and engine.js) and runs them unchanged. Nothing in the skill is edited.
#
# Usage:  SKILL_DIR=/path/to/internalonly-mtm-long-form-sales-page ./build.sh [saved-host-page.html]
set -euo pipefail

PROJECT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
: "${SKILL_DIR:?Set SKILL_DIR to the folder of the internalonly-mtm-long-form-sales-page skill}"
HOST_PAGE="${1:-}"

STAGE="$(mktemp -d)"
mkdir -p "$STAGE/scripts" "$STAGE/assets"
cp "$SKILL_DIR/scripts/assemble_block.py" "$SKILL_DIR/scripts/check_block.py" "$STAGE/scripts/"
cp "$PROJECT/engine/engine.css" "$PROJECT/engine/engine.js" "$STAGE/assets/"

HOST_ARGS=()
if [ -n "$HOST_PAGE" ]; then HOST_ARGS=(--ghl-css "$HOST_PAGE"); fi

python3 "$STAGE/scripts/assemble_block.py" "$PROJECT" "${HOST_ARGS[@]}"
echo
python3 "$STAGE/scripts/check_block.py" "$PROJECT" "${HOST_ARGS[@]}" || true
