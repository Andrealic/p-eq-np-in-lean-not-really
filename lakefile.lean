import Lake
open Lake DSL

package «lean-but-not-prove» where
  version := v!"0.1.0"

@[default_target]
lean_lib «LeanButNotProve» where
  -- Main library target
