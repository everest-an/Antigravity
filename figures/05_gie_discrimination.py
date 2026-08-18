# -*- coding: utf-8 -*-
"""
图 5：GIE 歧视（两面板）
(a) 三模型负度 vs 相位：量子引力 vs Schrödinger–Newton vs LOCC
(b) qubit 抽象忠实性：CV 负度收敛（模拟 06）
"""
import math
import sys

from pathlib import Path
FIG = Path(__file__).resolve().parent
SIM = FIG.parent / "simulations"

sys.path.insert(0, str(FIG))
sys.path.insert(0, str(SIM))
import _style  # noqa: F401
import numpy as np
import matplotlib.pyplot as plt
import qutip as qt


def qubit_negativity(phi):
    """四维 qubit 模型负度（同模拟 01 的相位约定：对角幺正 diag(1,e^{iφ},e^{iφ},1)）"""
    psi = np.array([0.5, 0.5, 0.5, 0.5], dtype=complex)
    U = np.diag([1, np.exp(1j * phi), np.exp(1j * phi), 1])
    psi = U @ psi
    rho = np.outer(psi, psi.conj())
    pt = rho.reshape(2, 2, 2, 2).transpose(0, 3, 2, 1).reshape(4, 4)
    ev = np.linalg.eigvalsh(pt)
    return float(np.sum(np.abs(ev[ev < 0])))


def main():
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12.5, 5.2))

    # ---- 面板 (a)：三模型 ----
    phis = np.linspace(0, np.pi, 200)
    n_qg = [qubit_negativity(p) for p in phis]
    ax1.plot(phis, n_qg, color="#2980b9", lw=2.2, label="量子引力（全局幺正）")
    ax1.axhline(0, color="#8e44ad", lw=1.6, ls="--",
                label="Schrödinger–Newton（平均场）/ LOCC")
    # Bose 基准点
    phi_bose = 0.217
    n_bose = qubit_negativity(phi_bose)
    ax1.scatter([phi_bose], [n_bose], color="#c0392b", s=70, zorder=5)
    ax1.annotate(f"Bose 基准\nφ={phi_bose} rad, N={n_bose:.3f}",
                 (phi_bose, n_bose), xytext=(8, -28), textcoords="offset points",
                 fontsize=9, color="#c0392b",
                 arrowprops=dict(arrowstyle="->", color="#c0392b", lw=1))
    ax1.set_xlabel("纠缠相位 φ [rad]", fontsize=11)
    ax1.set_ylabel("负度 N", fontsize=11)
    ax1.set_title("(a) 三模型歧视：观测 N>0 即排除 LOCC", fontsize=11.5)
    ax1.legend(fontsize=8.5, frameon=False, loc="upper left")
    ax1.grid(alpha=0.25)
    ax1.set_ylim(-0.02, 0.22)

    # ---- 面板 (b)：CV 收敛 ----
    G, HBAR = 6.6743e-11, 1.054571817e-34
    m, dx, d, t = 1e-14, 250e-6, 450e-6, 2.5
    p0 = G * m * m * t / (HBAR * d)
    phi_vec = (0.0, G * m * m * t / (HBAR * (d + dx)) - p0,
               G * m * m * t / (HBAR * (d - dx)) - p0, 0.0)
    N_qubit = qubit_negativity((phi_vec[1] + phi_vec[2]) / 2.0)

    N = 16
    alphas = np.linspace(0.4, 2.4, 11)
    devs = []
    for alpha in alphas:
        a = qt.coherent(N, alpha)
        na = qt.coherent(N, -alpha)
        psi = (qt.tensor(a, a) * np.exp(1j * phi_vec[0])
               + qt.tensor(a, na) * np.exp(1j * phi_vec[1])
               + qt.tensor(na, a) * np.exp(1j * phi_vec[2])
               + qt.tensor(na, na) * np.exp(1j * phi_vec[3])).unit()
        rho = psi * psi.dag()
        M = rho.full().reshape(N, N, N, N).transpose(0, 3, 2, 1).reshape(N * N, N * N)
        ev = np.linalg.eigvalsh(M)
        n_cv = float(np.sum(np.abs(ev[ev < 0])))
        devs.append(abs(n_cv - N_qubit))

    ax2.semilogy(alphas, devs, "o-", color="#2980b9", lw=1.8, ms=5,
                 label="|N_CV − N_qubit|（数值）")
    ax2.plot(alphas, np.exp(-2 * alphas ** 2), "--", color="#c0392b", lw=1.6,
             label="e^(−2α²)（分支正交性预言）")
    ax2.set_xlabel("分支位移 α", fontsize=11)
    ax2.set_ylabel("与 qubit 极限的偏差", fontsize=11)
    ax2.set_title("(b) qubit 抽象忠实性：CV 收敛 ∝ e^(−2α²)", fontsize=11.5)
    ax2.legend(fontsize=8.5, frameon=False)
    ax2.grid(alpha=0.25, which="both")

    for ext in ["png", "svg"]:
        fig.savefig(FIG / f"fig05_gie_discrimination.{ext}")
    print("saved fig05 (png, svg)")


if __name__ == "__main__":
    main()
