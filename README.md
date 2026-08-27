# Kujo xAI Provider

Native xAI OpenAI-compatible chat client with xAI reasoning, tools, vision, and an AI SDK adapter.

```bash
kujo package-add github:kujolang/xai@v0.1.0
export XAI_API_KEY=your-key
```

```kujo
from xai import create_client, client_chat
c := create_client({})
r := client_chat(c, {"model":"grok-4.6","messages":[{"role":"user","content":"Hello"}],"reasoning_effort":"high"})
```

Native use preserves xAI response fields, reasoning controls, tools, and usage metadata. `xai_provider()` supplies normalized AI SDK chat and streaming semantics. Tests are offline and credential-free.
