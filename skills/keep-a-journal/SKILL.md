---
name: keep-a-journal
description: "Use when someone asks to save or find Bible notes, highlights or cross-links, or to share or revoke one of their journal items."
---

Open the requested passage with Bible Journal’s `open_reader`. For a highlight, note, or cross-reference use `highlight`, `add_note`, or `link_verses` respectively. Preserve exact wording when supplied and identify both endpoints of a cross-reference. After a write use the returned reference and item ID. Reopen the reader when the user wants to see the change.

For an existing note, narrow `list_journal` by book, kind, or a phrase; disambiguate matches before changing one. Create a public link only when the person asks to share a specific item. Call `create_share_link` with the returned item ID. Explain the audience when presenting the link. Use `revoke_share_link` with the link or exact ID when asked to remove access. A revocation leaves the underlying note in the journal. Keep reading and interpretation in the chat unless the person asks to save something.
