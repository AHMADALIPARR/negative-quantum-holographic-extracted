# Complete system extract status

Source: https://github.com/SNAPKITTYWEST/negative-quantum-holographic

## Extracted into this repo

### From tars
- `extracted/clean-room-transformer/` — full tree from `clean-room-transformer.tar.gz`
- `extracted/resonance_masonry/` — full tree from `resonance_masonry.tar.gz`

### From upstream source tree
- `fortran/` — PTM pipeline (Makefile, sum_canonical.f90, ptm.f90)
- `qh/` — quantum-holographic Prolog engine + Bell / examples / cplint
- `sgmt/` — crystallization + XSLT normalize
- `lisp/` — CFG + Quipper JCL encoders (pending if not yet pushed)
- `resonance_masonry/` — Alloy / Haskell / Lean / Isabelle / ASP / Rust / Prolog / Subleq
- `quantum-wires/` — AST + Quipper network
- `submissions/` — agent XML submissions
- `LICENSE-AGPL`

### Specs
- BLRD-PTM-2026-001: fetch from upstream (397 KB)

```bash
curl -L -o extracted/specs/BLRD-PTM-2026-001.txt \
  https://raw.githubusercontent.com/SNAPKITTYWEST/negative-quantum-holographic/master/quantum-wires/spec/BLRD-PTM-2026-001.txt
```
