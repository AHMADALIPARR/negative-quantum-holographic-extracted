# Extracted Archives & Specs

This directory tree was produced by extracting the raw `.tar.gz` archives
and the large specification text that previously lived under `quantum-wires/`.

## Layout

```
quantum-wires/
├── extracted/
│   ├── clean-room-transformer/        # full source tree + AGPL-3.0 headers
│   └── resonance_masonry/             # Haskell / Lean / literate sources + AGPL-3.0 headers
└── specs/
    └── BLRD-PTM-2026-001.txt          # Binary-Level Reference Document (PTM)
```

## License headers

Every source file under `extracted/` carries an SPDX `AGPL-3.0-or-later`
header consistent with the upstream repository root `LICENSE-AGPL`.

## How this was produced

1. Downloaded `clean-room-transformer.tar.gz` and `resonance_masonry.tar.gz`
2. Extracted both archives
3. Added AGPL-3.0 SPDX headers to `.py`, `.hs`, `.lhs`, `.lean`, and `.sh` files
4. Placed the large BLRD text under `specs/`
