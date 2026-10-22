-- SPDX-License-Identifier: AGPL-3.0-or-later OR Apache-2.0
-- RESONANCE MASONRY
-- CONNECT: shared vocabulary tying CARE <-> PC trajectory <-> syscall
-- Same predicates as Care.lean / resonant_subleq.pl / connect.pl

module Connect

open util/ordering[State] as St

abstract sig Cap {}
sig GodCap extends Cap {}
sig UserCap extends Cap {}

sig State {
  protected: set Cap,
  authority: set Cap,
  granted:  set Cap,
  pc: Int
}

one sig Sys {
  godDomain: set Cap,
  trap: lone State
}

pred Care[s, s1: State] {
  s1.protected = s.protected
  s1.authority in s.authority + s.granted
}

pred Transition[s, s1: State] {
  s != s1
  St/next[s] = s1
}

pred syscallAuthorize[s: State, cap: Cap] {
  cap in s.authority
  cap in Sys.godDomain
}

pred syscallTrap[s: State, cap: Cap] {
  cap not in s.authority
}

pred careGatedSyscall[s, s1: State, cap: Cap] {
  Transition[s, s1]
  Care[s, s1]
  syscallAuthorize[s, cap] implies s1.authority in s.authority + s.granted
  syscallTrap[s, cap] implies s1.authority = s.authority
}

pred darkSyscall[s, s1: State, cap: Cap] {
  Transition[s, s1]
  s1.authority & Sys.godDomain - s.authority - s.granted != none
  not Care[s, s1]
}

pred connectWitness {
  some s, s1: State, cap: Cap | careGatedSyscall[s, s1, cap]
}

pred connectDark {
  some s, s1: State, cap: Cap | darkSyscall[s, s1, cap]
}

run connectWitness for 5 State, 3 Cap, 2 GodCap, 3 UserCap
run connectDark for 5 State, 3 Cap, 2 GodCap, 3 UserCap

assert authorizedSyscallPreservesCare {
  all s, s1: State, cap: Cap |
    careGatedSyscall[s, s1, cap] implies Care[s, s1]
}
check authorizedSyscallPreservesCare for 5 State, 3 Cap, 2 GodCap, 3 UserCap
