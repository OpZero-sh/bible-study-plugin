# Bible Study

Read a passage in the Berean Standard Bible or King James Version, explore a Greek or Hebrew word, and keep your own notes beside the text.

[Connect with Claude, ChatGPT, Muse Code, or Grok](PROVIDERS.md)

Start with a question about a verse. Compare the translations line by line, or look up a Strong’s number to see the original spelling, transliteration and dictionary entry. When you find something you want to keep, save a highlight, a note in your own words, or a link between two passages.

## Try it

- “Compare Psalm 23:4 in the BSB and KJV. Which words account for the difference?”
- “Look up G26 and show me the Greek spelling and the dictionary’s glosses.”
- “Save a note on Psalm 23:4 with these words: ‘The valley is part of the walk.’”
- “Export my Bible journal.”

## Get started

In Claude Code, run these commands in a session and reload plugins if prompted.

```text
/plugin marketplace add OpZero-sh/plugins
/plugin install bible-study@opzero
```

In Claude chat or Cowork, open the installed plugin’s Connectors tab. Connect Scripture Lookup and Greek and Hebrew Word Study for public research. Sign in to Bible Journal to use the reader with personal annotations.

## What is included

### Skills

| Skill | What it does |
| --- | --- |
| `study-a-passage` | Reads a passage in the BSB or KJV, finds a verse from remembered words, and compares the two translations verse by verse. Quotes the text exactly with reference and translation. |
| `word-study` | Looks up a Greek or Hebrew word in Strong’s dictionary by number, by spelling or transliteration, or by English meaning. Keeps the dictionary gloss apart from any reading of a passage. |
| `keep-a-journal` | Opens the reader and saves, finds, edits or shares your highlights, notes and links between passages. Saves only what you ask for, in your words. |
| `export-or-delete-journal` | Exports the whole journal as JSON, deletes one entry, or deletes everything after you confirm. |

Each skill folder has a reference file with the data sources, limits and error messages the skill relies on.

### Agent

`passage-researcher` is a read only researcher for questions that need several lookups. It can use the Scripture and dictionary tools only. It cannot read or change your journal. It returns exact quotations with citations, translation differences, dictionary entries and a list of what it could not confirm.

### Hooks

None. This plugin has no hooks and runs no code on your machine. The `keep-a-journal` skill tells Claude to confirm which item you want shared, to say that the link is public and to ask before it creates a share link, then to give you the exact link and leave the note text out of the reply unless you ask. The `export-or-delete-journal` skill tells Claude to ask for your explicit confirmation before it deletes the whole journal, because the deletion is permanent.

## What the plugin connects to and runs

The plugin talks to three remote MCP servers run by OpZero. It contacts no other host during normal use.

| Connector | Host | Sign in | What it receives |
| --- | --- | --- | --- |
| Scripture Lookup | `scripture-mcp.mcp.opzero.sh` | None | Verse references and search words |
| Greek and Hebrew Word Study | `greek-hebrew-word-study.mcp.opzero.sh` | None | Strong’s numbers and search words |
| Bible Journal | `bible-journal.mcp.opzero.sh` | OpZero account | The passages you open and the highlights, notes, links and share links you choose to save |

The two public services state that they do not store requests. Bible Journal stores what you save under your account until you delete it, and remembers the last chapter you opened for up to 90 days so the reader can reopen it. Nothing in the journal is public unless you create a share link for one item, and you can revoke that link later. Each service publishes its own privacy policy on its host.

The repository also holds settings files for other assistants. Claude does not run them, and nothing in the plugin calls them. The two helper scripts that use them are not in this repository. They live in the catalog repository, https://github.com/OpZero-sh/plugins, and do something only if you clone it and run them yourself.

- `tools/build_openai.py` in the catalog builds ZIP packages for ChatGPT and Codex from a checkout of this repository. It reads local files and writes ZIP files to the folder you name. It uses no network.
- `tools/grok_example.py` in the catalog is an optional example for the xAI API. It reads the server list in `integrations/grok-servers.json`. It reads `XAI_API_KEY` from your environment, and for the journal connection an access token from `BIBLE_JOURNAL_ACCESS_TOKEN`, and sends one request to `api.x.ai` only when you run it yourself without the dry run flag. With the dry run flag it prints the request and sends nothing.
- The JSON files under `integrations/` are settings for those assistants. They list the same three hosts.

## Sources and limits

- Bible text: Berean Standard Bible, dedicated to the public domain (CC0 1.0), and the King James Version, public domain in most of the world and under Crown patent in the United Kingdom. No other translation is available, and only the 66 book canon is covered.
- Dictionary: Strong’s Exhaustive Concordance, 1890, in the Open Scriptures digital edition (CC BY-SA). It is a historical dictionary, not a modern lexicon, and it does not tag which word stands behind each verse.
- The plugin is a study aid. It is not a counseling or crisis service.

## In use

Examples from the connected services in Claude.

![John 1 in the Bible Journal reader](media/journal-reader.webp)

- [Romans 12 in two translations](media/parallel-translations.webp)
- [The Greek entry for agapē](media/greek-agape.webp)
