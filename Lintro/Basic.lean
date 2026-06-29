/-
Copyright (c) 2026 Paul Lezeau. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Paul Lezeau
-/

import Mathlib

/-! # A small demo file

This file contains a few basic demos to show how Lean works.

Before using this, make sure you have the Lean and Error lens extensions installed.

-/




































/- The basic syntax -/

theorem my_first_theorem : 1 + 1 = 2 := by
  rfl

/-- Triangular numbers are numbers of the form ∑_{i = 0}^n i. -/
def TriangularNumber (n : ℕ) : ℕ :=
  ∑ i ∈ Finset.Icc 1 n, i

theorem triangularNumber_eq (n : ℕ) : TriangularNumber n = Nat.choose n 2 := by
  rw [TriangularNumber]
  induction n with
  | zero => sorry
  | succ n ih => sorry






































/- Tactics -/

example (P Q : Prop) (P_implies_Q : P → Q) (h : P) :
    Q := by
  apply P_implies_Q
  exact h

example (a b c : Nat) (H : a ∣ b) :
    a ∣ b * c := by
  obtain ⟨d, hd⟩ := H
  use d * c
  rw [hd]
  ring

example {R : Type} [CommRing R] : ∀ (x y : R), (x + y)^2 = x^2 + 2 * x * y + y^2 := by
  intro x y
  let u := x+y
  ring


example (a b c : ℚ) (hab : a ≤ b) (hbc : b ≤ c) : a + 1 ≤ c + 1 := by
  linarith

example : 1 ≤ 2 := by
  decide

example : (10 ^ 81 - 9) * Real.pi
  =
  999999999999999999999999999999999999999999999999999999999999999999999999999999991 * Real.pi := by
  norm_num




section

open Nat

/-- There are infinitely many primes. -/
theorem primes_big (n : ℕ) : ∃ p ≥ n, p.Prime := by
  sorry























end

/-
Algebraic structures
-/

-- Let `G` be a group:
variable {G : Type} [Group G]
variable (a b c : G)

example : a * (b * c) = (a * b) * c := by
  rw [mul_assoc]

-- We can use the usual multiplicative notation:


-- Let `R` be a commutative ring:

-- Many of the structures you'll need are defined in Mathlib already
#synth Ring ℤ
#synth Field ℝ
#synth IsDedekindDomain ℤ

















/-
A few confusing things / subtle things
-/

variable (x : ℕ)

/- Coercions -/

#check x
#check -1
#check (-1 : ℤ) + x

example (a b : ℕ) (H : a ≤ b) : (a : ℤ) ≤ b := by
  grind

/- Junk values -/
#check 1 / 0
#eval 1 / 0
#check 1 / 2
#eval 1 / 2
#check √(- 8)

example : √(- 8) = 0 := by
  grind

/- Sets -/



#check Set Nat
#check {n : ℕ | n ≥ 5}
#check {n : ℤ | n ≤ 5}
#check  {n : ℕ | n ≥ 5} ∪ {n : ℕ | n ≤ 5}
-- Throws an error
#check  {n : ℕ | n ≥ 5} ∪ {n : ℤ | n ≤ 5}
#check ((↑) : ℕ → ℤ) '' {n : ℕ | n ≥ 5} ∪ {n : ℤ | n ≤ 5}

example (n : Nat) (h : n ∈ ({m : Nat | m <= 5} : Set Nat)) : n <= 5 := by
  exact h

#check ((3 : Nat) : Int)
example : ((3 : Nat) : Int) = 3 := rfl

/- Definitions vs theorems -/

-- The first isomorphism theorem

-- Let `G` and `G'` be groups and `ψ` a group hom
variable {G G' : Type} [Group G] [Group G'] (ψ : G →* G')

noncomputable def first_isomorphism_theorem : G ⧸ ψ.ker ≃* ψ.range :=
  -- This is in Mathlib
  QuotientGroup.quotientKerEquivRange ψ









/- Mathlib Idioms -/

-- Ideals
variable {R : Type} [CommRing R] (I J : Ideal R)

#check I ⊔ J -- Means I + J
#check I ⊓ J -- Means I ∩ J

example : I + J = I ⊔ J := rfl

example : ((I : Set R) ∩ (J : Set R)) = I ⊓ J := rfl
