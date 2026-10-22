-- RESONANCE MASONRY — Resonant SUBLEQ PC trajectory

module ResonantSubleq

open util/ordering[PCState] as PCs

sig Domain {}
one sig GodDomain, TrapDomain, UserDomain extends Domain {}

sig Capability {
  authorized: PCState -> set Domain
}

sig PCState {
  pc: Int,
  mem: Int -> lone Int
}

pred subleqStep[s, s1: PCState] {
  s != s1
  PCs/next[s] = s1
}

pred isSyscall[s, s1: PCState] {
  subleqStep[s, s1]
  some d: Domain | d in Capability.authorized[s]
}

pred entersGodDomain[s, s1: PCState] {
  isSyscall[s, s1]
  Capability.authorized[s] in GodDomain
}

pred entersTrap[s, s1: PCState] {
  isSyscall[s, s1]
  Capability.authorized[s] in TrapDomain
}

pred resonant[k: Int] {
  k > 0
  some s, s1: PCState |
    (s1.pc = s.pc) and (PCs/next[s] = s1) and (k = 1 or k = 2 or k = 3)
}

run subleqStep for 8 PCState, 4 Domain
run resonant for 3 Int, 8 PCState, 4 Domain
run entersGodDomain for 6 PCState, 3 Domain
run entersTrap for 6 PCState, 3 Domain
