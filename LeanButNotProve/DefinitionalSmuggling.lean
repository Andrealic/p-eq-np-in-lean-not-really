/-
# Definitional Smuggling: The "P = NP" Proof

This file demonstrates how you can "prove" P = NP by simply defining
a proposition *named* `PEqualsNP` to be something trivially true.

Lean verifies that our proof is valid for *our definition*.
It does NOT verify that our definition captures the real P vs NP problem.
-/

-- We define a proposition called PEqualsNP.
-- But notice: we're just defining it as True!
-- We're not actually encoding the complexity classes P and NP at all.
def PEqualsNP : Prop := True

-- Now we can "prove" our "theorem"
theorem p_equals_np : PEqualsNP := by
  -- Since PEqualsNP is definitionally equal to True,
  -- this proof is trivial.
  trivial

/-
What went wrong?
- Lean checked that `trivial` is a valid proof of `PEqualsNP`
- Lean is correct: given our definition, this IS a valid proof
- But we never encoded the actual P vs NP problem!

The cheat: the STATEMENT is wrong, not the prover.
-/

-- Just to be crystal clear, let's show what we actually "proved":
#check p_equals_np  -- p_equals_np : True (essentially)

/-
Moral: When you see "proved in Lean", always ask:
"What exactly was the formal statement?"
-/
