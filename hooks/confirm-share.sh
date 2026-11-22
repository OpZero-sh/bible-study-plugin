#!/bin/sh
# Asks the person to confirm before a journal item is made public by link.
# This script is local. It never reads the tool payload, writes to disk or uses the network.
cat <<'RESULT'
{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "ask", "permissionDecisionReason": "Bible Journal is about to create a public link to one journal item. Anyone who has the link can read that item and its passage until the link is revoked. Approve only if you asked to share this item."}}
RESULT
