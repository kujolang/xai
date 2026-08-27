# Kujo xAI Provider

[![Version](https://img.shields.io/badge/version-0.1.2-black)](https://github.com/kujolang/xai/releases/tag/v0.1.2)
[![License](https://img.shields.io/badge/license-MIT-lightgrey)](LICENSE)
[![built with Kujo](https://img.shields.io/badge/built%20with-Kujo-white.svg)](https://github.com/kujolang/kujo)

xAI Grok support for Kujo through the compatible HTTP API, with xAI-specific controls preserved natively.

## Install

```bash
kujo run /path/to/kennel/kennel.kujo \
  --interpreter \
  -- add github:kujolang/xai@v0.1.2 \
  --alias xai
kujo run /path/to/kennel/kennel.kujo --interpreter -- install
export XAI_API_KEY=your-key
```

## 30-second quick start

```kujo
from xai import create_client, client_chat

client := create_client({})
request := {
    "model": "grok-4.6",
    "messages": [
        {
            "role": "user",
            "content": "Hello from Kujo!"
        }
    ]
}

result := client_chat(client, request)

print(result["data"]["choices"][0]["message"]["content"])
```

## Native API

The native layer preserves xAI response fields, reasoning controls, tools, multimodal inputs, and usage. xAI also maintains a separate SDK/protocol surface; this package's HTTP path is intentionally explicit.

## AI SDK integration

`xai_provider({"model": "grok-4.6"})` supplies normalized chat and streaming semantics through the compatible driver.

## Authentication and security

Set `XAI_API_KEY`. Remote endpoints require HTTPS; embedded credentials, header injection, and secret leakage are rejected.

## Testing and documentation

```bash
bash scripts/release_quality_gate.sh
bash scripts/verify_installed_package.sh
```

The default gate is deterministic and offline. See [docs/](docs/) for implementation and Contract v1 evidence.
