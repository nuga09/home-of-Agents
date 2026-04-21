# code-review-graph

MCP-powered codebase knowledge graph for token-efficient code review.
Installed at: ~/.local/bin/code-review-graph | MCP server: uvx code-review-graph serve
Source: github.com/tirth8205/code-review-graph

## When to Use

- Reviewing PRs or diffs → use `review-delta` or `review-pr` workflow
- Exploring unfamiliar code → use semantic search and blast-radius tools
- Large repos where reading full files wastes context → use graph for targeted context

## Workflow: review-delta (changed code only)

Use for reviewing a specific set of changed files. 5-10x fewer tokens than full-file review.

1. Update graph: `build_or_update_graph_tool` (incremental)
2. Get context: `get_review_context_tool` for changed files
3. Analyze impact: `get_impact_radius_tool` to find affected functions/classes
4. Review only changed nodes + 2-hop neighbors
5. Output: one-line summary, risk level (Low/Medium/High), issues, affected files, recommendations

## Workflow: review-pr (full PR)

Use for reviewing a branch diff against a base branch.

1. Identify changes: git diff against base branch
2. Update graph: `build_or_update_graph_tool`
3. Gather context: `get_review_context_tool` for all changed files
4. Analyze impact: `get_impact_radius_tool` — flag high-risk, widely-depended areas
5. Deep-dive: query graph for callers and test coverage on significant files
6. Output: summary, risk level, blast radius metrics, file-by-file analysis, test coverage gaps, recommendations

## Workflow: build-graph

Run when: initial setup, after major refactoring, switching branches, or graph appears stale.
Auto-updates via git pre-commit hook — manual build rarely needed.

```bash
# First time or full rebuild
code-review-graph build

# Check graph status
# → use list_graph_stats_tool via MCP
```

Graph stored at: `.code-review-graph/graph.db`
Ignores: patterns in `~/.code-review-graphignore`

## Key MCP Tools

| Tool | Use |
|---|---|
| `build_or_update_graph_tool` | Build or incrementally update the graph |
| `list_graph_stats_tool` | Check graph status (file count, node/edge counts, languages) |
| `get_review_context_tool` | Get review context for a set of changed files |
| `get_impact_radius_tool` | Find functions/classes affected by changes |
| `semantic_search_tool` | Search codebase by concept, not just text |
| `get_callers_tool` | Find all callers of a function |
| `get_execution_flow_tool` | Trace execution paths |
| `get_community_tool` | Find related code clusters |
| `get_refactoring_suggestions_tool` | Suggest refactors based on graph structure |

## Output Template

```
## Review Summary
**Risk:** Low / Medium / High
**Blast radius:** N files, M functions affected

### Issues
- [blocker] Description — file:line
- [warning] Description — file:line

### Test coverage gaps
- Function X has no test coverage

### Recommendations
1. Actionable step
```
