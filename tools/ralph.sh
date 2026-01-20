#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

if [ ! -f "PRD.md" ]; then
  echo "Error: PRD.md not found in current directory"
  exit 1
fi

touch progress.txt

echo "Starting Ralph - Max $1 iterations"

for ((i=1; i<=$1; i++)); do
  echo ""
  echo "Iteration $i"
  echo "--------------------------------"

  result=$(claude --permission-mode bypassPermissions --output-format text -p "@PRD.md @progress.txt

You are Ralph, an autonomous coding agent. Complete ONE task per iteration. Never perform git commits. Use parallel agents to speed up tasks.

## Serena (MCP)

Activate at session start: \`mcp__plugin_serena_serena__activate_project\`

**Use semantic tools, not file operations:**

| Task                 | Use                                            | Not                  |
| -------------------- | ---------------------------------------------- | -------------------- |
| Understand file      | \`get_symbols_overview\`                         | Reading entire file  |
| Find function/struct | \`find_symbol\` with pattern                     | Grep/glob            |
| Find usages          | \`find_referencing_symbols\`                     | Grep for text        |
| Edit function        | \`replace_symbol_body\`                          | Raw text replacement |
| Add code             | \`insert_after_symbol\` / \`insert_before_symbol\` | Line number editing  |
| Search patterns      | \`search_for_pattern\` with \`relative_path\`      | Global grep          |

**Symbol paths:** \`ClassName/method_name\` format. Patterns: \`Foo\` (any), \`Foo/bar\` (nested), \`/Foo/bar\` (exact root path).

**Workflow:**

1. \`get_symbols_overview\` first
2. \`find_symbol\` with \`depth=1\` to see methods without bodies
3. \`include_body=True\` only when needed
4. \`find_referencing_symbols\` before any refactor

## Workflow

1. Read PRD.md → find the highest-priority incomplete task ([ ])
2. Read progress.txt → check Learnings section for patterns from previous iterations
3. Ultrathink. Implement that task:
   - Clean, tested, well-named code
   - Format changes; run \`cargo +nightly fmt\`
   - Lint changes; run \`cargo +1.85 clippy\`
4. Run tests
5. Update docs based on outcome (see below)

## On Success (tests pass)

- Mark task complete in PRD.md ([ ] → [x])
- Append to progress.txt:
  \`\`\`
  ## Iteration [N] - [Task Name]
  - Implemented: [what]
  - Changed: [files]
  - Learnings: [patterns, gotchas, context]
  ---
  \`\`\`
- If you discovered a reusable pattern, add it to AGENTS.md

## On Failure (tests fail)

- Do NOT mark complete
- Append failure details to progress.txt so the next iteration can learn

## End Condition
If ALL tasks in PRD.md are complete, output: <promise>COMPLETE</promise>
")

  echo "$result"

  if [[ "$result" == *"<promise>COMPLETE</promise>"* ]]; then
    echo "Verifying all work as completed ..."

    result2=$(claude --permission-mode bypassPermissions --output-format text -p "@PRD.md @progress.txt

You are Ralph, an autonomous coding agent.

We've just completed a development sprint together. Validate that ALL work outlined in PRD.md is fully implemented. Use parallel agents to check our codebase directly.

If ALL tasks are confirmed complete, output: <promise>SUCCESS</promise>

Otherwise, output: <promise>FAILED</promise>
")

    echo "$result2"

    # TODO: If verification fails, restart loop?

    echo "PRD complete, exiting."
    # Send desktop notification if osascript is available (macOS)
    osascript -e "display notification \"PRD complete after $i iterations\" with title \"Ralph\"" 2>/dev/null || true
    exit 0
  fi
done
