# Strong's entries: fields, search behavior and how to read them

Facts about the data come from the Greek and Hebrew Word Study server: its tool results and its public guide at https://greek-hebrew-word-study.mcp.opzero.sh/?page=docs. The reading rules at the end are standard cautions in word study and apply to any lexicon.

## Source

- James Strong, Exhaustive Concordance of the Bible, 1890. The 1890 text is public domain.
- The digital edition is Open Scriptures Strong Dictionaries, licensed CC BY-SA. Credit it that way when an answer reproduces an entry at length.
- About 14,000 entries. G numbers are New Testament Greek. H numbers are Old Testament Hebrew and Aramaic.
- The server states that requests are not stored.

## Fields in an entry

| Field | What it is | How to use it |
| --- | --- | --- |
| Strong number | The index number with its G or H prefix | Always cite it. It is the stable handle for the word. |
| Original word | The lemma in Greek or Hebrew script | Give it with the transliteration. |
| Transliteration | Strong's own romanization, with his diacritics | Report as given. It often differs from popular spellings: the entry for chesed is spelled chêçêd. |
| Pronounced | A rough English pronunciation, present on entries that have one | Optional in an answer. |
| Definition | Strong's gloss, sometimes with remarks on usage | Report it as the dictionary's wording. |
| KJV renders it | The English words the King James Version uses for this lemma, in Strong's compressed notation | A list of renderings across the whole Bible, not the rendering in any one verse. |
| Derivation | The word or root Strong traces it to, usually another Strong number | Label it as derivation. A derivation is history, not present meaning. |

Strong's notation in the renderings line includes parentheses for optional parts of a rendering, and marks such as `+`, `X`, `[idiom]` and `[phrase]`. Reproduce the line as given and do not expand the marks into claims.

## How the searches behave

- `search_by_meaning` matches an English word in the definition or in the KJV renderings. The result line gives the number of entries that use the word and how many are shown, closest first. A broad word such as love returns entries where love is only one rendering among many, so check why each hit is there.
- It matches whole words as they stand in the entries. A compound that Strong prints with a hyphen or parentheses, such as "(loving-) kindness", is found by searching kindness, not lovingkindness.
- `search_original_word` accepts a transliteration and ignores accents. A plain spelling such as chesed finds the entry Strong spells chêçêd. It can also return proper names that share the letters, such as personal names built on the same word.
- A search in Greek or Hebrew script may report a very large match count with unrelated entries after the first. Use the hit whose lemma equals the word searched and ignore the rest.
- Search results cut long definitions and long rendering lists short and end them with an ellipsis. Call `get_strongs_entry` for the full text before quoting.
- A search returns at most 25 entries. There is no paging, so narrow the search instead.

## Errors

| Situation | Server response | What to do |
| --- | --- | --- |
| Number without a valid prefix or outside the range | A message asking for a Strong number such as G26 or H157 | Ask whether Greek or Hebrew is meant and retry. |
| English word not in any entry | A message that no entries use the word | Try a simpler or related word. |
| Transliteration not found | A message suggesting another spelling | Try another common romanization. |

## What this data cannot do

- It cannot say which entry lies behind a word in a specific verse. There is no verse by verse tagging. A link from an English word in a verse to a Strong's number is a candidate until a tagged text or interlinear confirms it.
- It gives no frequency, no list of occurrences, no grammar or parsing, and no usage by author or period.
- It is a dictionary from 1890. Later lexicons draw on manuscripts, papyri and comparative evidence found since. Say so when a fine point of meaning is at stake.

## Reading an entry responsibly

Keep the gloss and the interpretation apart. An answer should make it obvious which sentences report the dictionary and which are a reading of a passage.

- **A gloss is a range, not a verdict.** The definition and the renderings list what the word can mean. Context decides what it means in a verse.
- **Do not load every sense into one verse.** A word does not carry all of its possible meanings each time it is used.
- **Derivation is not definition.** Where a word came from does not fix what a writer meant by it. Report the derivation as background only.
- **Do not build contrasts the entry does not make.** Two words with different numbers may overlap heavily in use. The entries alone cannot show that one author meant a sharp distinction between them.
- **Do not read later English back in.** An English word that descends from a Greek word tells nothing reliable about the Greek word's ancient sense.
- **Renderings are the KJV's.** They show how one translation handled the word. They are not a ranking of best meanings.
- **Stay within the evidence.** If the person wants a firm conclusion about a passage, give the entry, give the candidates, say what would be needed to confirm it, and let them weigh it. Traditions differ on many readings. Present the data and leave doctrinal conclusions to the reader.

## Answer template

```
G26  ἀγάπη  (agápē)
Dictionary: <definition as given>
KJV renderings: <as given>
Derivation: <as given, if any>

In this passage: <one or two sentences, clearly marked as interpretation, or a note that the verse link is unconfirmed>
Source: Strong's Exhaustive Concordance, 1890, via Open Scriptures (CC BY-SA).
```
