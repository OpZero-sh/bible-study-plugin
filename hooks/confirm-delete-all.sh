#!/bin/sh
# Asks the person to confirm before the whole journal is deleted.
# This script is local. It never reads the tool payload, writes to disk or uses the network.
cat <<'RESULT'
{"hookSpecificOutput": {"hookEventName": "PreToolUse", "permissionDecision": "ask", "permissionDecisionReason": "Bible Journal is about to permanently delete every highlight, note, link and share link in your journal. This cannot be undone. Export the journal first if you want a copy. Approve only if you asked to delete everything."}}
RESULT
