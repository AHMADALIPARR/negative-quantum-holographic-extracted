# negative-quantum-holographic-extracted

Working extract of [SNAPKITTYWEST/negative-quantum-holographic](https://github.com/SNAPKITTYWEST/negative-quantum-holographic).

```bash
git clone https://github.com/AHMADALIPARR/negative-quantum-holographic-extracted.git
cd negative-quantum-holographic-extracted
```

To pull the full upstream tree and unpack every archive:

```bash
chmod +x scripts/bootstrap-complete.sh && ./scripts/bootstrap-complete.sh
```

---

## 1. Fortran PTM — canonical sum

```bash
cd fortran
gfortran -O2 -o sum_canonical sum_canonical.f90
./sum_canonical
```

```
SUM(1..100) = 5050  hex = 0x000013BA
CANONICAL VERIFICATION: PASS  (5050 = 0x000013BA)
```

`make test` builds both `sum_canonical` and `ptm_pipeline` (after bootstrap for `ptm.f90`).

---

## 2. CARE — Lean 4

```bash
lean resonance_masonry/lean/Care.lean
```

Defines:

```lean
def Care (s s' : State) : Prop :=
  Protected s = Protected s' ∧
  subset (Authority s') (Authority s ++ Granted s)
```

Also proves `care_global_no_dark_masonry` and a protected-set change counterexample.

---

## 3. CARE — Alloy

```bash
# needs Alloy 6 jar: export ALLOY_JAR=/path/to/org.alloytools.alloy.dist.jar
cd resonance_masonry/alloy
./run-alloy.sh CareInvariant.als
./run-alloy.sh Connect.als
./run-alloy.sh ResonantSubleq.als
```

| File | What it checks |
|------|----------------|
| `CareInvariant.als` | `Care` global vs Dark Masonry counterexample |
| `Connect.als` | CARE-gated syscall vs dark syscall |
| `ResonantSubleq.als` | SUBLEQ PC step, trap / god domain |

---

## 4. Resonance Masonry — Haskell

```bash
cd extracted/resonance_masonry
runghc ResonanceMasonry.hs
```

```
RESONANCE MASONRY
("OpInvariant(A)",True)
("LightMasonry(Psi s)",True)
("CARE",True)
("DarkCrossing",False)
("PC trace",[0,0,0,0,0,0,0,0,0,0,0,0])
("PC period",Just 1)
("resonance @ 1GHz",Just 1.0e9)
```

---

## 5. Quantum-holographic Bell state — Prolog

Requires SWI-Prolog with `pita` / `cplint`.

```bash
swipl -s qh/qh_bell.pl
```

```prolog
?- demo_bell.
joint: P(up,up) = 0.64, P(down,down) = 0.36, P(up,down) = 0.0

?- demo_marginal.
marginal: P(left up) = 0.64, P(same spin) = 1.0

?- demo_conditional.
P(reported up | left up) = 0.95
```

State encoded in the file: `|ψ⟩ = 0.8|↑↑⟩ + 0.6|↓↓⟩`.

---

## 6. Clean-room transformer — membrane + tests

Needs the full extract (`./scripts/bootstrap-complete.sh`).

```bash
cd extracted/clean-room-transformer
pip install --require-hashes --no-deps -r requirements.txt
pip install -r requirements-dev.txt
python3 -m pytest tests -q
python3 scripts/demo.py
```

`demo.py` runs a clean generation pass, then injects a corruption and shows quarantine + KV rollback.

---

## 7. Quipper wire network

Full 1503-line circuit bank is not stored in-tree (size). Fetch it:

```bash
mkdir -p quantum-wires/quipper
curl -fsSL -o quantum-wires/quipper/quantum_wire_network_1500_lines.hs \
  https://raw.githubusercontent.com/SNAPKITTYWEST/negative-quantum-holographic/master/quantum-wires/quipper/quantum_wire_network_1500_lines.hs
```

Entry points in that file: `qwire`, `wireBank`, `wire_0001` … `wire_N`.

---

## Tree

```
fortran/                     PTM sum + Makefile
qh/                          Bell / cplint / examples
resonance_masonry/
  lean/Care.lean             CARE theorems
  alloy/                     CareInvariant, Connect, ResonantSubleq
extracted/
  resonance_masonry/         HS executable model
  clean-room-transformer/    membrane runtime (after bootstrap)
scripts/bootstrap-complete.sh
```

Source of truth for anything still missing: the upstream repo and the bootstrap script.

License: AGPL-3.0 (upstream `LICENSE-AGPL`).
