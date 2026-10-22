# Negative Quantum Holographic — Complete Extract

Mirror + pure extracts from [SNAPKITTYWEST/negative-quantum-holographic](https://github.com/SNAPKITTYWEST/negative-quantum-holographic).

## One-command complete system

```bash
git clone https://github.com/AHMADALIPARR/negative-quantum-holographic-extracted.git
cd negative-quantum-holographic-extracted
chmod +x scripts/bootstrap-complete.sh
./scripts/bootstrap-complete.sh
```

This clones upstream, extracts **all** `.tar.gz` archives into `extracted/`, and copies the full BLRD spec.

## What the archives contain (verified)

| Archive | Contents |
|---------|----------|
| `clean-room-transformer.tar.gz` | Python membrane + transformer + 154 tests |
| `resonance_masonry.tar.gz` | Haskell / Lean / Liquid Haskell sources |
| `BLRD-PTM-2026-001.txt` | 5629-line PTM binary-level specification |

## Layout (after bootstrap)

```
upstream/                          # full mirror of upstream repo
extracted/
  clean-room-transformer/          # from tar
  resonance_masonry/               # from tar
  specs/BLRD-PTM-2026-001.txt      # from upstream
fortran/  qh/  lisp/  sgmt/        # key modules (also in upstream/)
resonance_masonry/alloy/           # Alloy CARE / SUBLEQ models
scripts/bootstrap-complete.sh
```

## Partial tree already in this repo

Pushed so far without bootstrap:

- `extracted/resonance_masonry/` (pure tar extract)
- `extracted/clean-room-transformer/` (partial pure extract)
- `fortran/` (Makefile + sum_canonical)
- `qh/` (bell + examples)
- `resonance_masonry/alloy/` (CARE + SUBLEQ Alloy models)

Run the bootstrap script to fill everything else (lisp, full CRT, ptm.f90, BLRD, submissions, quipper network, etc.).

## License

Upstream uses AGPL-3.0 (see upstream `LICENSE-AGPL`).
