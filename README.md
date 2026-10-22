# Negative Quantum Holographic — Extracted & Organized

Extracted from [SNAPKITTYWEST/negative-quantum-holographic](https://github.com/SNAPKITTYWEST/negative-quantum-holographic).

## Layout

```
quantum-wires/
├── extracted/
│   ├── ORGANIZATION.md
│   ├── resonance_masonry/          ✅ complete (HS / Lean / LHS + AGPL headers)
│   └── clean-room-transformer/     ⏳ partial (root configs + core src modules)
└── specs/
    └── BLRD-PTM-2026-001.txt       ⏳ pending (397 KB — use local extract)
```

## What's in the repo now

| Path | Status |
|------|--------|
| `quantum-wires/extracted/resonance_masonry/` | Full (`.hs`, `.lean`, `.lhs`, `build.sh`) |
| `quantum-wires/extracted/clean-room-transformer/requirements*.txt` | ✅ |
| `quantum-wires/extracted/clean-room-transformer/conftest.py` | ✅ |
| `quantum-wires/extracted/clean-room-transformer/src/runtime/` | ✅ partial |
| `quantum-wires/extracted/clean-room-transformer/src/membrane/exceptions.py` | ✅ |
| `quantum-wires/extracted/clean-room-transformer/src/transformer/config.py` | ✅ |
| Remaining CRT `src/`, `tests/`, `scripts/` | Local extract ready to push |
| `quantum-wires/specs/BLRD-PTM-2026-001.txt` | Local extract ready (397 KB) |

## License headers

All source files carry:

```
SPDX-License-Identifier: AGPL-3.0-or-later
```

consistent with upstream `LICENSE-AGPL`.

## Source archives (upstream)

- `quantum-wires/clean-room-transformer.tar.gz`
- `quantum-wires/resonance_masonry.tar.gz`
- `quantum-wires/spec/BLRD-PTM-2026-001.txt`

## Quick start (when full CRT tree is present)

```bash
cd quantum-wires/extracted/clean-room-transformer
pip install -r requirements.txt
python3 -m pytest tests -q
python3 scripts/demo.py
```
