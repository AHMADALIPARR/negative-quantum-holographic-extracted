# Resonance Masonry — compressed executable/formal artifacts

Files:

- `ResonanceMasonry.hs` — executable Haskell reference model. Run with `runghc ResonanceMasonry.hs` or compile with GHC.
- `ResonanceMasonry.lhs` — Liquid Haskell literate/refinement layer. Run `liquid ResonanceMasonry.lhs` in a Liquid Haskell environment.
- `ResonanceMasonry.lean` — Lean 4 formal core. Build with `lake env lean ResonanceMasonry.lean` in a Lean 4 project containing the required `Std` modules.

The model keeps the key distinctions:

- Dark Masonry is adversarial transition space.
- Light Masonry is integrity/provenance/authorization/verification/containment space; the executable core represents its non-vacuous invariant and containment clauses.
- CARE is a transition predicate.
- Ψ is constructed componentwise from `psiRel`, load-bearing preservation, and a separately defined `psiAgent`.
- Branch A is represented by `opInvariant True`; Branch B by `opInvariant False`.
- SUBLEQ resonance is defined over the full machine state when claiming a true cycle.
- No external verification result is claimed by these source files.
