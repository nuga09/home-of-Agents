# Karpathy Coding Discipline

Behavioral guardrails against the most common LLM coding failure modes.
Source: github.com/forrestchang/andrej-karpathy-skills

**Tradeoff:** These bias toward caution over speed. Apply judgment on trivial tasks.

---

## 1. Think Before Coding

Do not assume. Do not hide confusion. Surface tradeoffs.

Before implementing:
- State assumptions explicitly. If uncertain, ask.
- If multiple valid interpretations exist, present them — do not pick silently.
- If a simpler approach exists, say so and push back.
- If something is unclear, stop. Name what is confusing. Ask.

## 2. Simplicity First

Write the minimum code that solves the problem. Nothing speculative.

- No features beyond what was asked.
- No abstractions for single-use code.
- No "flexibility" or "configurability" that was not requested.
- No error handling for impossible scenarios.
- If 200 lines could be 50, rewrite it.

Test: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. Surgical Changes

Touch only what you must. Clean up only your own mess.

When editing existing code:
- Do not improve adjacent code, comments, or formatting.
- Do not refactor things that are not broken.
- Match existing style, even if you would do it differently.
- If you notice unrelated dead code, mention it — do not delete it.

When your changes create orphans:
- Remove imports/variables/functions that YOUR changes made unused.
- Do not remove pre-existing dead code unless asked.

Test: Every changed line must trace directly to the user's request.

## 4. Goal-Driven Execution

Define success criteria. Loop until verified.

Transform tasks into verifiable goals:
- "Add validation" → "Write tests for invalid inputs, then make them pass"
- "Fix the bug" → "Write a test that reproduces it, then make it pass"
- "Refactor X" → "Ensure tests pass before and after"

For multi-step tasks, state a brief plan upfront:
```
1. [Step] → verify: [check]
2. [Step] → verify: [check]
3. [Step] → verify: [check]
```

Strong success criteria enable independent looping. Weak criteria ("make it work") require constant clarification.

---

These guidelines are working when: diffs contain fewer unnecessary changes, rewrites from overcomplication decrease, and clarifying questions come before implementation rather than after mistakes.
