# -*- coding: utf-8 -*-
"""
实验附件 14：核钟 KK 可达性全参数扫描（E2 包核心）
==================================================
输出 α_min(λ, τ) 全图数据：实验室配置 + 轨道配置两条曲线族。

实验室配置：ΔE/α = m_Th · G M (1/r1 - 1/r2)，M=100 kg, r: 0.15→1.5 m
轨道配置：  ΔE/α = m_Th · 2 g a e，LEO e=0.01

α_min(λ, τ) = δE(τ) / (ΔE/α) × e^(a/λ)，δE(τ) = 8.36 eV × σ(τ)，
σ(τ) = 4.6e-23/sqrt(τ)（投影）与 1e-15（当前，kHz 线宽，保守值）。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

M_TH = 3.8e-25          # kg
EV = 1.602176634e-19
G = 6.6743e-11


def lab_signal_per_alpha():
    M = 100.0
    r1, r2 = 0.15, 1.5
    dPhi = G * M * (1 / r1 - 1 / r2)
    return M_TH * dPhi / EV          # eV per unit alpha


def orbital_signal_per_alpha():
    g, a, e = 8.69, 6.771e6, 0.01
    dPhi = 2 * g * a * e
    return M_TH * dPhi / EV


def main():
    print("=" * 66)
    print("实验附件 14：核钟 KK 可达性全参数扫描（E2 包）")
    print("=" * 66)

    E_trans = 8.3557          # eV
    sigma_proj = lambda tau: 4.6e-23 / np.sqrt(tau)
    sigma_curr = lambda tau: 1e-15 * np.ones_like(tau)  # 当前 kHz 线宽（保守）

    s_lab = lab_signal_per_alpha()
    s_orb = orbital_signal_per_alpha()
    print(f"\n[1] 信号系数（eV per α）：实验室 {s_lab:.2e}；轨道 {s_orb:.2e}")

    taus = np.array([1e3, 1e4, 1e5, 1e6])
    lambs = np.logspace(6, 10, 5)

    print(f"\n[2] α_min 可达性表（投影稳定度）")
    print(f"    {'λ [m]':>10} {'τ=1e3s':>10} {'τ=1e4s':>10} {'τ=1e5s':>10} {'τ=1e6s':>10}")
    print(f"    {'-'*56}")
    for lam in lambs:
        row = []
        for tau in taus:
            dE = E_trans * sigma_proj(tau)
            a_min = dE / s_lab * math.exp(6.771e6 / lam)
            row.append(f"{a_min:.1e}")
        print(f"    {lam:>10.0e} " + " ".join(f"{r:>10}" for r in row))

    print(f"\n[3] 轨道配置 α_min（投影稳定度，λ→∞ 极限）")
    for tau in taus:
        dE = E_trans * sigma_proj(tau)
        print(f"    τ={tau:.0e} s: α_min = {dE/s_orb:.1e}")

    print(f"\n[4] 当前平台（kHz 线宽）对照")
    for tau in [1e4, 1e6]:
        dE = E_trans * 1e-15
        print(f"    τ={tau:.0e} s: α_min(lab) = {dE/s_lab:.1e}，α_min(orb) = {dE/s_orb:.1e}")
        print(f"    （均劣于 Eöt-Wash/MICROSCOPE——当前平台不可行，投影稳定度是硬前提）")

    # 保存数据供绘图（相对路径，兼容 CI）
    out = np.column_stack([lambs,
                           [E_trans * sigma_proj(1e6) / s_lab * math.exp(6.771e6 / l) for l in lambs]])
    np.savetxt("build/reachability_lab.csv", out,
               header="lambda_m,alpha_min_proj_tau1e6", comments="")
    print(f"\n[5] 数据已存 build/reachability_lab.csv；")
    print(f"    结论：实验室配置在投影稳定度下 α_min ~ 1e-12（τ=1e6s），")
    print(f"    轨道配置 α_min ~ 1.4e-25（同投影稳定度）——轨道信号系数大 2.9e13 倍，")
    print(f"    可达深度比实验室多 13 个数量级，但需搭载机会。")

if __name__ == "__main__":
    main()
