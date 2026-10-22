#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-or-later OR Apache-2.0
set -euo pipefail

ALLOY_JAR="${ALLOY_JAR:-org.alloytools.alloy.dist.jar}"
MODEL="${1:-resonance_masonry/alloy/resonance.als}"
SOLVER="${SOLVER:-sat4j}"

if [[ ! -f "$ALLOY_JAR" ]]; then
  echo "ERROR: Alloy jar not found at '$ALLOY_JAR'" >&2
  exit 1
fi

echo "=== Alloy batch check: $MODEL ==="
java -jar "$ALLOY_JAR" -batch -solver "$SOLVER" "$MODEL" 2>&1 | tee alloy.out
grep -E '(No counterexample found|Counterexample found|No instance found|Instance found|UNSAT|SAT)' alloy.out || true
