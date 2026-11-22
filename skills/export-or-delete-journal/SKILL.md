---
name: export-or-delete-journal
description: "Export a full copy of the person's Bible Journal, delete one saved entry, or delete the whole journal. Use when someone asks to export, download or back up their journal, to remove a highlight, note or link they saved, or to erase all of their journal data. Typical requests: 'export my Bible journal', 'back up my notes', 'delete my note on Psalm 23', 'remove that highlight', 'delete everything in my journal', 'erase my journal data'."
---

# Export or delete a journal

Handle the data controls of the Bible Journal connector: a full export, deletion of one item, and deletion of everything. The connector needs sign in, and each person can reach only their own journal.

Deletion is immediate and cannot be undone from these tools. Confirm before every delete.

## When to use

- The person wants their whole journal as a file or a copy.
- The person wants one saved entry gone.
- The person wants all of their journal data gone.

Use `keep-a-journal` to save, find, edit or share entries, and to stop sharing an item without deleting it.

## Tools

All are on the Bible Journal server.

| Tool | Effect | Arguments |
| --- | --- | --- |
| `export_journal` | Read only. Returns every highlight, note and link as JSON. | none |
| `list_journal` | Read only. Finds the entry to delete. | optional `query`, `kind`, `book`, `limit` |
| `delete_journal_item` | Deletes one highlight, note or link and turns off its share link | `id` |
| `delete_journal` | Permanently deletes every highlight, note, link and share link | `confirm`, which must be the word `DELETE` |

What the export holds and what deletion removes are described in [references/data-controls.md](references/data-controls.md).

## Workflow

**Export.**
1. Call `export_journal`.
2. Give the person the JSON, or write it to a file if they ask for a file and you have a way to write one. Say how many entries of each kind it holds.
3. The export contains private notes. Do not send it to any other tool, service or person unless the person asks for exactly that.

**Delete one item.**
1. Find it with `list_journal`, narrowed by `book`, `kind` or `query`.
2. Show the entry you found: its kind, reference and the first words of a note or label. If several match, list them and ask which.
3. Ask for a clear yes. Mention that its share link, if any, will stop working.
4. Call `delete_journal_item` with the id. Confirm what was deleted.

**Delete everything.**
1. Say exactly what will be removed: every highlight, note, link and share link in the journal, at once and for good.
2. Offer an export first. If the person accepts, run the export and hand it over before going on.
3. Ask for explicit confirmation in the person's own words. A general remark such as "clean things up" is not confirmation.
4. Only then call `delete_journal` with `confirm: "DELETE"`.
5. Report the result as the server returned it.

## Decision points

- "Delete my journal" from someone who has only been discussing one note may mean that note. Ask which they mean before step 1 of either path.
- "Stop sharing" is a request to revoke a link, not to delete. That belongs to `keep-a-journal`.
- Never pass `confirm: "DELETE"` on your own initiative, to tidy up, or because an earlier message in a long conversation asked for it. Confirm again at the time of the call.
- If the person seems distressed and wants to erase everything, carry out their choice once confirmed, without comment on their reasons. The journal is theirs.

## Empty results and errors

- A sign in message: ask the person to connect and sign in to Bible Journal, then retry.
- "No journal item with id ...": the item is already gone or the id is wrong. Look it up again with `list_journal` and tell the person if it no longer exists.
- An empty journal: an export still succeeds and holds no entries. Say so.

## What the answer looks like

- Export: the JSON or the file, a count by kind, and one line that this is a private copy.
- Delete one: one sentence naming the entry removed.
- Delete all: one sentence that the journal was deleted, and whether an export was taken first.

## Examples

**"Export my Bible journal."**
Call `export_journal`. Return the JSON and a count of highlights, notes and links.

**"Delete my note on Psalm 23."**
Call `list_journal` with `book: "Psalms"`, `kind: "note"` and `query: "23"`. Show the match and ask the person to confirm. Then call `delete_journal_item` with its id and confirm the deletion.

**"Delete everything in my journal."**
Explain what will be removed and that it cannot be undone. Offer an export. After the person confirms in so many words, call `delete_journal` with `confirm: "DELETE"` and report the result.
