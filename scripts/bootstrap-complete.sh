#!/usr/bin/env bash
# Bootstrap the complete Negative Quantum Holographic system from upstream.
# Extracts all tar.gz archives and mirrors the full source tree.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
UPSTREAM="${UPSTREAM:-https://github.com/SNAPKITTYWEST/negative-quantum-holographic}"
WORKDIR="$ROOT/.upstream-src"

echo "=== NQH complete-system bootstrap ==="
echo "Upstream: $UPSTREAM"
echo "Target:   $ROOT"

rm -rf "$WORKDIR"
git clone --depth 1 "$UPSTREAM" "$WORKDIR"

# Mirror full source tree (except .git)
rsync -a --delete --exclude '.git' "$WORKDIR/" "$ROOT/upstream/"

# Extract every tar.gz into extracted/
mkdir -p "$ROOT/extracted"
find "$WORKDIR" -name '*.tar.gz' -type f | while read -r tar; do
  echo "Extracting $tar"
  tar -xzf "$tar" -C "$ROOT/extracted"
done

# Copy large specs
mkdir -p "$ROOT/extracted/specs"
if [[ -f "$WORKDIR/quantum-wires/spec/BLRD-PTM-2026-001.txt" ]]; then
  cp "$WORKDIR/quantum-wires/spec/BLRD-PTM-2026-001.txt" "$ROOT/extracted/specs/"
  echo "Copied BLRD-PTM-2026-001.txt"
fi

echo ""
echo "=== Done ==="
echo "upstream/   — full mirror of SNAPKITTYWEST/negative-quantum-holographic"
echo "extracted/  — contents of all .tar.gz archives + BLRD spec"
find "$ROOT/extracted" -type f | wc -l | xargs -I{} echo "extracted file count: {}"
find "$ROOT/upstream" -type f | wc -l | xargs -I{} echo "upstream file count: {}"
