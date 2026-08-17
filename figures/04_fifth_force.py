# -*- coding: utf-8 -*-
"""
图 4：第五力约束全景（experiments/08 的图形版）+ KK 需求叠加
"""
import math
import sys

sys.path.insert(0, r"D:\Antigravity\figures")
import _style  # noqa: F401
import numpy as np
import matplotlib.pyplot as plt

G = 6.6743e-11


def alpha_bound(delta_a, M, r, lamb):
    a_N = G * M / r ** 2
    a_Y = a_N * (1.0 + r / lamb) * math.exp(-r / lamb)
    return delta_a / a_Y if a_Y > 0 else float("inf")


def main():
    experiments = [
        ("Eöt-Wash 扭秤", 1e-11, 1e-3, 1e-4, "#2980b9"),
        ("Panda 格点原子", 6.2e-9, 0.1, 0.05, "#27ae60"),
        ("MICROSCOPE", 2.5e-14, 5.97e24, 7.0e6, "#8e44ad"),
        ("月球激光测距", 1e-12, 5.97e24, 3.84e8, "#d35400"),
    ]
    lambs = np.logspace(-8, 10, 200)

    fig, ax = plt.subplots(figsize=(8.5, 6))
    best = np.full_like(lambs, np.inf)
    for (name, da, M, r, c) in experiments:
        b = np.array([alpha_bound(da, M, r, l) for l in lambs])
        finite = np.isfinite(b)
        ax.plot(lambs[finite], b[finite], color=c, lw=1.4, label=name)
        best = np.minimum(best, b)

    ax.plot(lambs, best, color="black", lw=2.2, ls="--",
            label="最强联合约束")
    ax.fill_between(lambs, best, 1e4, color="#c0392b", alpha=0.10)

    # KK 引力 AB 需求（附件 05）：α ~ 0.36 @ λ ≳ 10⁶ m
    ax.scatter([1e6], [0.36], marker="*", s=260, color="#c0392b", zorder=5,
               label="KK 引力 AB 需求（eV 分裂）")

    # 开放窗口：λ < 10⁻⁵ m（Casimir 主导区）
    ax.axvspan(1e-8, 1e-5, color="#f1c40f", alpha=0.12)
    ax.text(2.5e-7, 3e-3, "开放窗口\n(Casimir 平台)", fontsize=9, color="#7d6608", ha="center")

    ax.set_xscale("log")
    ax.set_yscale("log")
    ax.set_xlabel("λ [m]（Yukawa 力程）", fontsize=11)
    ax.set_ylabel("α（相对引力的耦合强度）", fontsize=11)
    ax.set_title("第五力约束全景：α ~ O(1) 已被排除；KK 的 eV 需求落在禁区 7–8 个数量级外",
                 fontsize=12)
    ax.set_ylim(1e-16, 1e1)
    ax.legend(fontsize=8.5, frameon=False, loc="lower left")
    ax.grid(alpha=0.25, which="both")

    for ext in ["png", "svg"]:
        fig.savefig(rf"D:\Antigravity\figures\fig04_fifth_force.{ext}")
    print("saved fig04 (png, svg)")


if __name__ == "__main__":
    main()
