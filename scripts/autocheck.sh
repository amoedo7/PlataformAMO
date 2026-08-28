#!/usr/bin/env bash
set -euo pipefail

python3 - <<'PY'
import json
from pathlib import Path

contract = json.loads(Path('.amo').read_text())
assert contract['schema'] == 'desarrollamo.amo.v1'
assert contract['id'] == 'plataformamo'
assert contract['health']['checks'][0]['command'] == 'bash scripts/autocheck.sh'

store = json.loads(Path('storeamo.json').read_text())
assert store.get('audience') == 'team'
PY

mkdir -p "$HOME/.android"
base64 -d ci/plataformamo-dev.keystore.b64 > "$HOME/.android/debug.keystore"
keytool -list -keystore "$HOME/.android/debug.keystore" -storepass android -alias androiddebugkey >/dev/null

gradle assembleRelease --stacktrace

test -n "$(find app/build/outputs/apk/release -name '*.apk' -type f -size +0c -print -quit)"

echo "PlataformAMO AutoCheck PASS"
