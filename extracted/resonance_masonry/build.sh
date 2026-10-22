#!/usr/bin/env bash
set -euo pipefail

ghc -O2 -Wall ResonanceMasonry.hs -o resonance-masonry
./resonance-masonry

if command -v liquid >/dev/null 2>&1; then
  liquid ResonanceMasonry.lhs
else
  echo "Liquid Haskell not installed; skipped refinement checking."
fi

if command -v lake >/dev/null 2>&1; then
  lake env lean ResonanceMasonry.lean
elif command -v lean >/dev/null 2>&1; then
  lean ResonanceMasonry.lean
else
  echo "Lean 4 not installed; skipped Lean checking."
fi
