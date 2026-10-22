# Quipper quantum wire network

Full circuit bank: **1503 lines** — `quantum_wire_network_1500_lines.hs`

## Get the full file

```bash
# from repo root
./scripts/bootstrap-complete.sh
# then:
ls upstream/quantum-wires/quipper/quantum_wire_network_1500_lines.hs
```

Or direct:

```bash
curl -L -o quantum-wires/quipper/quantum_wire_network_1500_lines.hs \
  https://raw.githubusercontent.com/SNAPKITTYWEST/negative-quantum-holographic/master/quantum-wires/quipper/quantum_wire_network_1500_lines.hs
```

## Core API (from the network)

```haskell
import Quipper

qwire :: Bool -> Qubit -> Circ Qubit
qwire b q = do
  if b then gate_X q else return q

wireBank :: [Bool] -> Circ [Qubit]
wireBank bs = do
  qs <- mapM qinit bs
  mapM (uncurry qwire) (zip bs qs)
```

Then `wire_0001` … `wire_N` bind individual X/identity channels across the bank.
