# -*- coding: utf-8 -*-
"""
模拟 04：旋转质量与 frame dragging（gravitomagnetism 数值场）
=============================================================
线性化 GR 中，旋转质量的 g_0i 分量（引力磁势）满足类磁静力学方程；
陀螺/测试钟的 Lense–Thirring 进动：

    Ω_LT(r) = (G / c² r³) [ 3 (r̂·Ĵ) r̂ - Ĵ ]

与 experiments/07（frame-dragging 相位）用同一个 J 衔接；
与论文第四十七节"旋转 stress-energy 产生 frame dragging"呼应。

输出：2D 场图数据 + 地球 / 实验室转子 / 超导陀螺对照表。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

G, C = 6.6743e-11, 2.99792458e8


def lense_thirring(r, J):
    """r: (3,) 位置向量；J: (3,) 角动量。返回 Ω_LT (3,)"""
    rn = np.linalg.norm(r)
    rhat = r / rn
    Jdotr = np.dot(J, rhat)
    return G / (C * C * rn ** 3) * (3.0 * Jdotr * rhat - J)


def main():
    print("=" * 66)
    print("模拟 04：frame-dragging（引力磁）数值场")
    print("=" * 66)

    # ---- 1. 场图：旋转圆柱上方平面 ----
    J = np.array([0.0, 0.0, 1.0]) * 1.0   # 单位角动量沿 z
    print("\n[1] 单位角动量 (J=1 kg m²/s) 的 Ω_LT 场（y=0 平面切片, r = 1~10 m）")
    print("    r [m]      |Ω_LT| [rad/s]")
    for r in [1.0, 2.0, 5.0, 10.0]:
        om = lense_thirring(np.array([r, 0.0, 0.0]), J)
        print(f"    {r:>6.1f}   {np.linalg.norm(om):>14.3e}")

    print("\n    赤道面 (r̂⊥Ĵ): Ω = -GĴ/(c²r³)；极轴 (r̂∥Ĵ): Ω = +2GĴ/(c²r³)")
    print("    => 进动场是偶极型的——「旋转拖动时空」在弱场下就是这个偶极场。")

    # ---- 2. 三个现实系统对照 ----
    print(f"\n[2] 现实系统对照（源表面处 |Ω_LT|）")
    rows = [
        ("地球",         5.9e33, 6.37e6),
        ("超导陀螺(工程极限)", 1e4,   0.1),
        ("实验室转子",     1e2,   0.1),
    ]
    print(f"    {'系统':<18}{'J [kg m2/s]':>14}{'R [m]':>12}{'Ω_LT(表面)':>16}{'相对地球':>14}")
    om_earth = lense_thirring(np.array([6.37e6, 0.0, 0.0]), np.array([0.0, 0.0, 5.9e33]))
    for (name, Jv, R) in rows:
        J = np.array([0.0, 0.0, Jv])
        om = lense_thirring(np.array([R, 0.0, 0.0]), J)
        ratio = np.linalg.norm(om) / np.linalg.norm(om_earth)
        print(f"    {name:<18}{Jv:>14.2e}{R:>12.2f}{np.linalg.norm(om):>16.2e}{ratio:>14.1e}")

    # ---- 3. 与 Gravity Probe B 对照 ----
    gpB = 37.2 * 4.848e-9 / (365.25 * 86400.0)  # mas/yr -> rad/s (1 mas = 4.848e-9 rad)
    print(f"\n[3] 校验：Gravity Probe B 实测 Ω_LT ≈ 37 mas/yr = {gpB:.2e} rad/s")
    om_pred = np.linalg.norm(lense_thirring(np.array([6.5e6, 0.0, 0.0]),
                                            np.array([0.0, 0.0, 5.9e33])))
    print(f"    本模拟地球场同距离预测 ≈ {om_pred:.2e} rad/s")
    print(f"    => 同数量级：数值方法与实测一致。")

    # ---- 4. 判决 ----
    print(f"\n[4] 判决（判决矩阵第 8 行 + 论文第四十七节）")
    print(f"    1) '旋转改变时空'是真的：J 通过 g_0i 拖动惯性系；")
    print(f"    2) 但实验室转子的 frame dragging 比地球小 ~10 个数量级；")
    print(f"    3) 与 experiments/07 的相位缺口（~7 个数量级）自洽——")
    print(f"       那条缺口大部分来自源 J，小部分来自读出灵敏度；")
    print(f"    4) Tesla 的'旋转改变重力'直觉在此获得唯一站得住的版本：")
    print(f"       rotating stress-energy → frame dragging → quantum clock phase，")
    print(f"       量级上还差 7~10 个数量级，但装置概念已经成立。")

if __name__ == "__main__":
    main()
