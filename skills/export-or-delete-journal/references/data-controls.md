# Journal data controls

Facts in this file come from the Bible Journal server: its generated tool reference and its public guide and privacy policy at https://bible-journal.mcp.opzero.sh/?page=docs.

## What the journal holds

The service's privacy policy lists what it stores for a signed in person:

- highlights: the passage and the colour
- notes: the passage and the words the person wrote
- links between passages, with their labels
- share links the person created
- the time each was saved
- the last chapter opened, kept for up to 90 days so the reader can reopen it

Everything is stored under the account identifier that sign in provides. The policy says the journal is kept until the person deletes it.

## Export

- `export_journal` returns every highlight, note and link as JSON. It takes no arguments and changes nothing.
- The same export is available on the service's web page under My journal, as a JSON file.
- The service's terms suggest exporting if the person wants their own copy, since availability is not guaranteed.
- Treat the export as private. Notes can reveal religious belief. Keep it in the conversation or in a file the person asked for.

## Delete one item

- `delete_journal_item` removes one highlight, note or link by id.
- Deleting an item also turns off its share link. Anyone opening that link afterward sees that it is not active.
- The tool is marked destructive and idempotent. Repeating the call for an id that is already gone does no further harm, but the server may answer that no item has that id.

## Delete everything

- `delete_journal` permanently removes every highlight, note, link and share link the person has saved.
- It requires the argument `confirm` set to the word `DELETE`. The server's tool description says this is to be passed after the person has confirmed.
- The service's guide says deletion is immediate and also turns off share links.
- These tools offer no undo and no restore. An export taken beforehand is the only copy.

## Choosing the right action

| The person says | They most likely want | Tool |
| --- | --- | --- |
| stop sharing, unshare, turn off the link | The link off, the entry kept | `revoke_share_link` (see `keep-a-journal`) |
| delete, remove, get rid of this note | One entry gone | `delete_journal_item` |
| change, fix, reword this note | The text replaced | `add_note` with the entry's id (see `keep-a-journal`) |
| delete everything, erase my data, wipe my journal | The whole journal gone | `delete_journal` |
| download, back up, export | A copy | `export_journal` |

When the wording falls between two rows, ask.

## Questions about data beyond these tools

For anything these tools do not cover, such as questions about the account itself or about how long operational records are kept, point the person to the service's privacy policy and its support contact on the same site. Do not answer such questions from assumption.
