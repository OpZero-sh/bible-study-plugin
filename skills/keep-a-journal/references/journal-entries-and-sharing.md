# Journal entries, limits and share links

Facts in this file come from the Bible Journal server: its generated tool reference and its public guide and privacy policy at https://bible-journal.mcp.opzero.sh/?page=docs.

## Sign in

Bible Journal uses OpZero accounts through OAuth. Each signed in person can reach only their own journal. Saving a journal requires the person to confirm they are 13 or older and to accept the service's privacy policy and terms. Reading in the reader on the service's web page needs no account, but every journal tool in this plugin does.

## Kinds of entry

| Kind | Made by | Holds |
| --- | --- | --- |
| highlight | `highlight` | A passage and a colour: yellow, green, blue, pink or purple |
| note | `add_note` | A passage and the person's own words |
| link | `link_verses` | Two passages and an optional label |

Each write returns an item id. Ids look like `43003016-nlx9k2ab12`. Keep the id from a write result when a later step in the same conversation needs it. Otherwise find it with `list_journal`.

## Limits

- A note holds up to 5000 characters.
- A link label holds up to 200 characters.
- One saved item can cover a passage of up to three chapters.
- `list_journal` returns newest first, 50 entries by default and at most 200.
- The reader shows the Berean Standard Bible by default or the King James Version, with the license notice for the chosen translation.

## What each tool changes

| Tool | Server annotation | In plain terms |
| --- | --- | --- |
| `open_reader` | writes, idempotent | Reads the chapter and records the reading position so the reader can reopen there |
| `highlight` | writes, destructive | Saves a highlight. On the same range it replaces the colour. |
| `add_note` | writes, destructive | Saves a note. With an id it replaces that note's text. |
| `link_verses` | writes | Saves a link. It replaces nothing. |
| `list_journal` | read only | Lists or searches entries |
| `create_share_link` | writes, idempotent, reaches outside this server | Makes one item public by link |
| `revoke_share_link` | writes, destructive, idempotent | Turns a link off |

Replacing a note's text or a highlight's colour cannot be undone from these tools. Read the current value back before a replacement the person may regret.

## Share links

- A link is for one item. It shows that item and its passage. It never shows the person's name or email.
- Anyone who has the link can read the item until the link is revoked.
- Editing a shared note updates what the link shows.
- Revoking the link, or deleting the item, turns the link off. The page then says the link is not active.
- Creating a link for an item that is already shared is idempotent.
- The service may remove share links that are used for abuse, spam or anything unlawful.

When presenting a link, say once who can read it and how to turn it off. Do not post the link anywhere on the person's behalf.

## What the service stores

The service's privacy policy says it stores the highlights, notes, links and share links the person saves, with the time each was saved, under the account identifier from sign in. It also remembers the last chapter opened for up to 90 days so the reader can reopen it. It says it does not log the passages read or the searches made. Notes may reveal religious belief, which some laws treat as sensitive personal data. Point the person to the policy for anything beyond these statements.

## Error messages

| Message begins | Meaning | What to do |
| --- | --- | --- |
| Sign in to use your journal | No signed in user on the call | Ask the person to connect and sign in again |
| No book named ... | The reference was not understood. The message suggests close book names. | Ask for the reference again |
| That passage is too long | The item would cover more than three chapters | Ask the person to narrow it |
| Notes can be up to 5000 characters | The note is too long | Ask whether to split it. Do not trim it yourself. |
| No journal item with id ... | The item was deleted or the id is wrong | Look it up again with `list_journal` |
| This link is not active | The share link was revoked or its item deleted | Tell the person. Offer a new link only if they ask. |
| Scripture service error | The Bible text could not be loaded just then | Try once more, then report it |

## Not a counseling service

The service states that it is not a counseling or crisis service. If a note or a request shows that the person may be in danger or in crisis, set the journal task aside and point them to help: in the United States, 911 for immediate danger and call or text 988 for crisis support. Elsewhere, local emergency services. Do not raise this in ordinary journal use.
