---
name: study-a-passage
description: "Read, quote, search or compare Bible passages in the Berean Standard Bible (BSB) and the King James Version (KJV). Use when someone asks what a verse says, wants a passage or chapter quoted exactly, remembers some of the words but not the reference, or asks how the two translations differ. Typical requests: 'what does Romans 8:28 say', 'show me Psalm 23 in the KJV', 'where is the verse about living water', 'compare John 1:1-5 in the BSB and KJV', 'which translations do you have'."
---

# Study a passage

Fetch exact Bible text from the Scripture Lookup connector, then answer from that text. The connector is public, read only and needs no sign in.

## When to use

- Someone gives a reference and wants the text.
- Someone remembers words and needs the reference.
- Someone asks how the BSB and KJV word a passage.
- Someone asks which translations are available or how they are licensed.

Use `word-study` instead when the question is about a Greek or Hebrew word. Use `keep-a-journal` when the person wants to save a highlight, note or link. Do not call these tools for general questions about the Bible that need no quotation.

## Tools

All four are on the Scripture Lookup server.

| Tool | Use it for | Arguments that matter |
| --- | --- | --- |
| `get_passage` | One reference in one translation | `reference`, `translation` (`BSB` default, or `KJV`) |
| `compare_translations` | BSB and KJV verse by verse | `reference` |
| `search_verses` | Remembered words | `query`, optional `translation`, `book`, `testament` (`OT` or `NT`), `limit` (1 to 50, default 10), `offset` |
| `list_translations` | Available texts, license and source | none |

Reference syntax, search rules, error messages and translation notes are in [references/translations-and-references.md](references/translations-and-references.md). Read it before handling an unusual reference or a question about licenses.

## Workflow

1. Settle the reference and the translation. If the person names no translation, use BSB and say so in the citation. If they ask for a translation other than BSB or KJV, tell them only those two are available and ask which they want. Never present BSB or KJV wording as another translation.
2. Pick one call.
   - A reference in one translation: `get_passage`.
   - A wording or translation question: `compare_translations`. It returns both texts aligned by verse, so there is no need to call `get_passage` twice.
   - Remembered words: `search_verses`. Every word must appear in the verse. Put an exact phrase in double quotes. Narrow with `book` or `testament` when the person gave a hint.
3. After a search, list the matching references with their text. If one match is clearly what the person meant and they asked to read it, fetch the surrounding passage with `get_passage`. If several are plausible, show them and let the person choose.
4. Answer from the returned text. Quote it word for word and give the reference and translation, for example "John 3:16 (BSB)". Keep explanation separate from quotation, and say when a point is your reading and not the text.

## Empty results, errors and ambiguity

- No search matches: the search needs every word. Retry once with fewer or more distinctive words, or in the other translation, since BSB and KJV wording differ. If there is still nothing, say the phrase was not found in these two translations. Some familiar sayings are not in the Bible.
- More matches than shown: the result gives the total and the range shown. Offer to show more with `offset`.
- Unknown book or a verse past the end of a chapter: the server returns an error that names the problem. Relay it and ask for the reference again. Do not guess.
- A verse marked as not in the BSB main text: report it as returned. The KJV text for the same verse is available with `translation: KJV`.
- A vague request such as "the love chapter": state the reference you take it to mean before quoting, so the person can correct you.

## What the answer looks like

- Reference and translation on every quotation.
- Quotations exactly as returned. No paraphrase inside quotation marks, and no verses the tools did not return.
- For a comparison, set the differing words side by side and say what kind of difference each is: older English, word order, or a different word choice. Do not rank the translations.
- For a long passage, quote the verses under discussion and cite the full range. The tool result already shows the whole text.
- Keep the tone plain. Readers come from many traditions or none. Explain what the text says and leave the application to them unless they ask.

## Limits to state when relevant

- Two translations only: BSB and KJV. Both are public domain texts. In the United Kingdom the KJV is under Crown patent.
- The 66 book canon. Deuterocanonical books such as Tobit are not available and return an unknown book error.
- Up to 200 verses per lookup.
- Search matches words in the verse text. It does not search by topic or meaning.

## Examples

**"What does Romans 8:28 say?"**
Call `get_passage` with `reference: "Romans 8:28"`. Quote the verse exactly and cite it as Romans 8:28 (BSB).

**"Where is that verse about living water?"**
Call `search_verses` with `query: "\"living water\""`. The result reports the total number of matches and lists each reference with its text. Show them, note that the default search covered the BSB, and offer to open the one the person had in mind.

**"Compare Psalm 23:4 in the BSB and KJV. Which words account for the difference?"**
Call `compare_translations` with `reference: "Psalm 23:4"`. Quote both lines with their labels, then point to the specific words that differ, such as "Even though" beside "Yea, though" and "You are" beside "thou art", and say these are differences of period English, not of meaning.
