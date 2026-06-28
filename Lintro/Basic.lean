import Mathlib

/-! # A small demo file

This file contains a few basic demos to show how Lean works
-/




































/- The basic syntax -/

theorem my_first_theorem : 1 + 1 = 2 := by
  rfl

/-- Triangular numbers are numbers of the form ∑_{i ≤ 0}^n i. -/
def TriangularNumber (n : ℕ) : ℕ := ∑ i ∈ Finset.Icc 1 n, i

theorem triangularNumber_eq (n : ℕ) : TriangularNumber n = Nat.choose n 2 := by
  rw [TriangularNumber]
  induction n with
  | zero => simp
  | succ n ih =>
    sorry
    -- rw [←Nat.succ_eq_add_one, ←Nat.succ_eq_succ]






































/- Tactics -/

example (P : Prop) (h : P) : P := by
  sorry

example : ∀ x y, (x + y)^2 = x^2 + 2 * x * y + y^2 := by
  sorry

example (a b c : ℚ) (hab : a ≤ b) (hbc : b ≤ c) : a + 1 ≤ c + 1 := by
  sorry

example : Nat.Prime 101 := by
  sorry

example (a b c : Nat) (H : a ∣ b) : a ∣ b * c := by
  sorry




section

open Nat

/-- There are infinitely many primes. -/
theorem primes_big (n : ℕ) : ∃ p ≥ n, p.Prime := by
  sorry























end

/-
Algebraic structures
-/

-- Let `G` be a group
variable {G : Type} [Group G]
variable (a b c : G)

-- We can use the usual multiplicative notation
example : a * (b * c) = (a * b) * c :=
  (mul_assoc a b c).symm

-- Let `R` be a commutative ring
variable {R : Type} [CommRing R]

-- Many of the structures you'll need are defined in Mathlib already
-- #synth Ring ℤ
-- #synth Field ℝ
-- #synth IsDedekindDomain ℤ

















/-
A few confusing things / subtle things
-/

variable (x : ℕ)

/- Coercions -/

-- #check x
-- #check -1
-- #check (-1 : ℤ) + x

-- example (a b : ℕ) (H : a ≤ b) : (a : ℤ) ≤ b := by
--   sorry

/- Junk values -/
-- #check 1 / 0
-- #eval 1 / 0
-- #check 1 / 2
-- #eval 1 / 2
-- #check √(- 8)



/- Sets -/



-- #check Set Nat
-- #check {n : ℕ | n ≥ 5}
-- #check {n : ℤ | n ≤ 5}
-- #check  {n : ℕ | n ≥ 5} ∪ {n : ℕ | n ≤ 5}
-- #check  {n : ℕ | n ≥ 5} ∪ {n : ℤ | n ≤ 5}
-- #check ((↑) : ℕ → ℤ) '' {n : ℕ | n ≥ 5} ∪ {n : ℤ | n ≤ 5}

example (n : Nat) (h : n ∈ ({m : Nat | m <= 5} : Set Nat)) : n <= 5 := by
  exact h

-- #check ((3 : Nat) : Int)
-- example : ((3 : Nat) : Int) = 3 := rfl

/- Definitions vs theorems -/

-- variable {G G' : Type} [Group G] [Group G'] (ψ : G →* G')

-- theorem first_isomorphism_theorem : G ⧸ ψ.ker ≃* ψ.range :=
  -- QuotientGroup.quotientKerEquivRange ψ









/- Mathlib Idioms -/

-- Ideals
variable {R : Type} [CommRing R] (I J : Ideal R)

-- #check I ⊔ J
-- #check I ⊓ J

-- example : I + J = I ⊔ J := rfl

-- example : ((I : Set R) ∩ (J : Set R)) = I ⊓ J := rfl
