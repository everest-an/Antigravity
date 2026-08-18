# -*- coding: utf-8 -*-
"""
图 7：态相关耦合的 EFT 上界（R3 —— T2 推论 4 图形版）
======================================================
内容：
  (a) δα(Λ) = √α·c·Q·M_Pl/(Λ²λ²m_nuc) 三条曲线（α = 1e-6 / 1e-9 / 1e-12）；
  (b) 核钟可达性水平线（5σ = 2.9e-11；1σ = 4.0e-12）；
  (c) EFT 失效区阴影（Λ < QCD 尺度 ~ 0.2 GeV）——所有交点落在区内：
      可观测性 = 局域 EFT 描述失效。
公式与常数完全同 experiments/17（λ = 1 m，c = 1）。
"""
import sys

from pathlib import Path
FIG = Path(__file__).resolve().parent
SIM = FIG.parent / "simulations"

sys.path.insert(0, str(FIG))
import _style  # noqa: F401
import numpy as np
import matplotlib.pyplot as plt

M_PL = 1.221e19
Q_NUC = 2.41e4       # GeV⁻²
M_NUC = 213.3        # GeV
LAM_1M = 5.068e15    # GeV⁻¹

REACH_5SIG = 2.9e-11
REACH_1SIG = 4.0e-12


def delta_alpha(alpha, Lambda):
    return np.sqrt(alpha) * Q_NUC * M_PL / (Lambda ** 2 * LAM_1M ** 2 * M_NUC)


def main():
    lam_scan = np.logspace(-3, 19, 300)
    alphas = [(1e-6, "#0b5394"), (1e-9, "#3d85c6"), (1e-12, "#9fb8d4")]

    fig, ax = plt.subplots(figsize=(9.5, 6.5))

    for a, c in alphas:
        ax.plot(lam_scan, delta_alpha(a, lam_scan), color=c, lw=1.8,
                label=f"EFT 上界 δα(Λ)，α = {a:.0e}")

    # 核钟可达性
    ax.axhline(REACH_5SIG, color="#c0392b", lw=2.0, ls="-",
               label=f"核钟可达性 5σ = {REACH_5SIG:.0e}")
    ax.axhline(REACH_1SIG, color="#c0392b", lw=1.4, ls="--",
               label=f"核钟可达性 1σ = {REACH_1SIG:.0e}")

    # EFT 失效区（QCD 尺度以下）
    ax.axvspan(1e-3, 2e-1, color="#8e44ad", alpha=0.12)
    ax.text(6e-3, 1.5e-8, "EFT 失效区\n(Λ < QCD 尺度 ~ 0.2 GeV)",
            fontsize=9, color="#5b2c6f", ha="left", va="center")

    # 交点标注（α=1e-6 线在 Λ ~ 43 MeV 处穿过 5σ 线）
    ax.annotate("交点 Λ ≈ 43 MeV（α=1e-6）\n位于 EFT 失效区内：\n可观测性 = EFT 失效",
                xy=(4.3e-2, REACH_5SIG), xytext=(8e0, 1e-8),
                fontsize=9, color="#c0392b",
                arrowprops=dict(arrowstyle="->", color="#c0392b", lw=1))

    # LHC 尺度标注
    ax.axvline(1e4, color="#666666", lw=1.0, ls=":")
    ax.text(1.6e4, 2e-4, "Λ = 10 TeV\n(LHC 下界)", fontsize=8.5, color="#666666")

    ax.set_xscale("log")
    ax.set_yscale("log")
    ax.set_xlim(1e-3, 1e19)
    ax.set_ylim(1e-56, 1e-8)
    ax.set_xlabel("Λ [GeV]（EFT 截断）", fontsize=11)
    ax.set_ylabel("δα（态相关 Yukawa 耦合差）", fontsize=11)
    ax.set_title("态相关耦合的 EFT 上界：核钟搜索是零背景证伪检验（λ = 1 m）",
                 fontsize=12)
    ax.legend(fontsize=8.5, frameon=False, loc="lower left")
    ax.grid(alpha=0.25, which="both")

    for ext in ["png", "svg"]:
        fig.savefig(FIG / f"fig07_state_dependence.{ext}")
    print("saved fig07 (png, svg)")


if __name__ == "__main__":
    main()
