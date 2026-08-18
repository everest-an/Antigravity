# -*- coding: utf-8 -*-
"""
test_all.py —— 全量回归测试（计算 / 图 / 论文 / 幻灯片）
========================================================
用法：py test_all.py

覆盖：
  1. experiments/  18 份数量级核算（含 E2 包：14-16；R3/E5：17 态相关 EFT 界、18 态控制零背景）
  2. simulations/  7 份模拟（含 QuTiP、quimb）
  3. figures/      7 幅中文图 + 7 幅英文图
  4. paper/        8 份论文中英双版（16 个 Typst → PDF）
  5. ppt/          汇报幻灯片（15 页）

退出码：0 = 全部通过；1 = 存在失败。
"""
import subprocess
import sys
import time
from pathlib import Path

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

ROOT = Path(__file__).parent
PY = sys.executable
import shutil as _shutil
TYPST = _shutil.which("typst") or str(
    Path.home() / "AppData/Local/Microsoft/WinGet/Links/typst.exe")

TIMEOUT = 900  # 秒（单脚本上限）

SUITES = [
    ("experiments（核算）", sorted((ROOT / "experiments").glob("*.py"))),
    ("simulations（模拟）", sorted((ROOT / "simulations").glob("*.py"))),
    ("figures-cn（中文图）", [
        ROOT / "figures" / f"0{i}_{n}.py" for i, n in [
            (1, "decision_matrix"), (2, "reality_stack"), (3, "rt_mincut"),
            (4, "fifth_force"), (5, "gie_discrimination"), (6, "reachability"),
            (7, "state_dependence"), (8, "quantum_state_resource")]]),
    ("figures-en（英文图）", [ROOT / "figures" / "generate_en.py"]),
    ("papers（论文 PDF）", [ROOT / "build" / "build_pdf.py"]),
    ("slides（幻灯片）", [ROOT / "ppt" / "build_ppt.py"]),
]


def run_one(script):
    t0 = time.time()
    try:
        r = subprocess.run(
            [PY, str(script)], cwd=str(ROOT),
            capture_output=True, text=True, encoding="utf-8", errors="replace",
            timeout=TIMEOUT,
        )
        ok = r.returncode == 0
        note = ""
        if not ok:
            tail = (r.stderr or r.stdout or "").strip().splitlines()
            note = tail[-1][:90] if tail else "no output"
        return ok, time.time() - t0, note
    except subprocess.TimeoutExpired:
        return False, TIMEOUT, "timeout"


def main():
    print("=" * 70)
    print("全量回归测试：计算 / 图 / 论文 / 幻灯片")
    print("=" * 70)

    total, failed = 0, []
    for suite, scripts in SUITES:
        print(f"\n[{suite}] {len(scripts)} 项")
        for s in scripts:
            total += 1
            ok, dt, note = run_one(s)
            mark = "OK  " if ok else "FAIL"
            line = f"  {mark} {s.name:<44s} {dt:6.1f}s"
            if note:
                line += f"  | {note}"
            print(line)
            if not ok:
                failed.append((suite, s.name, note))

    print("\n" + "=" * 70)
    print(f"汇总：{total} 项，通过 {total - len(failed)}，失败 {len(failed)}")
    for suite, name, note in failed:
        print(f"  FAIL {suite} :: {name} :: {note}")
    print("=" * 70)
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())
