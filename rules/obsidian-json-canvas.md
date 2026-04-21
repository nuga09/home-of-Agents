# JSON Canvas (Obsidian)

Use when creating or editing `.canvas` files for visual note organization in Obsidian.
Follows JSON Canvas Spec 1.0.
Source: github.com/kepano/obsidian-skills

## Structure

```json
{
  "nodes": [],
  "edges": []
}
```

## Node Types

All nodes require: unique 16-character hex `id`, `type`, `x`, `y`, `width`, `height`.

### Text node
```json
{
  "id": "a1b2c3d4e5f6a7b8",
  "type": "text",
  "text": "Markdown content\nSecond line",
  "x": 0, "y": 0, "width": 250, "height": 100
}
```

### File node (local vault file)
```json
{
  "id": "b2c3d4e5f6a7b8c9",
  "type": "file",
  "file": "path/to/note.md",
  "x": 300, "y": 0, "width": 250, "height": 150
}
```

### Link node (external URL)
```json
{
  "id": "c3d4e5f6a7b8c9d0",
  "type": "link",
  "url": "https://example.com",
  "x": 0, "y": 200, "width": 250, "height": 100
}
```

### Group node (container)
```json
{
  "id": "d4e5f6a7b8c9d0e1",
  "type": "group",
  "label": "Group Label",
  "x": -50, "y": -50, "width": 600, "height": 400
}
```

## Edges

```json
{
  "id": "e5f6a7b8c9d0e1f2",
  "fromNode": "a1b2c3d4e5f6a7b8",
  "fromSide": "right",
  "toNode": "b2c3d4e5f6a7b8c9",
  "toSide": "left",
  "label": "Optional label",
  "color": "1"
}
```

- `fromSide` / `toSide`: `top`, `right`, `bottom`, `left`
- `color`: `"1"` (red) through `"6"` (purple), or hex `"#rrggbb"`

## Layout Guidelines

- Spacing between elements: 50–100px minimum
- Coordinates can be negative (canvas is infinite)
- Groups should extend ~50px beyond their contained nodes

## Validation Checklist

- All node and edge IDs are unique 16-character hex strings
- All edge `fromNode` and `toNode` reference valid node IDs
- All required fields present on each node
- `text` content uses `\n` for newlines (not literal backslash-n)
- Valid JSON (no trailing commas)
