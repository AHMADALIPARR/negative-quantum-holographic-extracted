-- RESONANCE MASONRY Lean 4 core (from upstream tar + tree)
import Std.Data.Set.Basic

namespace ResonanceMasonry

inductive GeoRel
  | orthogonal | horizontal | vertical | symmetric | congruent
  deriving DecidableEq, Repr

inductive EthRel
  | rectitude | equity | integrity | selfConsistent | coherent
  deriving DecidableEq, Repr

structure Geometry where
  geoRels : List GeoRel
  loadBearing : Bool
  deriving Repr

structure Ethic where
  ethRels : List EthRel
  trustBearing : Bool
  deriving Repr

structure OpState where
  stone : Nat
  geometry : Geometry
  deriving Repr

structure SpState where
  agent : Nat
  ethic : Ethic
  deriving Repr

abbrev allowedGeo : List GeoRel :=
  [.orthogonal, .horizontal, .vertical, .symmetric]

abbrev allowedEth : List EthRel :=
  [.rectitude, .equity, .integrity, .selfConsistent]

def psiRel : GeoRel → EthRel
  | .orthogonal => .rectitude
  | .horizontal => .equity
  | .vertical => .integrity
  | .symmetric => .selfConsistent
  | .congruent => .coherent

def memGeo (r : GeoRel) (xs : List GeoRel) : Prop := r ∈ xs
def memEth (r : EthRel) (xs : List EthRel) : Prop := r ∈ xs
def subsetGeo (xs : List GeoRel) : Prop := ∀ r, memGeo r xs → memGeo r allowedGeo
def subsetEth (xs : List EthRel) : Prop := ∀ r, memEth r xs → memEth r allowedEth

def opInvariant (nonEmpty : Bool) (s : OpState) : Prop :=
  subsetGeo s.geometry.geoRels ∧
  (nonEmpty = false ∨ s.geometry.geoRels ≠ []) ∧
  s.geometry.loadBearing = true

def mapRels (xs : List GeoRel) : List EthRel := xs.map psiRel

def psiGeometry (g : Geometry) : Ethic :=
  { ethRels := mapRels g.geoRels, trustBearing := g.loadBearing }

def psi (s : OpState) : SpState :=
  { agent := s.stone, ethic := psiGeometry s.geometry }

def spInvariant (s : SpState) : Prop :=
  subsetEth s.ethic.ethRels ∧ s.ethic.trustBearing = true

def lightMasonry (s : SpState) : Prop :=
  spInvariant s ∧ s.ethic.ethRels ≠ []

end ResonanceMasonry
