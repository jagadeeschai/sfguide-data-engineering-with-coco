#!/bin/bash
# validate-bash.sh — PreToolUse hook for the bash tool.
# Blocks dbt commands that target production (--target prod / -t prod / --target=prod).

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if [[ -z "$COMMAND" ]]; then
  exit 0
fi

if echo "$COMMAND" | grep -Eq '(^|[^[:alnum:]_-])dbt([[:space:]]|$)' \
  && echo "$COMMAND" | grep -Eq '(--target|-t)([[:space:]]+|=)["'"'"']?prod["'"'"']?([[:space:]]|$|[;&|])'; then
  echo "Blocked: direct production dbt runs are not allowed. Deploy to prod through the CI/CD pipeline instead (open a PR to main)." >&2
  exit 2
fi

exit 0
