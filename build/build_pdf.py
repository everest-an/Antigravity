# -*- coding: utf-8 -*-
"""
build/build_pdf.py —— 正式论文 PDF 构建（Typst 排版）
用法：py build/build_pdf.py
输出：build/三种统一-中文版.pdf、build/Three-Unifications-英文版.pdf
依赖：Typst（winget install Typst.Typst）
"""
import subprocess
import sys
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

ROOT = Path(__file__).parent.parent
PAPER = ROOT / "paper"
BUILD = ROOT / "build"
BUILD.mkdir(exist_ok=True)

JOBS = [
    ("三种统一-中文版.typ", "三种统一-中文版.pdf"),
    ("Three-Unifications-英文版.typ", "Three-Unifications-英文版.pdf"),
]

for src, dst in JOBS:
    r = subprocess.run(
        ["typst", "compile", str(PAPER / src), str(BUILD / dst), "--root", str(ROOT)],
        capture_output=True, text=True, encoding="utf-8", errors="replace",
    )
    size = (BUILD / dst).stat().st_size if (BUILD / dst).exists() else 0
    status = "OK" if r.returncode == 0 else "FAIL"
    print(f"[{status}] {dst}: {size/1024:.0f} KB")
    if r.returncode != 0:
        print(r.stderr[:800])
