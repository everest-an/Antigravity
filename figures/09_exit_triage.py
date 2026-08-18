# -*- coding: utf-8 -*-
"""
图 9：三个出口的分流决策树（E6 图形版）
======================================
阳性态相关信号出现后的三步分流协议（数据同 experiments/19）。
"""
import sys

from pathlib import Path
FIG = Path(__file__).resolve().parent
SIM = FIG.parent / "simulations"

sys.path.insert(0, str(FIG))
import _style  # noqa: F401
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch, FancyArrowPatch

COLOR_START = "#27ae60"
COLOR_TEST = "#2980b9"
COLOR_EXIT = "#c0392b"
COLOR_ERR = "#666666"


def box(ax, x, y, w, h, text, fc, fs=10, ec="#444"):
    b = FancyBboxPatch((x, y), w, h, boxstyle="round,pad=0.03",
                       fc=fc, ec=ec, lw=1.2, alpha=0.92)
    ax.add_patch(b)
    ax.text(x + w / 2, y + h / 2, text, ha="center", va="center",
            fontsize=fs, color="#111")


def arrow(ax, x1, y1, x2, y2, label="", lx=0, ly=0.0):
    a = FancyArrowPatch((x1, y1), (x2, y2), arrowstyle="-|>",
                        mutation_scale=16, lw=1.4, color="#333")
    ax.add_patch(a)
    if label:
        ax.text((x1 + x2) / 2 + lx, (y1 + y2) / 2 + ly, label,
                fontsize=9, color="#333", ha="center")


def main():
    fig, ax = plt.subplots(figsize=(11, 8))
    ax.set_xlim(0, 11)
    ax.set_ylim(0, 8)
    ax.axis("off")

    box(ax, 3.7, 7.1, 3.6, 0.7, "阳性态相关信号\n（> 读出灵敏度）", COLOR_START, 10.5)

    # 第 1 步
    box(ax, 3.7, 5.5, 3.6, 0.8, "第 1 步：形状拟合\n扩展近距扫描 0.02~0.5 m\n单指数 vs 双指数", COLOR_TEST)
    arrow(ax, 5.5, 7.1, 5.5, 6.3)
    box(ax, 0.3, 5.55, 2.3, 0.7, "Δχ² > 4\n第二尺度检出", COLOR_EXIT, 9.5)
    arrow(ax, 3.7, 5.9, 2.6, 5.9, "是", 0, 0.25)
    box(ax, 0.3, 4.3, 2.3, 0.7, "出口二：非局域\n（ghost/多标度谱）", COLOR_EXIT, 9.5)
    arrow(ax, 1.45, 5.55, 1.45, 5.0)

    # 第 2 步
    box(ax, 3.7, 3.9, 3.6, 0.8, "第 2 步：多探针比值\n8.36 eV / 76.7 eV / keV / MeV", COLOR_TEST)
    arrow(ax, 5.5, 5.5, 5.5, 4.7, "否")
    box(ax, 7.6, 3.95, 3.0, 0.7, "比值偏离 O 标度 ~E/Λ\n（MeV 探针 2%）", COLOR_EXIT, 9.5)
    arrow(ax, 7.3, 4.3, 9.1, 4.3, "是", 0.25, 0)
    box(ax, 7.6, 2.7, 3.0, 0.7, "出口一：强耦合\n（Λ <~ 43 MeV）", COLOR_EXIT, 9.5)
    arrow(ax, 9.1, 3.95, 9.1, 3.4)

    # 第 3 步
    box(ax, 3.7, 2.3, 3.6, 0.8, "第 3 步：m 扫描模式\n（微波选投影 + 源翻转）", COLOR_TEST)
    arrow(ax, 5.5, 3.9, 5.5, 3.1, "否")
    box(ax, 0.3, 2.35, 2.3, 0.7, "线性 / 平方模式\n（∝m / ∝m²）", COLOR_EXIT, 9.5)
    arrow(ax, 3.7, 2.7, 2.6, 2.7, "是", 0, 0.25)
    box(ax, 0.3, 1.1, 2.3, 0.7, "出口三：态荷\n（自旋荷/四极荷）", COLOR_EXIT, 9.5)
    arrow(ax, 1.45, 2.35, 1.45, 1.8)

    # 常数模式 → 系统误差
    box(ax, 3.7, 0.9, 3.6, 0.7, "三常数模式 → 系统误差复查\n（出口均未打开）", COLOR_ERR, 9.5)
    arrow(ax, 5.5, 2.3, 5.5, 1.6, "否")

    ax.set_title("三出口分流协议：阳性信号后的一轮实验可完成全部判别（E6）",
                 fontsize=12.5, pad=12)
    for ext in ["png", "svg"]:
        fig.savefig(FIG / f"fig09_exit_triage.{ext}")
    print("saved fig09 (png, svg)")


if __name__ == "__main__":
    main()
