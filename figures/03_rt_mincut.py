# -*- coding: utf-8 -*-
"""
图 3：RT 极小面互验（模拟 05 手写树 vs 模拟 07 quimb MERA）
x = mincut·lnχ（理论 RT 值），y = ⟨S₂⟩；对角线 = 精确 RT。
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

# 直接调用模拟 05/07 的核心函数（同种子，可复现）
import importlib.util


def load(script, name):
    spec = importlib.util.spec_from_file_location(name, script)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


sim05 = load(str(SIM / "05_tensor_network_rt.py"), "sim05")
sim07 = load(str(SIM / "07_mera_rt.py"), "sim07")

INTERVALS = [
    ("单叶 {0}", [0]),
    ("相邻两叶 {0,1}", [0, 1]),
    ("远离两叶 {0,4}", [0, 4]),
    ("半树 {0,1,2,3}", [0, 1, 2, 3]),
    ("跨子树三叶 {0,1,4}", [0, 1, 4]),
]


def main():
    rng05 = np.random.default_rng(42)
    rng07 = np.random.default_rng(7)

    # 模拟 05（χ=4）
    acc05 = {k: 0.0 for k, _ in INTERVALS}
    for _ in range(30):
        psi = sim05.random_tree_state(rng05)
        for k, A in INTERVALS:
            acc05[k] += sim05.renyi2(psi, A) / 30
    # 模拟 07（χ=2）
    acc07 = {k: 0.0 for k, _ in INTERVALS}
    for _ in range(40):
        full = sim07.mera_boundary_state(rng07)
        for k, A in INTERVALS:
            acc07[k] += sim07.renyi2(full, A) / 40

    fig, ax = plt.subplots(figsize=(7.5, 6))
    xs, ys5, ys7, labels = [], [], [], []
    for (k, A) in INTERVALS:
        xs.append(sim05.mincut_of(A) * math.log(4))
        ys5.append(acc05[k])
        ys7.append(sim07.mincut_of(A) * math.log(2) / (math.log(4) / math.log(2)))
        # 把 07 的 χ=2 结果按 χ 归一化到"每边熵单位"
        xs7 = sim07.mincut_of(A) * math.log(2)
        ys7[-1] = acc07[k] * (math.log(4) / math.log(2)) / 1.0
        # 简化：07 用 x = mincut·ln2，y 原值，单独画右轴不必要——直接归一化到 ln4 单位
        ys7[-1] = acc07[k] * (math.log(4) / math.log(2))
        labels.append(k)

    xs = np.array(xs)
    ys5 = np.array(ys5)
    ys7 = np.array([acc07[k] * (math.log(4) / math.log(2)) for (k, A) in INTERVALS])
    x07 = np.array([sim07.mincut_of(A) * math.log(4) for (k, A) in INTERVALS])

    ax.scatter(xs, ys5, s=70, color="#2980b9", label="模拟 05（手写树, χ=4）", zorder=3)
    ax.scatter(x07, ys7, s=70, marker="s", facecolors="none", edgecolors="#8e44ad",
               label="模拟 07（quimb MERA, χ=2→归一化）", zorder=3)

    for x, y, lab in zip(xs, ys5, labels):
        ax.annotate(lab, (x, y), xytext=(6, 8), textcoords="offset points",
                    fontsize=8, color=_style.GRAY)

    lim = max(xs.max(), ys5.max(), ys7.max()) * 1.15
    ax.plot([0, lim], [0, lim], "--", color="#c0392b", lw=1.4,
            label="精确 RT（大 χ 极限）：S = mincut·lnχ")
    ax.set_xlim(0, lim)
    ax.set_ylim(0, lim)
    ax.set_xlabel("mincut(A) · lnχ（离散极小面面积）", fontsize=11)
    ax.set_ylabel("〈S2(A)〉", fontsize=11)
    ax.set_title("纠缠熵 = 极小面：两种独立实现的互验", fontsize=12)
    ax.legend(fontsize=9, frameon=False)
    ax.grid(alpha=0.25)

    for ext in ["png", "svg"]:
        fig.savefig(FIG / f"fig03_rt_mincut.{ext}")
    print("saved fig03 (png, svg)")


if __name__ == "__main__":
    main()
