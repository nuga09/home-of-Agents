# Obsidian Bases

Use when creating or editing `.base` files — database-like views over vault notes.
Source: github.com/kepano/obsidian-skills

## Workflow

1. Create a `.base` file in the vault with valid YAML
2. Define `filters` to select which notes appear
3. Add `formulas` for computed properties (optional)
4. Configure `views` (table, cards, list, map)
5. Validate: no YAML syntax errors, all referenced properties and formulas exist
6. Test by opening in Obsidian

## Schema

```yaml
filters:
  and: []   # global filters applied to all views
  or: []
  not: []

formulas:
  formula_name: 'expression'

properties:
  property_name:
    displayName: "Display Name"
  formula.formula_name:
    displayName: "Formula Display Name"

summaries:
  custom_name: 'values.mean().round(3)'

views:
  - type: table | cards | list | map
    name: "View Name"
    limit: 10
    groupBy:
      property: property_name
      direction: ASC | DESC
    filters:
      and: []
    order:
      - file.name
      - property_name
      - formula.formula_name
    summaries:
      property_name: Average
```

## Filter Syntax

```yaml
# Single filter string
filters: 'status == "done"'

# AND
filters:
  and:
    - 'status == "done"'
    - 'priority > 3'

# OR
filters:
  or:
    - file.hasTag("book")
    - file.hasTag("article")

# NOT
filters:
  not:
    - file.hasTag("archived")

# Nested
filters:
  or:
    - file.hasTag("tag")
    - and:
        - file.hasTag("book")
        - file.hasLink("Textbook")
```

Filter operators: `==`, `!=`, `>`, `<`, `>=`, `<=`, `&&`, `||`, `!`

## Property Types

1. **Note properties** — from frontmatter: `status`, `author`, `due`
2. **File properties** — metadata: `file.name`, `file.path`, `file.folder`, `file.ext`, `file.size`, `file.ctime`, `file.mtime`, `file.tags`, `file.links`, `file.backlinks`
3. **Formula properties** — computed: `formula.my_formula`

## Formula Syntax

```yaml
formulas:
  total: "price * quantity"
  status_icon: 'if(done, "✅", "⏳")'
  formatted_price: 'if(price, price.toFixed(2) + " dollars")'
  created: 'file.ctime.format("YYYY-MM-DD")'
  days_old: '(now() - file.ctime).days'
  days_until_due: 'if(due_date, (date(due_date) - today()).days, "")'
```

Key functions: `date()`, `now()`, `today()`, `if()`, `duration()`, `file()`, `link()`

### Duration arithmetic

Subtracting two dates returns a Duration — NOT a number. Access `.days`, `.hours`, etc. before applying numeric functions.

```yaml
# CORRECT
"(now() - file.ctime).days"
"(date(due_date) - today()).days.round(0)"

# WRONG — Duration does not support .round() directly
"(now() - file.ctime).round(0)"
```

## YAML Quoting Rules

- Formulas containing double quotes → wrap in single quotes: `'if(done, "Yes", "No")'`
- Simple strings → double quotes: `"My View Name"`
- Strings with special chars (`:`, `{`, `[`, `#`, etc.) must be quoted

## Common Errors

- **Unquoted special characters** in strings → YAML parse error
- **Duration used as number** → access `.days` first
- **Missing null check** → guard with `if(property, expr, "")` when property may be empty
- **Referencing undefined formula** → every `formula.X` in `order` needs a matching entry in `formulas`

## Default Summary Functions

Numbers: `Average`, `Min`, `Max`, `Sum`, `Range`, `Median`, `Stddev`
Dates: `Earliest`, `Latest`, `Range`
Booleans: `Checked`, `Unchecked`
Any: `Empty`, `Filled`, `Unique`

## Embedding in Notes

```markdown
![[MyBase.base]]
![[MyBase.base#View Name]]
```
