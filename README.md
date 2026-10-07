# Lean, But Not Proven

**A cautionary tale about formal verification and mathematical claims.**

## The Thesis

When you see "they proved P = NP in Lean," remember this: **Lean verifies that your formal statement follows from your definitions and axioms.** It does *not* certify that you encoded the actual P vs NP problem correctly.

This repository contains three tiny, self-contained examples that all claim to prove P = NP. Each one type-checks perfectly in Lean 4. None of them prove anything about the actual complexity classes P and NP.

## The Examples: Three Ways to "Prove" P = NP

### 1. [Definitional Smuggling](LeanButNotProve/DefinitionalSmuggling.lean)

**The Trick:** Define a proposition *named* `PEqualsNP` as simply `True`, then prove it trivially.

**What Lean Checks:** That `trivial` is a valid proof of our definition of `PEqualsNP` ✓

**What Lean Doesn't Check:** Whether our definition encodes the actual complexity classes ✗

**Moral:** The statement is wrong, not the prover. Names don't carry mathematical meaning.

---

### 2. [Vacuous Proof](LeanButNotProve/VacuousProof.lean)

**The Trick:** Define "computational problems" as an empty type, then prove P = NP over it.

**What Lean Checks:** That we correctly proved ∀ prob, (prob ∈ P ↔ prob ∈ NP) for our encoding ✓

**What Lean Doesn't Check:** That our encoding contains any actual problems to compare ✗

**Moral:** "All dragons are blue" is vacuously true when there are no dragons. P = NP is vacuously true when there are no problems.

---

### 3. [Axiom Laundering](LeanButNotProve/AxiomLaundering.lean)

**The Trick:** Declare "P = NP" as an axiom, then "prove" a theorem by citing that axiom.

**What Lean Checks:** That our theorem follows from our axioms ✓

**What Lean Doesn't Check:** Whether our axioms are justified ✗

**Moral:** Assuming the answer is not the same as proving it.

---

## Why This Matters

Formal verification is powerful and valuable. Projects like Mathlib formalize real mathematics with impressive rigor. But formalization is only as good as the encoding.

When someone claims "P = NP was proved in Lean" (or any major result):
1. ✅ Ask: "What exactly was the formal statement?"
2. ✅ Check: Do the definitions faithfully encode the complexity classes?
3. ✅ Verify: Were any suspicious axioms introduced?
4. ✅ Look: Does the proof work by construction, or is something defined away?

This repo is pedagogical satire—toy examples to illustrate pitfalls, not an attack on Lean or formal mathematics. The real P vs NP problem remains wide open, and no amount of definitional trickery changes that.

## How to Build

This is a minimal Lean 4 project with no dependencies (not even Mathlib).

```bash
# Install Lean 4 via elan if you haven't already:
# curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

# Build the project:
lake build
```

All three examples type-check cleanly. They're supposed to—that's the point.

## Repository Structure

```
p-eq-np-in-lean-not-really/
├── README.md                                    # You are here
├── lean-toolchain                               # Lean version specification
├── lakefile.lean                                # Build configuration
└── LeanButNotProve/
    ├── DefinitionalSmuggling.lean              # P = NP via bad definition
    ├── VacuousProof.lean                       # P = NP via empty domain
    └── AxiomLaundering.lean                    # P = NP via axiom
```

## A Note on Tone

This repository is meant to be educational and constructive. Formal verification is a remarkable achievement, and Lean is an excellent tool. The goal here is to help people understand what "proved in Lean" actually means—and what it doesn't mean.

If you're interested in *real* formalized mathematics, check out:
- [Mathlib](https://github.com/leanprover-community/mathlib4) – Lean's mathematics library
- [Lean 4 Documentation](https://lean-lang.org/)
- The [Liquid Tensor Experiment](https://leanprover-community.github.io/liquid/) – a serious formalization project

## License

This repository is released into the public domain (CC0). Use it however you like.

---

*"The map is not the territory, and the formalization is not the mathematics."*
