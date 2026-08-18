# -*- coding: utf-8 -*-
"""
图 6：核钟 KK 可达性（E2 包图形版，阶段 4.1 交付物）
==================================================
内容：
  (a) 实验室配置 α_min(λ, τ) 四条曲线（τ = 10³~10⁶ s，投影稳定度 4.6e-23/√τ）；
  (b) 既有约束叠加：普适通道测距阶梯（LAGEOS/LLR/行星历表）+
      MICROSCOPE 组分通道饱和界（5.5e-15）；
  (c) 轨道配置极限线 α_min ~ 1.4e-25（需搭载机会）；
  (d) 未排除窗口 α∈[10⁻¹², 10⁻⁶] 阴影带。

公式与常数完全同 experiments/14（独立重算即交叉检验）：
  α_min = δE(τ)/s × e^(a/λ)，δE(τ) = 8.36 eV × 4.6e-23/√τ，
  s_lab = 9.5e-14 eV/α，s_orb = 2.79 eV/α，a = 6.771e6 m。
"""
import sys

from pathlib import Path
FIG = Path(__file__).resolve().parent
SIM = FIG.parent / "simulations"

sys.path.insert(0, str(FIG))
import _style  # noqa: F401
import numpy as np
import matplotlib.pyplot as plt

E_TRANS = 8.36             # eV
S_LAB = 9.5e-14            # eV per alpha（实验室）
S_ORB = 2.79               # eV per alpha（轨道）
A_ORB = 6.771e6            # m（轨道半长轴，Yukawa 抑制因子 e^(a/λ)）
SIGMA0 = 4.6e-23           # 投影稳定度系数（1/√τ）


def alpha_min(lamb, tau, s):
    """1σ 可达 α_min（与 experiments/14 同一公式）。"""
    dE = E_TRANS * SIGMA0 / np.sqrt(tau)
    return dE / s * np.exp(A_ORB / lamb)


def main():
    lambs = np.logspace(5, 11, 300)
    taus = [1e3, 1e4, 1e5, 1e6]
    colors = ["#9fb8d4", "#6fa8dc", "#3d85c6", "#0b5394"]

    fig, ax = plt.subplots(figsize=(9.5, 6.5))

    # ---- 实验室配置曲线族 ----
    for tau, c in zip(taus, colors):
        ax.plot(lambs, alpha_min(lambs, tau, S_LAB), color=c, lw=1.8,
                label=f"实验室 α_min（τ={tau:.0e} s）")

    # ---- 轨道配置极限线 ----
    a_orb = E_TRANS * SIGMA0 / np.sqrt(1e6) / S_ORB   # λ→∞ 极限
    ax.axhline(a_orb, color="#27ae60", lw=1.6, ls=":",
               label=f"轨道配置 α_min（τ=1e6 s）≈ {a_orb:.0e}")

    # ---- 既有约束 ----
    # 普适通道测距阶梯（水平段，标签在右侧）
    segs = [
        (1e5, 1e7, 1e-9, "#8e44ad", "LAGEOS/GEO"),
        (1e7, 3.8e8, 1e-9, "#8e44ad", None),
        (3.8e8, 1.5e11, 3e-11, "#8e44ad", "LLR"),
        (1.5e11, 3e11, 1e-8, "#8e44ad", "行星历表"),
    ]
    for x0, x1, y, c, lab in segs:
        ax.plot([x0, x1], [y, y], color=c, lw=2.4, ls="--", alpha=0.85)
        if lab:
            ax.text(x1 * 1.06, y, lab, fontsize=8.5, color=c, va="center")
    ax.plot([], [], color="#8e44ad", lw=2.4, ls="--",
            label="普适通道既有界（测距）")

    # MICROSCOPE 组分通道饱和界
    ax.plot([7e6, 3e11], [5.5e-15, 5.5e-15], color="#d35400", lw=2.0,
            ls="-.", label="MICROSCOPE 组分通道（2σ 饱和段）")

    # ---- 未排除窗口阴影 ----
    ax.axhspan(1e-12, 1e-6, color="#f1c40f", alpha=0.10)
    ax.text(1.6e5, 3e-11, "未排除窗口\nα ∈ [1e-12, 1e-6]", fontsize=9.5,
            color="#7d6608", va="center")

    # ---- 关键交叉标注：λ~1e7-1e10 段，τ=1e6 曲线深于测距界 1~2 个数量级 ----
    ax.annotate("τ=1e6 s 曲线在 λ∈[1e7, 1e10] m 段\n深于既有测距界 1~2 个数量级",
                xy=(1e8, 4.3e-12), xytext=(4e5, 2e-14),
                fontsize=9, color="#0b5394",
                arrowprops=dict(arrowstyle="->", color="#0b5394", lw=1))

    ax.set_xscale("log")
    ax.set_yscale("log")
    ax.set_xlim(1e5, 3e11)
    ax.set_ylim(1e-26, 1e-4)
    ax.set_xlabel("λ [m]（Yukawa 力程）", fontsize=11)
    ax.set_ylabel("α_min（可检出耦合，1σ）", fontsize=11)
    ax.set_title("核钟 KK 可达性：实验室 α_min(λ, τ) + 轨道极限 vs 既有约束",
                 fontsize=12)
    ax.legend(fontsize=8.5, frameon=False, loc="lower left")
    ax.grid(alpha=0.25, which="both")

    for ext in ["png", "svg"]:
        fig.savefig(FIG / f"fig06_reachability.{ext}")
    print("saved fig06 (png, svg)")


if __name__ == "__main__":
    main()
