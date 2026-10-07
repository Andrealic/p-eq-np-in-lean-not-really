/-
# Vacuous Proof: The "P = NP" Proof (Empty Domain Version)

This file demonstrates how you can "prove" P = NP by defining the domain
of computational problems as empty, making the equality vacuously true.

A statement like "all dragons are blue" is vacuously true if there are no dragons.
Similarly, "P = NP" becomes vacuous if there are no problems to compare.
-/

-- We'll define what we claim is the type of "computational problems".
-- But we define it as an empty type!
def ComputationalProblem : Type := Empty

-- Now we define predicates for membership in P and NP.
-- These can never actually be called since ComputationalProblem is empty.
def inP (prob : ComputationalProblem) : Prop :=
  -- Can't check if prob is in P because prob doesn't exist
  True

def inNP (prob : ComputationalProblem) : Prop :=
  -- Can't check if prob is in NP because prob doesn't exist
  True

-- Define "P = NP" as: every problem is in P iff it's in NP
def PEqualsNP_Vacuous : Prop :=
  ∀ (prob : ComputationalProblem), inP prob ↔ inNP prob

-- And now the "proof"
theorem p_equals_np_vacuous : PEqualsNP_Vacuous := by
  -- We need to prove: ∀ prob, inP prob ↔ inNP prob
  intro prob
  -- But prob has type Empty (by definition of ComputationalProblem)
  -- From a value of type Empty, we can prove anything!
  exact Empty.elim prob

/-
What went wrong?
- We defined ComputationalProblem as Empty, so there are no problems to compare
- The universal quantifier ∀ over an empty domain is vacuously true
- Lean correctly verified our proof of our (vacuous) statement
- We never encoded SAT, traveling salesman, or any actual problems

The cheat: We encoded P = NP over an empty universe, making it meaningless.

Moral: A statement being "provable" depends entirely on the encoding.
If you encode a problem badly enough, it can become trivial.
-/

#check p_equals_np_vacuous  -- p_equals_np_vacuous : ∀ (prob : Empty), True ↔ True
