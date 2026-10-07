# P = NP in Lean (Not Really)

**Three formal "proofs" that type-check but prove nothing.**

## Overview

This repository demonstrates three ways to write Lean code that appears to prove P = NP, type-checks successfully, and yet proves nothing about the actual complexity classes P and NP.

The point: **a formal proof is only as meaningful as its definitions and axioms.** Lean verifies that your conclusions follow from your premises—it cannot verify that your premises capture the real mathematical problem.

## The Three Examples

### 1. [Definitional Smuggling](LeanButNotProve/DefinitionalSmuggling.lean)

We define complexity classes `ComplexityClassP` and `ComplexityClassNP` with proper-looking structure (decision problems, time bounds, solvability predicates), but use the *same* `solvableInTime` predicate for both classes.

**The Cheat:** The definitions don't distinguish between deterministic and nondeterministic computation. By construction, P and NP are the same type, so `P = NP` follows by reflexivity.

**What's Missing:** A computational model that separates deterministic from nondeterministic time complexity. The real P vs NP question is precisely about whether this distinction matters.

---

### 2. [Vacuous Proof](LeanButNotProve/VacuousProof.lean)

We set up alphabets, Turing machines, polynomial time bounds, and verifiers—all the right vocabulary. Then we define `ProblemInstance` as `Fin 0`, an empty type.

**The Cheat:** When there are zero problem instances, any universal statement about "all problems" becomes vacuously true. P = NP holds because there are no problems to compare.

**What's Missing:** Actual problems. SAT, CLIQUE, HAMPATH, and the thousands of problems that make the P vs NP question meaningful simply don't exist in this encoding.

---

### 3. [Circular Reasoning](LeanButNotProve/AxiomLaundering.lean)

We set up Turing machines, polynomial-time reductions, and prove P = NP through what looks like a structured multi-step argument. The proof uses a lemma about a "universal problem" that all NP problems reduce to.

**The Cheat:** The lemma `np_reduces_to_universal_in_p` claims there exists a problem U that is in both P and NP, with all NP problems reducing to it. But asserting U is in P (without proving it) is equivalent to assuming P = NP. The circular assumption is hidden in a helper lemma.

**What's Missing:** An actual proof that an NP-complete problem is in P. The lemma simply asserts this, making the entire argument circular. The multi-step structure masks the fact that we assumed the conclusion.

---

## Why This Matters

Formal verification has revolutionized parts of mathematics and computer science. When used carefully, tools like Lean provide unprecedented rigor. But formalization requires:

1. **Faithful encoding** of the informal problem
2. **Justified axioms** that don't assume the conclusion
3. **Non-vacuous domains** with actual instances to reason about

When you encounter claims like "X was proved in Lean":
- Read the formal statement
- Check the definitions against the informal problem
- Verify no axioms smuggle in the conclusion
- Confirm the domain is non-empty when it needs to be

This repository is for education, not critique. Lean is an excellent tool. The P vs NP problem remains open. These examples simply illustrate that type-checking ≠ mathematical truth.

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
    └── AxiomLaundering.lean                    # P = NP via circular reasoning
```

## Learn More

Interested in serious formal verification?

- [Mathlib](https://github.com/leanprover-community/mathlib4) – Lean's mathematics library with thousands of properly formalized theorems
- [Lean 4 Documentation](https://lean-lang.org/) – Language reference and tutorials
- [Liquid Tensor Experiment](https://leanprover-community.github.io/liquid/) – Major formalization project that correctly encoded and proved a deep result

For complexity theory background:
- Arora & Barak, *Computational Complexity: A Modern Approach*
- [The P versus NP problem](https://www.claymath.org/millennium/p-vs-np/) (Clay Math Institute)

## License

Released into the public domain (CC0). Use freely.
