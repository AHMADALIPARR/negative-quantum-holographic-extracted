-- RESONANCE MASONRY
-- CARE machine-level invariant as Lean 4 proof obligations.
-- Verified with: lean resonance_masonry/lean/Care.lean

namespace ResonanceMasonry

structure Cap where
  id : Nat
  deriving Repr, DecidableEq

structure State where
  shield     : List Cap
  authority  : List Cap
  granted    : List Cap
  deriving Repr

def godDomain : List Cap := [⟨0⟩]

def Protected (s : State) : List Cap := s.shield
def Authority (s : State) : List Cap := s.authority
def Granted   (s : State) : List Cap := s.granted

def subset (xs ys : List Cap) : Prop := ∀ c, c ∈ xs → c ∈ ys

/-- CARE:
    Care(s,s') :=
      Protected(s) = Protected(s')
      ∧ Authority(s') ⊆ Authority(s) ∪ Granted(s) -/
def Care (s s' : State) : Prop :=
  Protected s = Protected s' ∧
  subset (Authority s') (Authority s ++ Granted s)

def Transition (s s' : State) : Prop := s ≠ s'

def Privileged (s s' : State) : Prop :=
  Transition s s' ∧
  (Protected s ≠ Protected s' ∨
   (∃ c ∈ Authority s', c ∈ godDomain) ∨
   ∃ c ∈ Authority s', c ∉ Authority s)

def DarkMasonry (s s' : State) : Prop :=
  Transition s s' ∧ Privileged s s' ∧ ¬ Care s s'

def CareGlobal : Prop :=
  ∀ s s' : State, Transition s s' → Care s s'

def DarkMasonryExists : Prop :=
  ∃ s s' : State, DarkMasonry s s'

theorem care_protected (s s' : State) (h : Care s s') :
    Protected s = Protected s' := h.1

theorem care_authority (s s' : State) (h : Care s s') :
    subset (Authority s') (Authority s ++ Granted s) := h.2

theorem dark_masonry_violates_care (s s' : State)
    (h : DarkMasonry s s') : ¬ Care s s' := h.2.2

theorem care_global_no_dark_masonry
    (h : CareGlobal) :
    ∀ s s' : State, ¬ DarkMasonry s s' := by
  intro s s' hd
  cases hd with
  | intro t hp =>
    cases hp with
    | intro _p nc =>
      exact nc (h s s' t)

theorem trap_rejects (s s' : State)
    (unauth : ¬ subset (Authority s') (Authority s ++ Granted s)) :
    ¬ Care s s' := by
  intro h
  exact unauth (care_authority s s' h)

example : Care
  { shield := [⟨1⟩], authority := [⟨1⟩], granted := [⟨2⟩] }
  { shield := [⟨1⟩], authority := [⟨1⟩, ⟨2⟩], granted := [] } := by
  refine ⟨rfl, ?_⟩
  intro c hc
  cases hc with
  | head => exact List.Mem.head _
  | tail _ hc2 =>
    cases hc2 with
    | head => simp [Authority, Granted]
    | tail => contradiction

example : ¬ Care
  { shield := [⟨1⟩], authority := [], granted := [] }
  { shield := [], authority := [], granted := [] } := by
  intro h
  have e := h.1
  simp [Protected] at e

theorem care_global_protected (h : CareGlobal)
    (s s' : State) (t : Transition s s') :
    Protected s = Protected s' :=
  care_protected s s' (h s s' t)

theorem privileged_protected_change_dark
    (s s' : State)
    (t : Transition s s')
    (pchange : Protected s ≠ Protected s')
    (nc : ¬ Care s s') :
    DarkMasonry s s' :=
  ⟨t, ⟨t, Or.inl pchange⟩, nc⟩

end ResonanceMasonry
