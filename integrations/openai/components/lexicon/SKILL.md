---
name: use-lexicon
description: "Look up a biblical Greek or Hebrew word in Strong's dictionary by number, by original spelling or transliteration, or by English meaning. Use when someone asks what a Bible word means in the original language or which words an English word translates."
---

Greek and Hebrew Word Study is public and read only. It serves Strong's dictionaries of 1890. G numbers are New Testament Greek. H numbers are Old Testament Hebrew and Aramaic.

1. With a number, call get_strongs_entry with its prefix, for example G26 or H2617.
2. With an original word or a transliteration, call search_original_word. Accents are ignored. Then read the entry that fits with get_strongs_entry.
3. With an English word, call search_by_meaning. It takes one word and matches it in definitions and KJV renderings. Set language to greek or hebrew when the testament is known. Search results shorten long definitions, so read the full entry before quoting it.

Treat search hits as candidates and identify each by number and lemma. Several entries share one English gloss, and a transliteration search can return proper names. This connector has no verse by verse tagging, so an English gloss alone does not prove which original word appears in a particular verse. Say so when the question is about a specific verse.

In the answer give the Strong's number, the word in its original script, the transliteration, the definition and the KJV renderings as the entry gives them, and the derivation labeled as derivation. Put any reading of a passage in a separate, clearly marked sentence. A gloss shows a range of possible senses and context decides which applies. Mention that the definitions date from 1890 when a fine point of meaning is at stake. A search returns at most 25 entries.
