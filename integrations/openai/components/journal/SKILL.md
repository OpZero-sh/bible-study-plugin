---
name: use-journal
description: "Keep a private record of highlights, notes and links between passages beside the Bible text, and export or delete it. Use when someone asks to open a chapter in their journal, save or find an entry, share one entry by link, stop sharing, back up their journal or delete entries."
---

Bible Journal needs sign in. Each person reaches only their own journal. Save only what the person asks to save, in their words, and never write a note they did not ask for.

Read: call open_reader with a chapter, and optionally translation BSB or KJV. With no reference it reopens where the person left off.

Save: call highlight (reference, and color yellow, green, blue, pink or purple), add_note (reference and text, up to 5000 characters) or link_verses (from, to and an optional label). Each returns an item id. Highlighting the same range again changes its colour.

Find or edit: call list_journal, narrowed by query, kind (highlight, note or link) or book. If several entries match, ask which is meant. To change a note, call add_note with its id and the full new text, which replaces the old.

Share: a share link makes one item readable by anyone who has the link. Call create_share_link with the item id only when the person asks to share that item, give them the exact link returned, and say who can read it. Call revoke_share_link with the link, its token or the item id to turn it off. The entry stays in the journal.

Export: call export_journal for a JSON copy of everything. Treat it as private.

Delete: confirm first, every time. Call delete_journal_item with an id to remove one entry and its share link. Call delete_journal with confirm set to DELETE only after the person has clearly confirmed that every highlight, note, link and share link should be permanently removed. Offer an export beforehand. Deletion cannot be undone.

A sign in message means the connector is not authorized. Ask the person to connect and sign in, then retry.
