# -*- coding: utf-8 -*-
"""
run_all.py —— 统一运行入口
============================
依次运行 experiments/ 与 simulations/ 下全部脚本，打印一行摘要。
用法：py run_all.py
"""
import subprocess
import sys
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

ROOT = Path(__file__).parent
GROUPS = ["experiments", "simulations"]


def first_lines(text, n=2):
    lines = [l for l in text.splitlines() if l.strip() and not l.startswith("==")]
    return " | ".join(l.strip()[:70] for l in lines[:n])


def main():
    total, failed = 0, []
    for g in GROUPS:
        scripts = sorted((ROOT / g).glob("*.py"))
        print(f"\n[{g}] {len(scripts)} 个脚本")
        for s in scripts:
            total += 1
            try:
                r = subprocess.run([sys.executable, str(s)], capture_output=True,
                                   text=True, timeout=300, encoding="utf-8", errors="replace")
                ok = r.returncode == 0
                print(f"  {'OK ' if ok else 'FAIL'} {s.name:42s} {first_lines(r.stdout)}")
                if not ok:
                    failed.append((s.name, r.stderr[-200:]))
            except subprocess.TimeoutExpired:
                print(f"  TIMEOUT {s.name}")
                failed.append((s.name, "timeout"))
    print(f"\n共 {total} 个脚本，失败 {len(failed)}")
    for name, err in failed:
        print(f"  FAILED: {name}\n    {err}")


if __name__ == "__main__":
    main()
