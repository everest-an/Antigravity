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

# typst 可执行文件（winget 安装位置；也支持 PATH 中的 typst）
import shutil as _shutil
TYPST = _shutil.which("typst") or str(
    Path.home() / "AppData/Local/Microsoft/WinGet/Links/typst.exe")

JOBS = [
    ("三种统一-中文版.typ", "三种统一-中文版.pdf"),
    ("Three-Unifications-英文版.typ", "Three-Unifications-英文版.pdf"),
    ("三种统一之后-中文版.typ", "三种统一之后-中文版.pdf"),
    ("Beyond-Three-Unifications-英文版.typ", "Beyond-Three-Unifications-英文版.pdf"),
    ("核钟实验设计方案.typ", "核钟实验设计方案.pdf"),
    ("Nuclear-Clock-Experiment-英文版.typ", "Nuclear-Clock-Experiment-英文版.pdf"),
    ("统一约束重推导-中文版.typ", "统一约束重推导-中文版.pdf"),
    ("引力控制通道分类定理-中文版.typ", "引力控制通道分类定理-中文版.pdf"),
    ("三种相同性-中文版.typ", "三种相同性-中文版.pdf"),
    ("GIE争论逻辑重建-中文版.typ", "GIE争论逻辑重建-中文版.pdf"),
]

for src, dst in JOBS:
    r = subprocess.run(
        [TYPST, "compile", str(PAPER / src), str(BUILD / dst), "--root", str(ROOT)],
        capture_output=True, text=True, encoding="utf-8", errors="replace",
    )
    size = (BUILD / dst).stat().st_size if (BUILD / dst).exists() else 0
    status = "OK" if r.returncode == 0 else "FAIL"
    print(f"[{status}] {dst}: {size/1024:.0f} KB")
    if r.returncode != 0:
        print(r.stderr[:800])
