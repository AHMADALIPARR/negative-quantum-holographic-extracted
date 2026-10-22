# Negative Quantum Holographic — Pure Extract

**Exact contents** of the upstream tarballs and the BLRD text file from:

https://github.com/SNAPKITTYWEST/negative-quantum-holographic

## What was in the archives (fact)

| Archive | Contents |
|---------|----------|
| `clean-room-transformer.tar.gz` | Python project (membrane + transformer + 154 tests) |
| `resonance_masonry.tar.gz` | Haskell + Lean + Liquid Haskell sources |
| `BLRD-PTM-2026-001.txt` | 5629-line PTM binary-level specification |

The Python tree is **not invented** — it is what `tar -tzf clean-room-transformer.tar.gz` lists.

## Layout in this repo

```
extracted/
├── clean-room-transformer/   # from clean-room-transformer.tar.gz
├── resonance_masonry/        # from resonance_masonry.tar.gz
└── specs/                    # BLRD pointer + fetch instructions
EXTRACT.md
```

## Fetch full BLRD (397 KB)

```bash
mkdir -p extracted/specs
curl -L -o extracted/specs/BLRD-PTM-2026-001.txt \
  https://raw.githubusercontent.com/SNAPKITTYWEST/negative-quantum-holographic/master/quantum-wires/spec/BLRD-PTM-2026-001.txt
```

## Upstream

https://github.com/SNAPKITTYWEST/negative-quantum-holographic
