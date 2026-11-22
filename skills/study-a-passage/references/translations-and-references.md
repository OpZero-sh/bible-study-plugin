# Translations, reference syntax and search rules

Facts in this file come from the Scripture Lookup server: its `list_translations` output, its tool results and its public guide at https://scripture-mcp.mcp.opzero.sh/?page=docs. Call `list_translations` when a person asks about licenses, since that output is the current statement.

## The two translations

| Code | Text | Status | Notes from the server |
| --- | --- | --- | --- |
| `BSB` | Berean Standard Bible | Dedicated to the public domain (CC0 1.0) by its publisher on April 30, 2023 | Modern English. The default. A few verses that appear only in later manuscripts are not in the BSB main text and come back marked as not included. |
| `KJV` | King James Version, 1611, in standard modern spelling | Public domain in most of the world. In the United Kingdom the text is under Crown patent. | Words the translators added for sense appear in [brackets], where print editions use italics. The divine name prints as Lord, not in small capitals. |

The text is held in the server's own storage and checked against a fixed digest before use. No third party service is called at run time. The server states that queries are not stored.

No other translation is available. If someone asks for the NIV, ESV, NRSV, NABRE or any other edition, say so and offer BSB or KJV. Do not reproduce other modern translations from memory as a substitute: most are under copyright, and an unverified quotation defeats the purpose of exact lookup.

## Canon

The server covers the 66 books of the Protestant canon. A request for a deuterocanonical book, for example Tobit, returns an unknown book error. Say this plainly to readers whose Bibles include those books. It is a limit of the data, not a judgment about the canon.

## Writing a reference

| Form | Example |
| --- | --- |
| One verse | `John 3:16` |
| A range | `John 3:16-18` |
| A whole chapter | `Psalm 23` |
| Several verses in one chapter | `1 Cor 13:4-7, 13` |
| Several places in one book | `Rom 8:28; 12:1-2` |
| A book with one chapter | `Jude 3` |

Common abbreviations work, such as Gen, Ex, Ps, Prov, Isa, Matt, Rom, 1 Cor, Heb and Rev. One lookup returns at most 200 verses. For something longer, such as several chapters, make more than one call.

## What a passage result contains

- A heading with the reference, the translation code and the translation name.
- Each verse on its own line with its verse number.
- A source line with the license statement for that translation.
- A verse absent from the BSB main text appears as a bracketed note in place of the verse text. Acts 8:37 is an example. Report the note as it stands. The KJV has text for such verses.

`compare_translations` returns each verse twice, one line labeled BSB and one labeled KJV, followed by both license statements.

## Search rules

- Every word in `query` must appear in the verse. Word order does not matter unless the phrase is in double quotes.
- A phrase in double quotes must appear exactly.
- `translation` defaults to BSB. A phrase remembered from the KJV may not match BSB wording, and the reverse.
- `book` limits the search to one book, for example John or Psalms. `testament` takes `OT` or `NT`.
- `limit` is 1 to 50 and defaults to 10. The result line states the total matches and the range shown. Use `offset` to page.
- When nothing matches, the result names each word it required. That makes it easy to see which word to drop.

Search is literal. It does not find verses by theme, and it does not recognize paraphrases.

## Errors

| Message begins | Meaning | What to do |
| --- | --- | --- |
| No book named ... | The book name was not recognized | Check spelling or the abbreviation. If the book is outside the 66 book canon, say it is not available. |
| A message naming the valid range | The chapter or verse is past the end | Give the valid range and ask which verse was meant. |

The server never fills in text it does not have. Neither should the answer.

## Quoting

- Quote the returned text exactly, with reference and translation.
- Both texts are public domain, so length is not a licensing problem. Still quote only what the question needs. The tool result already shows the full passage to the reader.
- Do not merge wording from the two translations into one quotation.
