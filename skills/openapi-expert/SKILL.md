---
name: openapi-expert
description: "OpenAPI specification specialist for generating, validating, and maintaining REST API specs. Invoke when you need to: generate OpenAPI 3.1 specs from existing routes, validate an openapi.yaml/openapi.json file for correctness, scaffold API client code from a spec, or audit API documentation completeness. Trigger phrases: generate openapi spec, validate api spec, write openapi, document my api, openapi yaml, swagger spec, api contract."
license: MIT
allowed-tools: Read, Grep, Glob, Bash, Write, Edit
metadata:
  version: "1.0.0"
  domain: api
  triggers: openapi, swagger, api spec, api contract, generate spec, validate spec, rest api docs
  role: specialist
  scope: generate,review
  output-format: yaml
  related-skills: api-designer, spec-miner, graphql-architect
---

# OpenAPI Expert

OpenAPI 3.1 specification specialist — generates, validates, and maintains REST API contracts.

## When to Use This Skill

- Generating an OpenAPI spec from existing route handlers (Flask, FastAPI, Express, Django, etc.)
- Validating an `openapi.yaml` or `openapi.json` for structural correctness and completeness
- Reviewing API docs for missing examples, undocumented error codes, or broken `$ref` chains
- Scaffolding client SDKs from a spec using code-gen tools

---

## Workflow A — Generate Spec from Code

1. **Scan** the project for API route definitions:
   ```bash
   # FastAPI / Flask
   grep -r "@app.route\|@router\.\|@app.get\|@app.post\|@app.put\|@app.delete\|@app.patch" --include="*.py" -l
   # Express / Fastify
   grep -r "router\.get\|router\.post\|app\.get\|app\.post\|fastify\.route" --include="*.js" --include="*.ts" -l
   ```

2. **Extract** per endpoint:
   - HTTP method and path
   - Path and query parameters (types, required/optional)
   - Request body schema (from Pydantic models, Zod schemas, TypeScript types, etc.)
   - Response schemas for each status code
   - Auth requirement (Bearer, API key, OAuth)

3. **Generate** the OpenAPI 3.1 YAML:
   ```yaml
   openapi: "3.1.0"
   info:
     title: <API Name>
     version: <semver>
     description: <one-line summary>
   servers:
     - url: https://api.example.com/v1
   paths:
     /resource:
       get:
         summary: List resources
         parameters: [...]
         responses:
           "200":
             description: Success
             content:
               application/json:
                 schema:
                   $ref: "#/components/schemas/ResourceList"
   components:
     schemas: {}
     securitySchemes: {}
   ```

4. **Rules**:
   - Use OpenAPI 3.1 unless the project requires 3.0 compatibility
   - Every endpoint must have at least one response defined
   - Use `$ref` for reusable schemas — never inline duplicated schemas
   - Add at least one request/response example per endpoint
   - Save as `openapi.yaml` (YAML preferred over JSON for readability)

---

## Workflow B — Validate Existing Spec

1. **Load** the spec file and check YAML/JSON syntax
2. **Validate structure**:
   - Required top-level fields: `openapi`, `info`, `paths`
   - Every `$ref` resolves to a real schema in `components`
   - Every path parameter in the URL has a corresponding `parameters` entry
3. **Check completeness**:
   - Every endpoint has a `summary` and at least one `response`
   - Error responses (400, 401, 403, 404, 422, 500) are documented where applicable
   - Request bodies have `content` with at least one media type
4. **Common issues to flag**:
   - Missing `required` arrays on request body schemas
   - `additionalProperties: true` where it should be restricted
   - Inconsistent naming (camelCase in one place, snake_case in another)
   - Deprecated paths without `deprecated: true` marker
5. **Output format**:
   ```
   Spec: openapi.yaml
   Version: 3.1.0
   Endpoints: 12
   Schemas: 8

   ✅ Structural validity: PASS
   ❌ Missing response for POST /orders (404 not documented)
   ⚠️  No example on GET /products response schema
   ⚠️  Path param {userId} missing in /users/{userId}/orders parameters list
   ```

---

## Validation Tools (run if available)

```bash
# Python — openapi-spec-validator
pip install openapi-spec-validator --user
python -m openapi_spec_validator openapi.yaml

# Node — @redocly/cli (recommended)
npx @redocly/cli lint openapi.yaml

# Node — swagger-cli
npx swagger-cli validate openapi.yaml
```

---

## Output Standards

- YAML over JSON for human-edited specs
- `$ref` chains are flat (max 2 levels deep)
- Schema names are PascalCase: `OrderItem`, `UserProfile`
- Path parameters use camelCase in the URL: `/users/{userId}`
- All timestamps use ISO 8601: `format: date-time`
