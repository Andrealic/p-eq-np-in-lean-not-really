/-
# Axiom Laundering: The Fake "Proof"

This file demonstrates how you can "prove" anything by first declaring
it as an axiom, then writing a "theorem" that just appeals to that axiom.

An axiom is an unproven assumption. Lean trusts axioms by design.
If you axiomatize the conclusion, you haven't proved anything.
-/

-- Let's axiomatize the claim that P = NP.
-- (We're not even bothering to define P and NP properly here.)
axiom p_equals_np_axiom : Prop

-- We also axiomatize that this claim is true.
axiom p_np_proof : p_equals_np_axiom

-- Now we can write a "theorem" that uses the axiom.
theorem p_equals_np_theorem : p_equals_np_axiom := by
  -- Our "proof" is just: "we assumed it"
  exact p_np_proof

/-
What went wrong?
- We declared the desired conclusion as an axiom
- Then we "proved" a theorem by just citing the axiom
- Lean accepts this because axioms are trusted primitives

The cheat: We assumed the answer, then "proved" it by assumption.

Moral: Axioms are powerful and necessary (e.g., for classical logic),
but they are NOT proofs. They are assumptions.
When someone claims to have "proved X in Lean", check if they
introduced X (or something equivalent) as an axiom.
-/

-- Lean will even tell us this theorem depends on an axiom
#print axioms p_equals_np_theorem  -- Will show: p_np_proof, p_equals_np_axiom

/-
Note: Real formalization work uses axioms carefully (e.g., the axiom of choice,
function extensionality). The point here is that you can't claim to have "proved"
something if you had to assume it (or something equivalent) as an axiom first.
-/
