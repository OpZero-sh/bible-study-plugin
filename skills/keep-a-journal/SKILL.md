---
name: keep-a-journal
description: "Open the Bible reader and save, find, edit or share entries in the person's private Bible Journal: highlights, notes in their own words, and links between passages. Use when someone asks to open a chapter in their journal, highlight or mark a verse, save or change a note, connect two passages, find something they saved, share one entry by link, or stop sharing it. Typical requests: 'open John 3 in my Bible journal', 'highlight Psalm 23:1 in green', 'save a note on Romans 8:28', 'link Genesis 22:8 to John 1:29', 'what notes do I have in Psalms', 'share that note', 'turn off that share link'."
---

# Keep a journal

Work with the Bible Journal connector. It needs sign in with an OpZero account, and each person can reach only their own journal. Entries are private until the person creates a share link for one item.

Two rules govern everything here:

1. Save only what the person asks to save, in their words. Never write a note on their behalf that they did not ask for.
2. A share link is public. Create one only when the person asks to share a specific item.

## When to use

- Reading a chapter in the reader with the person's own highlights, notes and links shown.
- Saving a highlight, a note, or a link between two passages.
- Finding or editing something already saved.
- Sharing one item, or turning a share link off.

Use `study-a-passage` for a plain lookup or a translation comparison that nothing will be saved from. Use `export-or-delete-journal` to back up the journal or to delete entries.

## Tools

All are on the Bible Journal server.

| Tool | Effect | Arguments that matter |
| --- | --- | --- |
| `open_reader` | Opens a chapter with the person's entries. Saves the reading position. | optional `reference` (a chapter or a verse, which opens its chapter), optional `translation` (`BSB` default, or `KJV`) |
| `highlight` | Writes. Highlighting the same range again changes its colour. | `reference`, optional `color`: `yellow` (default), `green`, `blue`, `pink`, `purple` |
| `add_note` | Writes. With `id` it replaces the text of an existing note. | `text` (up to 5000 characters), `reference` for a new note, `id` to edit |
| `link_verses` | Writes | `from`, `to`, optional `label` (up to 200 characters) |
| `list_journal` | Read only | optional `query`, `kind` (`highlight`, `note`, `link`), `book`, `limit` (default 50, up to 200) |
| `create_share_link` | Writes and makes one item readable by anyone with the link | `id` |
| `revoke_share_link` | Turns a share link off | `target`: the link, its token, or the item id |

Limits, error messages and how share links behave are in [references/journal-entries-and-sharing.md](references/journal-entries-and-sharing.md).

## Workflow

**Read.** Call `open_reader` with the chapter. With no reference it reopens where the person left off.

**Save.**
1. Identify the passage and the kind of entry: highlight, note or link.
2. For a note, use the person's exact words. If they ask you to draft the wording, show the draft in the chat first and save it only after they approve it.
3. Call `highlight`, `add_note` or `link_verses`. For a link, name both passages. Use a label only if the person gives one or approves one.
4. Report what was saved: the kind, the reference and the returned item id. Reopen the reader if they want to see it in place.

**Find or edit.**
1. Call `list_journal`, narrowed by `book`, `kind` or `query`.
2. If more than one entry could be the one meant, list the candidates with reference and a few words of each and ask which.
3. To change a note, call `add_note` with that entry's `id` and the full new text. The new text replaces the old, so read the current text back to the person first when the change is partial.

**Share.**
1. Confirm which single item is to be shared. Get its id from `list_journal` or from the result that created it.
2. Tell the person the link will be public: anyone who has it can read that item and its passage until it is revoked.
3. Call `create_share_link` with the id. In Claude Code the plugin asks for confirmation before this call.
4. Give the exact link returned. Do not repeat the note text beside it unless asked.

**Stop sharing.** Call `revoke_share_link` with the link, the token or the item id. The note itself stays in the journal.

## Decision points

- Reading and discussion stay in the chat unless the person asks to save something. An insight you offered is not theirs to keep until they say so.
- A reference longer than three chapters cannot be saved as one item. Ask the person to narrow it.
- "Delete" is not "stop sharing". If the request is unclear, ask which they mean.

## Empty results and errors

- A sign in message means the connector is not authorized. Ask the person to connect and sign in to Bible Journal, then retry.
- "No journal entries match that": widen the filter or drop the query, then say what you searched.
- An unknown book, a passage that is too long, a note over 5000 characters, or an unknown item id each return a specific message. Relay it and ask for the correction. Do not shorten or reword a note to make it fit without asking.

## What the answer looks like

Short and factual: what was saved or found, its reference, its id when a later step may need it, and for a share link the link itself with one sentence on who can read it. Journal notes can be personal. Do not comment on their content unless invited.

## Examples

**"Save a note on Psalm 23:4 with these words: 'The valley is part of the walk.'"**
Call `add_note` with `reference: "Psalm 23:4"` and the quoted words as `text`, unchanged. Confirm the note was saved and give its id.

**"Link Genesis 22:8 to John 1:29 and call it 'the Lamb provided'."**
Call `link_verses` with `from`, `to` and that `label`. Confirm both passages and the label.

**"Share my note on Romans 8:28."**
Call `list_journal` with `book: "Romans"`, `kind: "note"` and `query: "8:28"`. If one note matches, tell the person the link will be readable by anyone who has it, then call `create_share_link` with its id and return the exact link. If several match, ask which one.
