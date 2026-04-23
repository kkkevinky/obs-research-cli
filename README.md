# Obs-Research-CLI

**English** · [中文](README.zh.md)

A terminal CLI for managing Obsidian research notes — literature (DOI auto-fetch), ideas, concepts, and MOCs.

## Install

```bash
git clone https://github.com/kkkevinky/obs-research-cli.git
cd obs-research-cli
bash install.sh
```

Reopen your terminal, or `source ~/.zshrc`.

## Quick start

```bash
cd ~/your-obsidian-vault
obs init                 # one-time setup
obs quick "your idea"    # zero-interaction capture
obs bib <DOI>            # auto-create from a DOI
obs lit                  # interactive literature note
obs status               # research dashboard
```

## Commands

### Note creation

| Command | What it does |
|---------|--------------|
| `obs quick "idea"` | Zero-interaction capture; appends to today's Inbox |
| `obs lit` | Interactive literature note |
| `obs bib <DOI>` | Fetch metadata from Crossref and generate a literature note |
| `obs idea` | New research idea |
| `obs concept` | New concept card |

### Search & browse

| Command | What it does |
|---------|--------------|
| `obs find` | Search notes by tag or keyword |
| `obs list` | 10 most recently modified notes |
| `obs status` | Dashboard: counts, todos, orphan notes |

### Knowledge organization

| Command | What it does |
|---------|--------------|
| `obs moc <tag>` | Generate a Map of Content (MOC) index for a tag |
| `obs links` | Find concepts mentioned but not yet `[[wikilinked]]` |
| `obs export <tag>` | Export literature as a Markdown table |

### Setup & help

| Command | What it does |
|---------|--------------|
| `obs init` | First-time vault setup; re-run to update projects/tags |
| `obs me` | Create a researcher profile note (`About me.md`) — central graph node |
| `obs tag` | Manage the CLI tag list: add / remove / sync from vault |
| `obs help` | Show this help |

#### `obs tag` sync flow

- Scans all vault notes for tags: YAML frontmatter (`tags:` / `tag:`, all three forms) and inline `#tag`
- **Ignores**: fenced code blocks, inline code, Markdown anchor links (`](#anchor)`)
- **Case-insensitive dedup**: `#Theta` and `#theta` count as one; first-seen casing is kept
- Shows discovered tags, lets you prune typos by number, then asks for final confirmation
- Append-only — never removes tags already in `.obs-config`

## Typical workflow

```
read paper   → obs bib <DOI>    → auto-generate note → annotate in Obsidian
have idea    → obs quick "..."  → append to Inbox
write review → obs moc <tag>    → generate tag index
find gaps    → obs links        → detect unlinked concepts
make table   → obs export <tag> → literature comparison table
```

## Customization

### Templates

Template files live in `templates/`. Edit them directly in Obsidian.

### Config

`.obs-config` in your vault root:

```
VAULT_NAME=YourVault
FOLDERS=Literature,Project-1,Project-2,Concepts
TAGS=tag1,tag2,tag3
```

## Requirements

- macOS or Linux (macOS uses `open`; Linux uses `xdg-open`)
- Bash 3.2+ (default on macOS)
- Python 3 — used by `obs bib` / `obs init` / `obs tag` (default on macOS)
- curl — used by `obs bib` for Crossref (default on macOS)
- [Obsidian](https://obsidian.md)

## Writing tip

Wrap important concepts in double brackets: `[[concept name]]`. Obsidian tracks references automatically, and your knowledge graph grows organically as you write.

If you create a concept ad-hoc in Obsidian (instead of via `obs concept`), drag the resulting note into `Concepts/` to keep the vault organized.

## License

MIT
