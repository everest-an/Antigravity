# -*- coding: utf-8 -*-
"""
图 8：量子态控制检验的零背景间隙（E5 图形版）
==============================================
横轴：三类态控制检验；纵轴：EFT 上界与读出灵敏度之间的零背景间隙
（对数刻度，单位：数量级）。数据同 experiments/18。
"""
import sys

from pathlib import Path
FIG = Path(__file__).resolve().parent
SIM = FIG.parent / "simulations"

sys.path.insert(0, str(FIG))
import _style  # noqa: F401
import numpy as np
import matplotlib.pyplot as plt


def main():
    labels = ["核钟态相关\n(Q 区分)", "GIE 内态控制\n(e·a_B 区分)", "frame dragging\n(自旋区分)"]
    gaps = [10.7, 13.1, 28.3]          # 数量级
    colors = ["#2980b9", "#8e44ad", "#d35400"]

    fig, ax = plt.subplots(figsize=(9.5, 6))
    bars = ax.bar(labels, gaps, color=colors, width=0.55, zorder=3)

    # 参考线：核钟 5σ 可达性对应间隙 = 0（可观测线）
    ax.axhline(0, color="#c0392b", lw=1.6, ls="--")
    ax.text(2.45, 1.2, "可观测线（间隙 = 0）", fontsize=9,
            color="#c0392b", ha="right")

    for bar, g in zip(bars, gaps):
        ax.text(bar.get_x() + bar.get_width() / 2, g + 0.9, f"{g:.0f} 个数量级",
                ha="center", va="bottom", fontsize=10, fontweight="bold",
                color="#333")

    ax.set_ylabel("零背景间隙（数量级，对数）", fontsize=11)
    ax.set_ylim(0, 33)
    ax.set_title("量子态控制检验：三类检验在弱耦合局域 EFT 类中全部零背景\n"
                 "（任何可观测态相关信号 = 证伪 GR + 标准 KK + 全部局域 EFT）",
                 fontsize=12)
    ax.grid(alpha=0.25, axis="y")
    for s in ["top", "right"]:
        ax.spines[s].set_visible(False)

    for ext in ["png", "svg"]:
        fig.savefig(FIG / f"fig08_quantum_state_resource.{ext}")
    print("saved fig08 (png, svg)")


if __name__ == "__main__":
    main()
