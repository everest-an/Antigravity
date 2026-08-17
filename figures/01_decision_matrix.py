# -*- coding: utf-8 -*-
"""
图 1：判决矩阵可视化（19 行）
x 轴：证据等级/判决位置（不成立 | 成立/已确立 | B | C）
y 轴：19 个箭头（按组排序）
颜色：判决状态
"""
import sys

sys.path.insert(0, r"D:\Antigravity\figures")
import _style  # noqa: F401
import matplotlib.pyplot as plt

ROWS = [
    # (编号, 名称, x分类, 判决对象摘要)
    (3,  "EM 场 → 引力（转换式统一）", "false", "Schwinger 极限核算"),
    (5,  r"$\hat{T}_{\mu\nu}$ 作为量子几何源", "false", "MEP + PN 一致性"),
    (9,  "ICO → 量子时空",            "false", "QC-QC 定理"),
    (14, "真空能可随意弯曲时空",       "false", "正则化方案依赖"),
    (1,  "电与磁统一",                "true",  "Maxwell / 相对论"),
    (2,  "电弱统一",                  "true",  "BEH 机制"),
    (17, "惯性工程 = Tμν 工程",       "true",  "控制通道唯一性定理"),
    (4,  "double copy 本体论",        "B",     "不可直接判决"),
    (6,  "叠加质量 → 叠加几何",       "B",     "QGEM / 相位读出"),
    (7,  "GIE 见证非经典引力",        "B",     "LOCC 排除"),
    (19, "LIV / GUP（Planck 对称破缺）", "B",  "GRB/LLR/核钟"),
    (8,  "后牛顿 GIE（frame dragging）", "C",  "缺口 ~7 个数量级"),
    (10, "因果结构量子化",            "C",     "10 年+"),
    (11, "量子 WEP",                  "B",     "系统误差主导"),
    (12, "KK 额外维度",               "C",     "neV 窗口"),
    (13, "屏蔽第五力",                "false", "边界已量化"),
    (15, "geontropic 时空涨落",       "C",     "仅强档可证伪"),
    (16, "引力子量子噪声",            "C",     "bolometric 10 年+"),
    (18, "纠缠 → 几何（真实宇宙）",    "C",     "无近期通道"),
]

XPOS = {"false": 1, "true": 2, "B": 3, "C": 4}
XTICK = {1: "不成立\n(已排除)", 2: "成立 / 已确立\n(A 级)", 3: "B 级\n(数学对应/原理清晰)", 4: "C 级\n(候选/远期)"}


def main():
    fig, ax = plt.subplots(figsize=(11, 9.5))

    # 按 x 分类排序（同组内保持编号顺序）
    rows_sorted = sorted(ROWS, key=lambda r: (XPOS[r[2]], r[0]))
    for i, (num, name, cat, note) in enumerate(rows_sorted):
        y = len(rows_sorted) - i
        x = XPOS[cat]
        ax.scatter(x, y, s=170, color=_style.COLORS[cat], zorder=3,
                   edgecolors="white", linewidths=1.2)
        # 行号与名称
        ax.text(0.55, y, f"{num:>2}", ha="right", va="center", fontsize=9,
                color=_style.GRAY, fontweight="bold")
        ax.text(0.7, y, name, ha="left", va="center", fontsize=10.5)
        # 判决对象（右侧小字）
        ax.text(4.55, y, note, ha="left", va="center", fontsize=8.5, color=_style.GRAY)

    ax.set_xlim(0.2, 6.6)
    ax.set_ylim(0.5, len(rows_sorted) + 0.5)
    ax.set_xticks(list(XTICK.keys()))
    ax.set_xticklabels([XTICK[k] for k in XTICK], fontsize=9)
    ax.set_yticks([])
    for yv in ax.get_yticklabels():
        yv.set_visible(False)
    ax.spines[["top", "right", "left"]].set_visible(False)
    ax.grid(axis="y", alpha=0.25, zorder=0)

    # 图例
    for key, lab in [("false", "不成立（已判）"), ("true", "成立 / 已确立"),
                     ("B", "B 级"), ("C", "C 级")]:
        ax.scatter([], [], s=110, color=_style.COLORS[key], label=lab)
    ax.legend(loc="lower right", fontsize=9, frameon=False, ncol=4,
              bbox_to_anchor=(1.0, -0.14))

    ax.set_title("判决矩阵：19 个「统一/反重力」箭头的当前状态（2026-08）", fontsize=13, pad=12)
    ax.text(0.62, -0.05, "每行携带：判决通道 + 判决对象 + 时间尺度（详见 实验路线图.md）",
            transform=ax.transAxes, fontsize=8.5, color=_style.GRAY)

    for ext in ["png", "svg"]:
        fig.savefig(rf"D:\Antigravity\figures\fig01_decision_matrix.{ext}")
    print("saved fig01 (png, svg)")


if __name__ == "__main__":
    main()
