import Std.Tactic.Basic

open Lean Elab Tactic Meta

elab "foo" : tactic => liftMetaTactic fun g => do
  g.assign (← mkFreshExprMVar (← g.getType))
  throwError ""

#guard_msgs in
example : True := by
  repeat' foo
  trivial
