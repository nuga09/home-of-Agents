#!/usr/bin/env python3
"""
Thin proxy that strips Anthropic 'thinking' params before forwarding to LiteLLM.
Runs on port 4000; LiteLLM runs on port 4001.
"""
import json
import httpx
from fastapi import FastAPI, Request
from fastapi.responses import StreamingResponse, Response

app = FastAPI()
LITELLM_URL = "http://localhost:4001"

THINKING_HEADERS = {"anthropic-beta"}
THINKING_BETA_VALUES = {
    "interleaved-thinking-2025-05-14",
    "thinking",
    "extended-thinking",
}


def strip_thinking_from_body(body: bytes) -> bytes:
    try:
        data = json.loads(body)
        data.pop("thinking", None)
        return json.dumps(data).encode()
    except Exception:
        return body


def strip_thinking_from_headers(headers: dict) -> dict:
    cleaned = {}
    for k, v in headers.items():
        if k.lower() == "anthropic-beta":
            parts = [p.strip() for p in v.split(",") if p.strip() not in THINKING_BETA_VALUES]
            if parts:
                cleaned[k] = ", ".join(parts)
        elif k.lower() != "host":
            cleaned[k] = v
    return cleaned


@app.api_route("/{path:path}", methods=["GET", "POST", "PUT", "DELETE", "PATCH", "OPTIONS"])
async def proxy(request: Request, path: str):
    body = await request.body()
    if body:
        body = strip_thinking_from_body(body)

    headers = strip_thinking_from_headers(dict(request.headers))
    if body:
        headers["content-length"] = str(len(body))
    url = f"{LITELLM_URL}/{path}"
    params = dict(request.query_params)

    async with httpx.AsyncClient(timeout=620) as client:
        resp = await client.request(
            method=request.method,
            url=url,
            headers=headers,
            content=body,
            params=params,
        )

    return Response(
        content=resp.content,
        status_code=resp.status_code,
        headers=dict(resp.headers),
    )
