# Obsidian CLI

Use for command-line interaction with a running Obsidian instance.
Requires Obsidian to be open. Parameters use `key=value` syntax; quote values with spaces.
Source: github.com/kepano/obsidian-skills

## File Targeting

- By name (wikilink-style): `file=<name>`
- By exact path: `path=<exact/path.md>`
- Multiple vaults: `vault=<name>`

## Common Commands

```bash
# Read a note
obsidian read file="Note Name"

# Create a note
obsidian create name="Note Name" content="Body text"

# Append to a note
obsidian append file="Note Name" content="Additional text"

# Search vault
obsidian search query="search term" limit=10

# Set a frontmatter property
obsidian set file="Note Name" property="status" value="done"

# Daily note — read
obsidian daily:read

# Daily note — append
obsidian daily:append content="New entry"
```

## Output Control

- `--copy` — copy output to clipboard instead of stdout
- `silent` — prevent Obsidian from opening/focusing the file

## Multiline Content

Use `\n` for newlines and `\t` for tabs within content strings.

## Developer Commands

```bash
# Reload plugin code
obsidian dev:reload plugin=<plugin-id>

# Capture screenshot
obsidian dev:screenshot

# Check for JS errors
obsidian dev:errors

# Run JavaScript in Obsidian context
obsidian dev:eval code="<js expression>"

# Inspect DOM element
obsidian dev:inspect selector=".css-selector"
```
