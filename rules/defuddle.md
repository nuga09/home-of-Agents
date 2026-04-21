# Defuddle — Web Content Extraction

Use defuddle to extract clean markdown from web pages before processing.
Prefer over WebFetch for standard web pages — removes ads/nav and reduces token usage.
Do NOT use for URLs ending in `.md` — fetch those directly.
Source: github.com/kepano/obsidian-skills

## Basic Usage

```bash
# Extract as markdown (always use --md flag)
defuddle parse <url> --md

# Extract as JSON (includes both html and markdown)
defuddle parse <url> --json

# Save to file
defuddle parse <url> --md -o output.md

# Extract a specific metadata property
defuddle parse <url> -p title
defuddle parse <url> -p description
defuddle parse <url> -p domain
```

## When to Use

- Standard web pages, articles, blog posts, documentation sites → use defuddle
- Raw `.md` files → use WebFetch or curl directly
- Authenticated/private pages → use appropriate MCP tool
