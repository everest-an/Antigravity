# -*- coding: utf-8 -*-
"""
实验附件 13：LIV 约束重推导（判决矩阵第 19 行）
================================================
线性洛伦兹不变性违反（LIV）下，光子色散关系 E² = p²(1 ± E/E_QG)，
两个能量 E1 > E2 的光子到达时间差：
    Δt = (E1 - E2)/(E_QG) × D(z),  D(z) = ∫₀ᶻ (1+z') dz' / H(z')

单事件约束（GRB 090510 型）：
    E_QG > ΔE × D(z) / Δt_obs

稳健系综约束（层次贝叶斯，Du et al. 2025）与模型无关约束（Tian et al. 2025）
以文献值列表呈现。输出：单事件界的推导 + 系综界对照表。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

H0_KM = 70.0     # km/s/Mpc
C_KM = 299792.458


def comoving_distance(z, Om=0.3):
    """平坦 ΛCDM 下 ∫ dz/H(z)（Mpc）——用梯形积分近似"""
    n = 4000
    dz = z / n
    total = 0.0
    for i in range(n):
        zi = (i + 0.5) * dz
        H = H0_KM * math.sqrt(Om * (1 + zi) ** 3 + (1 - Om))
        total += dz / H
    return C_KM * total  # Mpc


def D_effective(z, Om=0.3):
    """D(z) = ∫ (1+z') dz'/H(z')（含 (1+z) 因子，量纲 Mpc）"""
    n = 4000
    dz = z / n
    total = 0.0
    for i in range(n):
        zi = (i + 0.5) * dz
        H = H0_KM * math.sqrt(Om * (1 + zi) ** 3 + (1 - Om))
        total += (1 + zi) * dz / H
    return C_KM * total  # Mpc


def main():
    print("=" * 66)
    print("实验附件 13：LIV 约束重推导（第 19 行）")
    print("=" * 66)

    MPC = 3.0857e19 * 1e3 / 1.0  # Mpc -> km -> m: 1 Mpc = 3.0857e22 m
    z = 0.9
    Dz = D_effective(z)
    print(f"\n[1] GRB 090510 型（z = {z}）：D_eff = {Dz:.0f} Mpc")

    dE_GeV = 31.0          # 最高能光子
    dt_obs = 0.83          # 观测无滞后上限（s）
    E_QG_GeV = dE_GeV * Dz * MPC / (C_KM * 1e3 * dt_obs)
    print(f"\n[2] 单事件界：E_QG > ΔE · D / (c Δt_obs)")
    print(f"    ΔE = {dE_GeV} GeV, Δt < {dt_obs} s")
    print(f"    => E_QG,1 > {E_QG_GeV:.1e} GeV = {E_QG_GeV/1.22e19:.1f} M_Pl")

    print(f"\n[3] 系综界对照（文献值）")
    rows = [
        ("层次贝叶斯（32 GRB）",       "E_QG,1 ≥ 4.37e16 GeV",  "Du et al., ApJ 2025"),
        ("模型无关 ANN（74 GRB）",     "E_QG,1 ≥ 2.60e15 GeV",  "Tian et al., JCAP 2025"),
        ("蒙特卡洛 Model C",          "E_LV ≈ 3e17 GeV（亚光速）", "Song & Ma, PRD 2025"),
        ("300 TeV 光子（二阶）",       "E_LIV2 ≈ 1.3e-7 M_Pl（争议）", "Ofengeim & Piran, PRD 2025"),
        ("LAGEOS 优选系",             "|α1| ~ 2e-5",            "Lucchesi et al. 2025"),
    ]
    print(f"    {'通道':<26} {'结果':<28} {'文献':<26}")
    for name, val, ref in rows:
        print(f"    {name:<26} {val:<28} {ref:<26}")

    print(f"\n[4] 判决（第 19 行）")
    print(f"    1) 线性 LIV：单事件界 ~ 1e19-1e20 GeV（模型依赖），")
    print(f"       稳健系综界 ~ 1e15-1e16 GeV——线性窗口逼近 Planck 尺度；")
    print(f"    2) 二次 LIV：约束弱得多（E_QG,2 ~ 1e8-1e10 GeV），仍有窗口；")
    print(f"    3) 唯一 hint（300 TeV 光子二阶亚光速解）未获独立复现；")
    print(f"    4) 第 19 行维持'B 级，无显著证据'，量级依据在此给出。")

if __name__ == "__main__":
    main()
