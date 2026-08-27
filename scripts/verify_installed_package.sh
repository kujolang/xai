#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; KUJO_BIN="${KUJO_BIN:-$(command -v kujo)}"; KERNEL="${KENNEL_SCRIPT:-$ROOT/../kennel/kennel.kujo}"; REF="${XAI_REF:-v0.1.0}"; CLEAN="$(mktemp -d "${TMPDIR:-/tmp}/kujo-xai-installed.XXXXXX")"; trap 'rm -rf "$CLEAN"' EXIT; cd "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- init --name xai-installed --project-dir "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- add github:kujolang/xai@"$REF" --alias xai --project-dir "$CLEAN"
"$KUJO_BIN" run "$KERNEL" --interpreter -- install --project-dir "$CLEAN"; "$KUJO_BIN" run "$KERNEL" --interpreter -- install --project-dir "$CLEAN"; "$KUJO_BIN" run "$KERNEL" --interpreter -- validate --project-dir "$CLEAN"
(cd "$CLEAN" && env -u KUJO_MODULE_PATH "$KUJO_BIN" test-run "$CLEAN/kennel_packages/xai/tests/installed_consumer_smoke.kujo")
echo "Installed-package Kennel smoke: PASS"
