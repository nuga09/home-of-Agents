# Obsidian Flavored Markdown

Use when creating or editing notes in an Obsidian vault (.md files with vault-specific syntax).
Source: github.com/kepano/obsidian-skills

## Internal Links

- Wikilinks: `[[Note Name]]`
- Custom display text: `[[Note Name|Display Text]]`
- Link to heading: `[[Note Name#Heading]]`
- Obsidian auto-updates links on rename — prefer wikilinks over relative paths.

## Embeds

Prefix any wikilink with `!` to embed inline:

- Full note: `![[Note Name]]`
- Image with width: `![[image.png|300]]`
- PDF page: `![[document.pdf#page=3]]`
- Specific heading: `![[Note Name#Heading]]`

## Callouts

```markdown
> [!note] Optional Title
> Content here.

> [!warning]+ Collapsible (expanded by default)
> Content.

> [!tip]- Collapsible (collapsed by default)
> Content.
```

Common types: `note`, `tip`, `warning`, `danger`, `info`, `success`, `question`, `abstract`, `bug`, `example`, `quote`.

## Properties (Frontmatter)

```yaml
---
title: My Note
date: 2026-04-18
tags:
  - topic/tag
aliases:
  - Alternative Name
cssclasses:
  - wide-page
---
```

- `tags`: searchable labels (also supports inline `#tag` and `#nested/tag`)
- `aliases`: alternative names for link suggestions
- `cssclasses`: CSS classes applied to the note's body

## Additional Syntax

- Comments (hidden from preview): `%%hidden text%%`
- Highlight: `==highlighted text==`
- LaTeX math: `$inline$` or `$$block$$`
- Mermaid diagrams: fenced code block with `mermaid` language tag
- Footnotes: `[^1]` inline, `[^1]: text` at bottom
