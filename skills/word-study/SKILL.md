---
name: word-study
description: "Look up a biblical Greek or Hebrew word in Strong's dictionary by Strong's number, by original spelling or transliteration, or by English meaning. Use when someone asks what a Bible word means in the original language, gives a number such as G26 or H2617, asks which Greek or Hebrew words an English word translates, or wants the word behind a term in a verse. Typical requests: 'what does agape mean', 'look up H2617', 'which Greek words are translated love', 'what is the Hebrew word chesed', 'what is the Greek behind grace'."
---

# Word study

Look up entries in the Greek and Hebrew Word Study connector, which serves Strong's dictionaries of 1890. The connector is public, read only and needs no sign in.

The entry is a dictionary gloss. It is evidence for a reading, not the reading itself. Keep those two things apart in every answer.

## When to use

- A Strong's number is given: G for New Testament Greek, H for Old Testament Hebrew and Aramaic.
- An original word or a transliteration is given, such as agape, logos or chesed.
- An English word is given and the person wants the Greek or Hebrew words behind it.

Use `study-a-passage` to fetch the verse text itself. Do not use this skill to settle a doctrinal question from a dictionary entry.

## Tools

All three are on the Greek and Hebrew Word Study server.

| Tool | Use it for | Arguments that matter |
| --- | --- | --- |
| `get_strongs_entry` | The full entry for a known number | `number`, with its prefix, for example `G26` or `H2617` |
| `search_original_word` | Finding entries from an original spelling or a transliteration, accents ignored | `word`, optional `limit` (up to 25, default 10) |
| `search_by_meaning` | Finding entries whose definition or KJV rendering contains an English word | `english` (one word), optional `language` (`greek`, `hebrew` or `both`), optional `limit` (up to 25, default 12) |

Entry fields, search behavior and the rules for reading an entry responsibly are in [references/strongs-entries.md](references/strongs-entries.md). Read it before writing more than a one line answer.

## Workflow

1. Work out what the person gave you.
   - A number: call `get_strongs_entry`.
   - An original word or transliteration: call `search_original_word`, then `get_strongs_entry` on the entry that fits.
   - An English word: call `search_by_meaning`. Set `language` when the testament is known. Then call `get_strongs_entry` on the entries worth reading in full, because search results shorten long definitions.
2. Treat search hits as candidates. Several entries share one English gloss, and a transliteration search can return proper names beside the common word. Present each candidate by number and lemma and say which you take to be meant and why.
3. If the question is about a word in a particular verse, say what this connector can and cannot show. It has no verse by verse tagging, so it cannot confirm which entry stands behind a word in a given verse. Offer the candidates, fetch the verse with `study-a-passage` if that helps, and label the link between verse and entry as unconfirmed unless the person supplies the number from a tagged source.
4. Report the entry, then your reading, in that order and under separate labels.

## Empty results, errors and ambiguity

- A number with no prefix or outside the dictionary returns an error asking for a G or H number. Ask which testament the person means. G1 and H1 are different words.
- No search matches: try a simpler transliteration, another spelling, or a search by English meaning. For an English compound such as lovingkindness, search the plain word, here kindness.
- A search in Greek or Hebrew script can report thousands of matches. Trust only a hit whose lemma is the word you searched, and prefer a transliteration when the top hit does not match.
- More entries than shown: the result states how many matched. Narrow with `language` or a more specific word. A search returns at most 25 entries.
- `english` takes one word. For a phrase, search its key word.

## What the answer looks like

- Strong's number, the word in its original script, and the transliteration.
- The definition as the entry gives it, quoted or closely reported, and the KJV renderings listed in the entry.
- Derivation when the entry gives one, marked as derivation and not as meaning.
- A separate, clearly labeled sentence or two for anything beyond the entry: how the word seems to work in the passage at hand, with the caution that context decides.
- One line on the source when it matters: Strong's definitions date from 1890 and modern lexicons may refine them.

## Limits to state when relevant

- Strong's 1890, not a modern lexicon. No frequency counts, no usage by author, no verse lists.
- Glosses and KJV renderings show a range of possible senses. They do not show which sense a given verse uses.
- Up to 25 entries per search.

## Examples

**"Look up G26 and show me the Greek spelling and the dictionary's glosses."**
Call `get_strongs_entry` with `number: "G26"`. Report the word in Greek script, the transliteration, the definition, the KJV renderings and the derivation from G25, each as the entry gives it.

**"Which Greek words are translated love?"**
Call `search_by_meaning` with `english: "love"` and `language: "greek"`. The result says how many entries use the word and shows the closest. List them by number and lemma with their short definitions. Point out that some hits are there because "love" appears among the KJV renderings of a broader word, and offer the full entry for any of them.

**"What Hebrew word is behind 'lovingkindness' in Psalm 136?"**
The search matches whole words in the entries, and the compound returns nothing, so call `search_by_meaning` with `english: "kindness"` and `language: "hebrew"`. Several entries come back. H2617 lists "(loving-) kindness" among its KJV renderings, which makes it the likely candidate. Give its number and lemma, read the full entry with `get_strongs_entry`, and say plainly that this connector cannot confirm the word used in a specific verse.
