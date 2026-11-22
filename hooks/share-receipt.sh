#!/bin/sh
# This cue is local. It never reads the tool payload or writes to disk.
cat <<'RESULT'
{"hookSpecificOutput": {"hookEventName": "PostToolUse", "additionalContext": "If the result contains a newly created journal link, give the person that exact link. Explain that anyone with the link can read the selected item until it is revoked. Leave the note text out of the receipt unless requested."}}
RESULT
