#!/usr/bin/env python3
"""Pemeriksaan struktur statis untuk paket PHOTO FIXER."""

from __future__ import annotations

import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SKILL_ROOT = ROOT / ".agents" / "skills"


def fail(message: str) -> None:
    print(f"FAIL: {message}")
    raise SystemExit(1)


def read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except OSError as exc:
        fail(f"Tidak dapat membaca {path.relative_to(ROOT)}: {exc}")


def parse_frontmatter(path: Path) -> tuple[str, str]:
    text = read_text(path)
    match = re.match(r"\A---\s*\n(.*?)\n---\s*\n", text, flags=re.S)
    if not match:
        fail(f"Frontmatter YAML tidak ditemukan: {path.relative_to(ROOT)}")
    block = match.group(1)
    name_match = re.search(r"(?m)^name:\s*([a-z0-9-]+)\s*$", block)
    desc_match = re.search(r"(?m)^description:\s*(.+)$", block)
    if not name_match or not desc_match:
        fail(f"Field name/description hilang: {path.relative_to(ROOT)}")
    description = desc_match.group(1).strip().strip('"').strip("'")
    if len(description) > 1024:
        fail(f"Description lebih dari 1024 karakter: {path.relative_to(ROOT)}")
    return name_match.group(1), description


def main() -> None:
    manifest_path = ROOT / "manifest.json"
    if not manifest_path.exists():
        fail("manifest.json tidak ditemukan")
    manifest = json.loads(read_text(manifest_path))

    if manifest.get("name") != "PHOTO FIXER":
        fail("Nama paket pada manifest harus PHOTO FIXER")
    if manifest.get("version") != read_text(ROOT / "VERSION").strip():
        fail("Versi manifest dan VERSION tidak sama")

    entry_path = ROOT / manifest["entry_skill"]
    if not entry_path.is_file():
        fail("Skill utama tidak ditemukan pada entry_skill")

    skill_files = sorted(SKILL_ROOT.glob("*/SKILL.md"))
    expected_names = ["photo-fixer"] + manifest.get("subskills", [])
    actual_names = []
    for path in skill_files:
        name, description = parse_frontmatter(path)
        folder_name = path.parent.name
        if name != folder_name:
            fail(f"Nama skill '{name}' tidak sama dengan nama folder '{folder_name}'")
        if not description:
            fail(f"Description kosong: {path.relative_to(ROOT)}")
        actual_names.append(name)

    if len(actual_names) != len(set(actual_names)):
        fail("Ada nama skill yang duplikat")
    if set(actual_names) != set(expected_names):
        missing = sorted(set(expected_names) - set(actual_names))
        extra = sorted(set(actual_names) - set(expected_names))
        fail(f"Daftar skill tidak sesuai. Hilang={missing}; tambahan={extra}")

    for reference in manifest.get("references", []):
        if not (ROOT / reference).is_file():
            fail(f"Referensi tidak ditemukan: {reference}")

    command_file = ROOT / ".agents/skills/photo-fixer/references/command-library.md"
    commands = re.findall(r"(?m)^### /([a-z0-9-]+)\s*$", read_text(command_file))
    if len(commands) != 100:
        fail(f"Jumlah perintah harus 100, ditemukan {len(commands)}")
    if len(commands) != len(set(commands)):
        fail("Ada nama perintah yang duplikat")

    for required in ("install.ps1", "install.sh", "tests/test-cases.md", "README.md"):
        if not (ROOT / required).is_file():
            fail(f"Berkas wajib tidak ditemukan: {required}")

    main_skill = read_text(entry_path)
    for subskill in manifest.get("subskills", []):
        if subskill not in main_skill:
            fail(f"Skill utama belum merutekan subskill: {subskill}")

    if not (ROOT / "LICENSE").is_file():
        fail("LICENSE tidak ditemukan")

    print("PASS: struktur paket valid")
    print(f"PASS: {len(actual_names)} skill terdaftar (1 utama + {len(actual_names)-1} subskill)")
    print(f"PASS: {len(commands)} perintah unik ditemukan")
    print("CATATAN: pemeriksaan ini hanya memvalidasi struktur, bukan kualitas edit visual atau dukungan runtime platform.")


if __name__ == "__main__":
    main()
