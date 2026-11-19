#!/usr/bin/env bash
set -euo pipefail

TARGET="\${1:-agents}"
SCOPE="\${2:-user}"
PROJECT_PATH="\${3:-$PWD}"
SCRIPT_DIR="$(cd "$(dirname "\${BASH_SOURCE[0]}")" && pwd)"
SOURCE_ROOT="$SCRIPT_DIR/.agents/skills"

if [[ ! -d "$SOURCE_ROOT" ]]; then
  echo "Folder sumber skill tidak ditemukan: $SOURCE_ROOT" >&2
  exit 1
fi

case "$SCOPE" in
  user) BASE="$HOME" ;;
  project)
    if [[ ! -d "$PROJECT_PATH" ]]; then
      echo "Folder proyek tidak ditemukan: $PROJECT_PATH" >&2
      exit 1
    fi
    BASE="$(cd "$PROJECT_PATH" && pwd)"
    ;;
  *)
    echo "Scope harus user atau project." >&2
    exit 1
    ;;
esac

install_one() {
  local destination_root="$1"
  mkdir -p "$destination_root"
  echo
  echo "Tujuan: $destination_root"

  for source_skill in "$SOURCE_ROOT"/*; do
    [[ -d "$source_skill" ]] || continue
    local skill_name
    skill_name="$(basename "$source_skill")"
    local destination_skill="$destination_root/$skill_name"

    if [[ -e "$destination_skill" ]]; then
      echo "Dilewati karena sudah ada: $destination_skill"
      continue
    fi

    cp -R "$source_skill" "$destination_skill"
    echo "Terpasang: $skill_name"
  done
}

case "$TARGET" in
  agents|codex) install_one "$BASE/.agents/skills" ;;
  claude) install_one "$BASE/.claude/skills" ;;
  copilot)
    if [[ "$SCOPE" == "user" ]]; then
      install_one "$BASE/.copilot/skills"
    else
      install_one "$BASE/.github/skills"
    fi
    ;;
  gemini) install_one "$BASE/.gemini/skills" ;;
  cursor) install_one "$BASE/.cursor/skills" ;;
  all)
    install_one "$BASE/.agents/skills"
    install_one "$BASE/.claude/skills"
    if [[ "$SCOPE" == "user" ]]; then
      install_one "$BASE/.copilot/skills"
    else
      install_one "$BASE/.github/skills"
    fi
    install_one "$BASE/.gemini/skills"
    install_one "$BASE/.cursor/skills"
    ;;
  *)
    echo "Target tidak dikenal: $TARGET" >&2
    echo "Pilih: agents, codex, claude, copilot, gemini, cursor, all" >&2
    exit 1
    ;;
esac

echo
echo "Selesai. Buka ulang aplikasi AI bila skill belum terdeteksi."
