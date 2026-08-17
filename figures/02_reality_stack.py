# -*- coding: utf-8 -*-
"""
图 2：Reality Stack 七层 + 控制栈/测量栈 + Tμν 唯一入口标注
"""
import sys

sys.path.insert(0, r"D:\Antigravity\figures")
import _style  # noqa: F401
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch

LAYERS = [
    (7, "?",                         "未知基础结构", "#e8e8e8"),
    (6, "量子关系 / 信息",             "纠缠结构、QRF、因果关系", "#f5e6f0"),
    (5, "对称性 / 连接 / 运动学代数",   "规范群、double copy、kinematic algebra", "#e6ecf5"),
    (4, r"态值源 $\hat{T}$、荷",        "应力能量张量、规范荷 ← 唯一工程入口", "#eaf4ea"),
    (3, "gμν、Aμ、量子场",            "度规、规范势、场的激发 ← 有效层", "#f7f3e6"),
    (2, "运动 / 钟相位 Δφ=ΔS/ħ",      "测地线、proper time", "#fdf0e6"),
    (1, "观测量",                     "clicks、光子、位置、频率", "#f0f0f0"),
]


def main():
    fig, ax = plt.subplots(figsize=(10, 8.5))
    ax.set_xlim(0, 12)
    ax.set_ylim(0.5, len(LAYERS) + 1.6)
    ax.axis("off")

    for i, (lv, name, desc, color) in enumerate(LAYERS):
        y = len(LAYERS) - i
        box = FancyBboxPatch((1.6, y - 0.38), 7.4, 0.76,
                             boxstyle="round,pad=0.04", fc=color, ec="#444", lw=1.1)
        ax.add_patch(box)
        ax.text(1.8, y + 0.13, f"Layer {lv}", fontsize=10, fontweight="bold", color="#333")
        ax.text(3.2, y + 0.13, name, fontsize=12, fontweight="bold")
        ax.text(3.2, y - 0.17, desc, fontsize=9.5, color=_style.GRAY)

    # 左侧：控制栈（如何改变）
    ax.text(0.15, len(LAYERS) + 0.85, "控制栈\n（改变）", fontsize=10, color="#c0392b",
            ha="center", va="top", fontweight="bold")
    ax.annotate("", xy=(1.55, 1.1), xytext=(0.6, len(LAYERS) - 0.2),
                arrowprops=dict(arrowstyle="-|>", color="#c0392b", lw=1.4))
    ax.text(0.35, 2.2, "能\n量\n工\n程", fontsize=9, color="#c0392b", ha="center", va="center")

    # 右侧：测量栈（如何探测）
    ax.text(11.85, len(LAYERS) + 0.85, "测量栈\n（探测）", fontsize=10, color="#2980b9",
            ha="center", va="top", fontweight="bold")
    ax.annotate("", xy=(9.05, 1.1), xytext=(11.2, len(LAYERS) - 0.2),
                arrowprops=dict(arrowstyle="-|>", color="#2980b9", lw=1.4))
    ax.text(11.55, 2.2, "相\n位\n读\n出", fontsize=9, color="#2980b9", ha="center", va="center")

    # Layer 4 的"唯一入口"标注
    ax.text(9.75, 3.0, "Tμν 唯一入口\n（控制通道唯一性定理）", fontsize=9.5,
            color="#27ae60", ha="center", fontweight="bold")

    # 底部注记
    ax.text(6, 0.25, "控制栈：人类在'测量栈'领先、在'控制栈'几乎空白——"
                     "这正是'Gravity is the wrong engineering variable'的含义",
            ha="center", fontsize=9, color=_style.GRAY)

    for ext in ["png", "svg"]:
        fig.savefig(rf"D:\Antigravity\figures\fig02_reality_stack.{ext}")
    print("saved fig02 (png, svg)")


if __name__ == "__main__":
    main()
