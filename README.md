# Negative Quantum Holographic — Extracted & Organized

Extracted from [SNAPKITTYWEST/negative-quantum-holographic](https://github.com/SNAPKITTYWEST/negative-quantum-holographic).

## What this repo contains

| Path | Description |
|------|-------------|
| `quantum-wires/extracted/clean-room-transformer/` | Full source tree from `clean-room-transformer.tar.gz` |
| `quantum-wires/extracted/resonance_masonry/` | Haskell / Lean / literate sources from `resonance_masonry.tar.gz` |
| `quantum-wires/specs/BLRD-PTM-2026-001.txt` | Binary-Level Reference Document (PTM), 5629 lines |
| `quantum-wires/extracted/ORGANIZATION.md` | Layout notes |

## License headers

Every source file carries an **AGPL-3.0-or-later** SPDX header, consistent with the upstream `LICENSE-AGPL`.

## Original archives

The original `.tar.gz` files remain in the upstream repository under `quantum-wires/`.

## Quick start (clean-room transformer)

```bash
cd quantum-wires/extracted/clean-room-transformer
pip install -r requirements.txt
python3 -m pytest tests -q
python3 scripts/demo.py
```
