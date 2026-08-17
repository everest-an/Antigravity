# -*- coding: utf-8 -*-
"""
模拟 06：GIE 协议的连续变量验证（QuTiP）
==========================================
验证模拟 01 的 qubit 抽象是否忠实：
真实 QGEM 中每个质量是谐振子，分支是相干态 |±α⟩。
四分支态：

    |Ψ⟩ ∝ |α,α⟩ + e^{iφ_LR}|α,-α⟩ + e^{iφ_RL}|-α,α⟩ + |-α,-α⟩

其中 φ_LR, φ_RL 为精确引力分支相位（同模拟 01）。

结论（将被数值验证）：
  1) α→∞ 时 CV 负度 → qubit 负度；抽象误差 ~ ⟨α|-α⟩ = e^{-2α²}；
  2) 真实实验参数（μm 叠加）对应 α ~ 10⁷~10⁸——CV 分支会以
     Γ ~ γ·(2α)² 的速率退相干，这正是 QGEM 必须用自旋分支短脉冲协议的原因。
"""
import math
import sys

import numpy as np
import qutip as qt

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

G, HBAR = 6.6743e-11, 1.054571817e-34


def branch_phases(m, dx, d, t):
    def ph(sep):
        return G * m * m * t / (HBAR * sep)
    p0 = ph(d)
    return 0.0, ph(d + dx) - p0, ph(d - dx) - p0, 0.0


def cv_branched_state(N, alpha, phi_vec):
    """四分支相干态叠加，返回 Qobj 与归一常数"""
    pLL, pLR, pRL, pRR = phi_vec
    a = qt.coherent(N, alpha)
    na = qt.coherent(N, -alpha)
    psi = (qt.tensor(a, a) * np.exp(1j * pLL)
           + qt.tensor(a, na) * np.exp(1j * pLR)
           + qt.tensor(na, a) * np.exp(1j * pRL)
           + qt.tensor(na, na) * np.exp(1j * pRR))
    return psi.unit()


def cv_negativity(psi, N):
    """对第二模式做部分转置，取负特征值之和"""
    rho = psi * psi.dag()
    M = rho.full()                       # (N², N²)
    M = M.reshape(N, N, N, N)
    M = np.transpose(M, (0, 3, 2, 1))    # 转置子系统 B
    M = M.reshape(N * N, N * N)
    ev = np.linalg.eigvalsh(M)
    return float(np.sum(np.abs(ev[ev < 0])))


def qubit_negativity(phi_vec):
    """模拟 01 的四维 qubit 负度（α→∞ 极限）"""
    pLL, pLR, pRL, pRR = phi_vec
    psi = np.array([0.5, 0.5, 0.5, 0.5], dtype=complex)
    U = np.diag([np.exp(1j * pLL), np.exp(1j * pLR), np.exp(1j * pRL), np.exp(1j * pRR)])
    psi = U @ psi
    rho = np.outer(psi, psi.conj())
    pt = rho.reshape(2, 2, 2, 2).transpose(0, 3, 2, 1).reshape(4, 4)
    ev = np.linalg.eigvalsh(pt)
    return float(np.sum(np.abs(ev[ev < 0])))


def main():
    print("=" * 66)
    print("模拟 06：GIE 连续变量验证（QuTiP）")
    print("=" * 66)

    # Bose 基准参数（同模拟 01）
    m, dx, d, t = 1e-14, 250e-6, 450e-6, 2.5
    phi_vec = branch_phases(m, dx, d, t)
    N_qubit = qubit_negativity(phi_vec)
    print(f"\n[1] Bose 基准参数，qubit 极限负度 N(α→∞) = {N_qubit:.4f}")

    N = 16
    print(f"\n[2] CV 负度 vs 分支位移 α（截断 N={N}）")
    print(f"    {'α':>6}{'N_cv':>10}{'偏差 |N_cv-N_qubit|':>20}{'⟨α|-α⟩=e^{-2α²}':>16}")
    print("    " + "-" * 56)
    for alpha in [0.5, 1.0, 1.5, 2.0, 2.5, 3.0]:
        psi = cv_branched_state(N, alpha, phi_vec)
        n_cv = cv_negativity(psi, N)
        dev = abs(n_cv - N_qubit)
        overlap = math.exp(-2 * alpha * alpha)
        print(f"    {alpha:>6.1f}{n_cv:>10.4f}{dev:>20.4f}{overlap:>16.2e}")

    print("\n    判读：α 增大时 CV 负度收敛到 qubit 极限，")
    print("    收敛速度 ∝ e^{-2α²}（分支正交性）——qubit 抽象是忠实的；")
    print("    α=3 的回升是 N=16 截断误差（⟨n⟩=α²=9 的尾部被截），非物理。")

    # ---- 真实实验参数的退相干阈值 ----
    print(f"\n[3] 真实参数下的退相干（μm 叠加 ↔ 巨大 α）")
    omega = 2 * np.pi * 1e3     # 1 kHz 机械振子
    for (name, m_real, dx_real) in [("纳米金刚石 10^-15 kg, 1 um", 1e-15, 1e-6),
                                    ("纳米金刚石 10^-14 kg, 100 um", 1e-14, 100e-6)]:
        x_zpf = math.sqrt(HBAR / (2 * m_real * omega))
        alpha_real = dx_real / (2 * math.sqrt(2) * x_zpf)
        for Q in [1e8, 1e12]:
            gamma = omega / Q
            Gamma = gamma * (2 * alpha_real) ** 2
            tau = 1.0 / Gamma if Gamma > 0 else float('inf')
            tau_str = f"{tau:.2e} s" if tau < 1e6 else ">1e6 s"
            print(f"    {name}: α ≈ {alpha_real:.1e}, Q={Q:.0e} -> Γ_deph = {Gamma:.2e} Hz, "
                  f"相干时间 ~ {tau_str}")
    print("    => μm 叠加的 CV 分支在现实 Q 值下微秒~毫秒即退相干；")
    print("       QGEM 必须依赖自旋分支的短脉冲协议（模拟 01 的 qubit 图像），")
    print("       或 reservoir-engineered 稳态方案（Tang 2025）——")
    print("       这正是实验路线图把噪声预算列为首位的量化理由。")

if __name__ == "__main__":
    main()
