# -*- coding: utf-8 -*-
"""
实验附件 11：混合态等效原理违反的数值演示（判决矩阵第 5 行）
============================================================
Fedida-Kent（PRD 111, 126016）的核心：Møller-Rosenfeld 半经典引力的动力学
非线性地依赖态，因此 proper mixture 与 improper mixture 虽在 t=0 有相同
密度矩阵，其时间演化不同——违反弱 MEP。

本脚本用无量纲 1D Schrödinger-Newton 方程数值演示该机制：
    i ∂_τ ψ = [-½ ∂_X² - κ ∫ ρ̃(X')/√((X-X')²+ε²) dX'] ψ,
其中 κ = G m³ dx/ħ² 为无量纲 SN 耦合。

演示用 κ ~ O(1)（对应质量 ~10⁻²⁰ kg 的玩具值）；对基准质量 10⁻¹⁴ kg，
分叉速率按 κ 缩小约 10⁶ 倍——机制结构存在，速率由非线性强度设定。
这正是"第 5 行在原理上排除 ⟨T̂μν⟩、在实验上难以判决"的数值体现。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass


def sn_potential(rho, eps):
    N = len(rho)
    X = np.arange(N, dtype=float)
    Xm = X[:, None] - X[None, :]
    return -(1.0 / np.sqrt(Xm ** 2 + eps ** 2)) @ rho


def split_step(psi, kappa, eps, dt, n_steps):
    N = len(psi)
    k = 2 * np.pi * np.fft.fftfreq(N, 1.0)
    kin = np.exp(-1j * k * k * dt / 2.0)
    for _ in range(n_steps):
        rho = np.abs(psi) ** 2
        V = kappa * sn_potential(rho, eps)
        psi = psi * np.exp(-1j * V * dt)
        psi = np.fft.ifft(kin * np.fft.fft(psi))
        rho = np.abs(psi) ** 2
        V = kappa * sn_potential(rho, eps)
        psi = psi * np.exp(-1j * V * dt)
    return psi


def main():
    print("=" * 66)
    print("实验附件 11：MEP 违反的数值演示（第 5 行）")
    print("=" * 66)

    N = 512
    X = np.arange(N, dtype=float)
    sigma = 1.0
    cL, cR = N * 0.34, N * 0.66
    psiL = np.exp(-((X - cL) ** 2) / (2 * sigma ** 2)); psiL /= np.linalg.norm(psiL)
    psiR = np.exp(-((X - cR) ** 2) / (2 * sigma ** 2)); psiR /= np.linalg.norm(psiR)
    psiS = (psiL + psiR) / math.sqrt(2)

    overlap = abs(np.vdot(psiL, psiR))
    rho0_p = 0.5 * (np.abs(psiL) ** 2 + np.abs(psiR) ** 2)
    rho0_i = np.abs(psiS) ** 2
    d0 = np.linalg.norm(rho0_p - rho0_i)
    print(f"\n[1] 分支重叠 |⟨L|R⟩| = {overlap:.2e}；t=0 密度矩阵差 = {d0:.2e}（应≈0）")

    kappa, eps, dt, n_steps = 0.8, 2.0, 0.25, 120
    upL = split_step(psiL.copy(), kappa, eps, dt, n_steps)
    upR = split_step(psiR.copy(), kappa, eps, dt, n_steps)
    upS = split_step(psiS.copy(), kappa, eps, dt, n_steps)
    rho_proper = 0.5 * (np.abs(upL) ** 2 + np.abs(upR) ** 2)
    rho_improper = np.abs(upS) ** 2
    dT = np.linalg.norm(rho_proper - rho_improper)
    print(f"[2] SN 演化后密度矩阵差（κ={kappa}，τ={dt*n_steps}）：{dT:.2e}")

    def linear_step(psi, dt, n_steps):
        k = 2 * np.pi * np.fft.fftfreq(len(psi), 1.0)
        kin = np.exp(-1j * k * k * dt / 2.0)
        for _ in range(n_steps):
            psi = np.fft.ifft(kin * np.fft.fft(psi))
        return psi
    lpL = linear_step(psiL.copy(), dt, n_steps)
    lpR = linear_step(psiR.copy(), dt, n_steps)
    lpS = linear_step(psiS.copy(), dt, n_steps)
    dT_lin = np.linalg.norm(0.5 * (np.abs(lpL) ** 2 + np.abs(lpR) ** 2) - np.abs(lpS) ** 2)
    print(f"[3] 线性演化后差（应=0）：{dT_lin:.2e}")

    HBAR, G = 1.054571817e-34, 6.6743e-11
    m_demo = (kappa * HBAR ** 2 / G) ** (1 / 3)
    print(f"\n[4] 参数对应：κ={kappa}（dx=1 m 无量纲化）对应质量 m ≈ {m_demo:.1e} kg")

    print(f"\n[5] 判决（第 5 行）")
    if d0 < 1e-10 and dT > 50 * max(dT_lin, 1e-12):
        print(f"    1) SN 演化下 proper/improper 分叉（{dT:.2e}），线性演化恒等——")
        print(f"       ⟨T̂μν⟩ 源违反弱 MEP 的机制被数值复现（分叉超出数值底噪 {dT/dT_lin:.0f} 倍）；")
        print(f"    2) 真实基准质量（10⁻¹⁴ kg）的 κ 小约 6 个数量级，")
        print(f"       分叉速率相应变慢——'原理上排除、实验上难判决'由此得到量化；")
        print(f"    3) 第 5 行的判决（Fedida-Kent + Williams 双重排除）获得独立数值演示。")
    else:
        print(f"    数值未复现预期分叉（dT={dT:.2e}, dT_lin={dT_lin:.2e}），需检查。")

if __name__ == "__main__":
    main()
