# Negative Quantum Holographic — System Demos

Extracted from [SNAPKITTYWEST/negative-quantum-holographic](https://github.com/SNAPKITTYWEST/negative-quantum-holographic).

```
Measure → Encode → Verify CARE → Optimize → Commit
```

---

## Demo 1 · CARE invariant (Lean 4)

Protected state must not change; authority may only grow by grant.

```bash
# requires Lean 4
lean resonance_masonry/lean/Care.lean
```

Core definition:

```lean
def Care (s s' : State) : Prop :=
  Protected s = Protected s' ∧
  subset (Authority s') (Authority s ++ Granted s)
```

Dark Masonry = transition ∧ privileged ∧ ¬CARE.

---

## Demo 2 · CARE / Dark Masonry (Alloy)

Bounded counterexample search against CARE:

```bash
cd resonance_masonry/alloy
./run-alloy.sh CareInvariant.als
./run-alloy.sh ResonantSubleq.als
# full models (after bootstrap):
#   DarkMasonry.als  resonance.als  Connect.als
```

Expected shape:

| Command | Meaning |
|---------|---------|
| `run careGlobal` | all transitions obey CARE |
| `run counterexample` | search for Dark Masonry |

---

## Demo 3 · Resonance Masonry (Haskell)

Executable reference model + SUBLEQ resonance:

```bash
cd extracted/resonance_masonry
runghc ResonanceMasonry.hs
# or
./build.sh
```

Prints OpInvariant, LightMasonry, CARE, PC period, resonance @ 1 GHz.

---

## Demo 4 · Quantum-holographic Bell state (Prolog)

```bash
# requires SWI-Prolog + pita/cplint packs
swipl -s qh/qh_bell.pl
?- demo_bell.
?- demo_marginal.
?- demo_conditional.
```

State: `|ψ⟩ ≈ 0.8|↑↑⟩ + 0.6|↓↓⟩`  
Expected: `P(↑↑)=0.64`, `P(↓↓)=0.36`, `P(same spin)=1.0`.

---

## Demo 5 · Fortran PTM canonical sum

```bash
cd fortran
make test
# or
gfortran -o sum_canonical sum_canonical.f90 && ./sum_canonical
```

Expected: `SUM(1..100) = 5050` (`0x000013BA`) — PASS.

---

## Demo 6 · Clean-room transformer + integrity membrane

```bash
# after bootstrap (full extract)
cd extracted/clean-room-transformer
pip install --require-hashes --no-deps -r requirements.txt
pip install -r requirements-dev.txt
python3 -m pytest tests -q          # 154 tests
python3 scripts/demo.py             # clean run + quarantine demo
python3 scripts/verification_report.py
```

Every layer boundary is intercepted; violations quarantine + roll back KV state.

---

## Demo 7 · Quipper quantum wire network

1500-line Quipper circuit bank (full file via bootstrap):

```bash
# after bootstrap
cd upstream/quantum-wires/quipper
# requires Quipper
# quantum_wire_network_1500_lines.hs
```

Core pattern:

```haskell
qwire :: Bool -> Qubit -> Circ Qubit
qwire b q = do
  if b then gate_X q else return q

wireBank :: [Bool] -> Circ [Qubit]
wireBank bs = do
  qs <- mapM qinit bs
  mapM (uncurry qwire) (zip bs qs)
```

---

## Demo 8 · Full system bootstrap

Pull **everything** still missing from upstream (Quipper 1500-line network, full CRT, BLRD, lisp encoders, Alloy DarkMasonry/resonance, Isabelle, ASP, Rust, submissions):

```bash
chmod +x scripts/bootstrap-complete.sh
./scripts/bootstrap-complete.sh
```

Produces:

```
upstream/     — full SNAPKITTYWEST tree
extracted/    — all tar.gz contents + BLRD-PTM-2026-001.txt
```

---

## Module map

| Path | Role |
|------|------|
| `resonance_masonry/lean/Care.lean` | CARE proof obligations |
| `resonance_masonry/alloy/` | CARE / Dark Masonry / SUBLEQ bounded search |
| `extracted/resonance_masonry/` | Executable HS + Lean + LH |
| `qh/` | Quantum-holographic engine + Bell demos |
| `fortran/` | PTM pipeline |
| `extracted/clean-room-transformer/` | Membrane-governed transformer |
| `upstream/quantum-wires/quipper/` | Quipper wire network (post-bootstrap) |
| `upstream/lisp/` | CFG + Quipper JCL encoders (post-bootstrap) |
| `extracted/specs/BLRD-*.txt` | Binary-level PTM spec (post-bootstrap) |

---

## License

AGPL-3.0 (upstream `LICENSE-AGPL`).
