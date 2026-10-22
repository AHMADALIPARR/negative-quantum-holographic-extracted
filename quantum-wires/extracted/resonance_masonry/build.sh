#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later
# Copyright (c) 2026 SNAPKITTYWEST contributors
set -euo pipefail
cd "$(dirname "$0")"
echo "Building Resonance Masonry artifacts..."
if command -v ghc >/dev/null 2>&1; then
  ghc -O2 -o ResonanceMasonry ResonanceMasonry.hs && echo "Haskell OK"
else
  echo "ghc not found — skip Haskell"
fi
if command -v lake >/dev/null 2>&1; then
  echo "Lean: use lake build from a proper lakefile context"
else
  echo "lake not found — skip Lean"
fi
