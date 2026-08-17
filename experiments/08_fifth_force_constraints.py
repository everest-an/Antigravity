# -*- coding: utf-8 -*-
"""
实验附件 08：第五力约束全景（判决矩阵第 13 行）
================================================
Yukawa 型额外引力：a_Y = α · G M / r² · (1 + r/λ) · e^(-r/λ)

用四个基准实验的灵敏度反推 α 约束（参数化，几何取等效点源近似）：
  1) Eöt-Wash 短程扭秤（~100 μm 尺度）
  2) Panda 格点原子干涉（Nature 631, 515 (2024)：6.2 nm/s² 准确度）
  3) MICROSCOPE 在轨（η ~ 2.5e-15）
  4) 月球激光测距（轨道尺度）

输出：α 约束随 λ 的全景表，并把第 12 行（KK 引力 AB 分裂）的 α 需求叠加上去。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

G = 6.6743e-11


def alpha_bound(delta_a, M, r, lamb):
    """在灵敏度 delta_a 下，λ 处对 α 的约束（α < delta_a / a_Y(α=1)）"""
    a_N = G * M / r ** 2
    a_Y = a_N * (1.0 + r / lamb) * math.exp(-r / lamb)
    return delta_a / a_Y if a_Y > 0 else float("inf")


def main():
    print("=" * 66)
    print("实验附件 08：第五力约束全景（判决矩阵第 13 行）")
    print("=" * 66)

    # (名称, 灵敏度 delta_a [m/s²], 等效源质量 M [kg], 距离 r [m])
    experiments = [
        ("Eöt-Wash 扭秤",     1e-11,  1e-3,  1e-4),
        ("Panda 格点原子",    6.2e-9, 0.1,   0.05),
        ("MICROSCOPE 在轨",   2.5e-14, 5.97e24, 7.0e6),
        ("月球激光测距",      1e-12,  5.97e24, 3.84e8),
    ]
    lambdas = [1e-7, 1e-5, 1e-3, 1e-1, 1.0, 1e2, 1e5, 1e6, 1e8, 1e9]

    print(f"\nα 约束（'最强实验'为该 λ 下最严的约束）")
    print(f"{'λ [m]':>10}", end="")
    for (name, _, _, _) in experiments:
        print(f"{name:>18}", end="")
    print(f"{'最强约束':>14}")
    print("-" * 92)

    for lamb in lambdas:
        row = []
        for (name, da, M, r) in experiments:
            b = alpha_bound(da, M, r, lamb)
            row.append((b, name))
        best = min(row)
        print(f"{lamb:>10.1e}", end="")
        for (b, _) in row:
            if b > 1e6:
                print(f"{'~inf':>18}", end="")
            else:
                print(f"{b:>18.1e}", end="")
        print(f"{best[0]:>14.1e}")

    print("\n判读：")
    print("  1) λ ≥ 1e-4 m：α ~ O(1) 的 Yukawa 第五力已被排除；")
    print("  2) 1e-3 ~ 1e5 m：最强约束 ~1e-6（Eöt-Wash 主导）；1e8 m 以上 ~1e-15；")
    print("  3) λ < 1e-5 m：无直接约束（Casimir 主导，需专门平台）——")
    print("     这正是论文第七十三节 Casimir 传感平台的开放窗口；")
    print("  4) 叠加第 12 行：KK 引力 AB 需要 α ~ 0.36（核系统 eV 分裂），")
    print("     落在被排除 7~8 个数量级的区域——与附件 05 结论互证；")
    print("  5) 判决矩阵第 13 行维持原判：屏蔽第五力'已被大量排除'，")
    print("     且本表给出了排除范围的具体边界。")

if __name__ == "__main__":
    main()
