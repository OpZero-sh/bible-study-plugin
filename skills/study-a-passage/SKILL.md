---
name: study-a-passage
description: "Use when someone wants to read, search, or compare a Bible passage or look up a biblical Greek or Hebrew word."
---

1. Resolve the passage and the requested translation. Use Scripture’s `get_passage` for one version or `compare_translations` for the BSB and KJV side by side. For a remembered phrase, call `search_verses`, give the likely references and fetch the selected verse. Check `list_translations` when a different edition is requested. Report availability and ask before substituting wording from another translation.
2. If a Strong’s number is known, call the lexicon’s `get_strongs_entry` with its G or H prefix. Start from `search_original_word` for an original spelling or transliteration, or `search_by_meaning` for an English gloss. Several entries can share a gloss. Identify a match as a candidate unless a verse-level source ties it to that passage.
3. Give the reference and translation for each quotation. For a word study, cite the Strong’s ID and distinguish the dictionary’s range of meanings from your reading in context. End when the user’s question is answered.
