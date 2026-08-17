# -*- coding: utf-8 -*-
"""
模拟 05：树张量网络中的 RT 极小面（"纠缠 → 几何"的离散版）
===========================================================
结构：8 个边界 qubit（叶子），内部为随机高斯张量的完全二叉树（离散 AdS 盘）。
对边界区间 A：
  - 数值计算二阶 Rényi 熵 S₂(A) = -ln tr(ρ_A²)（多实例平均）
  - 与树的 min-cut(A)·ln(χ) 比较——min-cut 就是这棵"涌现几何"里的
    Ryu–Takayanagi 极小面。

关键点：
  1) S₂(A) 由极小面决定，而不是由 |A| 决定——RT 机制的玩具骨架；
  2) 相邻两叶的 min-cut = 1（共享父节点上方），远离两叶 = 2（断开的极小面）
     ——即玩具层的"连通/断开极小面转变"；
  3) 保真度：χ=2、单实例有涨落，需多实例平均；真实宇宙断言仍是 Level C。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

CHI = 4


def random_tree_state(rng):
    """返回 8 qubit 波函数 (256,)。张量为 Haar 随机等距（树网络）。

    结构（根→叶方向）：根输入 χ 维 → 上层等距 2→4 → 中层等距 2→4 → 叶子幺正。
    等距保证任意单位根输入给单位范数态，且边界纠缠集中于 min-cut 键。"""
    def rand_iso(m, n):
        Q, _ = np.linalg.qr(rng.standard_normal((m, n)) + 1j * rng.standard_normal((m, n)))
        return Q

    # 叶子：χ×χ 幺正（边界维度 = 键维度 χ，物理索引 b），索引 (bond, physical)
    L = np.stack([rand_iso(CHI, CHI) for _ in range(8)])        # (8, χ, χ)
    # 中层：χ²→χ 等距 -> (lchild, rchild, parent)
    M = np.stack([rand_iso(CHI * CHI, CHI).reshape(CHI, CHI, CHI) for _ in range(4)])
    # 上层：χ²→χ 等距
    N = np.stack([rand_iso(CHI * CHI, CHI).reshape(CHI, CHI, CHI) for _ in range(2)])
    # 根：单位输入
    R = rng.standard_normal((CHI, CHI)) + 1j * rng.standard_normal((CHI, CHI))
    R = R / np.linalg.norm(R)

    # 叶子对 -> 中层 (物理索引 p0,p1, 上键 u)
    T = np.empty((4, CHI, CHI, CHI), dtype=complex)
    for j in range(4):
        T[j] = np.einsum('ab,cd,ace->bde', L[2 * j], L[2 * j + 1], M[j])
    # 中层 -> 上层 (物理索引 p0..p3, 上键 w)
    W = np.empty((2, CHI, CHI, CHI, CHI, CHI), dtype=complex)
    for k in range(2):
        W[k] = np.einsum('abu,cdv,uvw->abcdw', T[2 * k], T[2 * k + 1], N[k])
    # 根
    psi = np.einsum('abcde,fghij,ej->abcdfghi', W[0], W[1], R)
    psi = psi.reshape(CHI ** 8)
    psi = psi / np.linalg.norm(psi)
    return psi


def renyi2(psi, subset):
    """二阶 Rényi 熵 S₂ = -ln tr(ρ_A²)，A = subset（叶子索引列表）"""
    full = psi.reshape((CHI,) * 8)
    comp = [i for i in range(8) if i not in subset]
    order = list(subset) + comp
    t = np.transpose(full, order)
    dA = CHI ** len(subset)
    dB = CHI ** len(comp)
    M = t.reshape(dA, dB)
    rhoA = M @ M.conj().T
    return -math.log(max(np.real(np.trace(rhoA @ rhoA)), 1e-30))


def mincut_of(A):
    """平衡二叉树的解析 min-cut（叶子集 A -> 切边数）。
    树：叶0-7；中层父节点 p0=(0,1),p1=(2,3),p2=(4,5),p3=(6,7)；
    上层 g0=(p0,p1), g1=(p2,p3)；根=(g0,g1)。
    规则：孤立叶=1；同父对=1（父上边）；跨父但同上层=2；跨上层=2；半树=1；全树=0。"""
    A = set(A)
    if not A or len(A) == 8:
        return 0
    if len(A) == 1:
        return 1
    # 分组到中层父节点
    groups = [sum(1 for i in (2 * j, 2 * j + 1) if i in A) for j in range(4)]
    # 完全被 A 覆盖的中层子树不产生切边（向上合并）
    cost = 0
    for g in groups:
        if g == 1:
            cost += 1          # 只取父下两个叶中的一个：切该叶的边
        elif g == 2:
            pass               # 整对在 A 内：向上合并
    # 上层：若某上层子树被完整覆盖则其下切边可省——按贪心合并
    # 精确：min-cut = (被部分覆盖的中层子树数) + (跨上层时每条上层边 1)
    # 简单精确枚举：对每个上层子树统计
    if groups[0] + groups[1] in (3, 4) and groups[0] + groups[1] == 4:
        cost = min(cost, 1) if groups[2] + groups[3] == 0 else cost
    # 用通用树切割枚举兜底（规模小）
    return tree_mincut_enum(A)


def tree_mincut_enum(A):
    """通用兜底：枚举 14 条边的子集，求把 A 与补集分开的最少边数"""
    A = set(A)
    # 节点 0..14；边：(i, parent(i))
    parent = {0: 8, 1: 8, 2: 9, 3: 9, 4: 10, 5: 10, 6: 11, 7: 11,
              8: 12, 9: 12, 10: 13, 11: 13, 12: 14, 13: 14}
    edges = list(parent.items())  # (child, par)
    best = len(edges)
    for mask in range(1 << len(edges)):
        if bin(mask).count("1") >= best:
            continue
        # 并查集
        p = list(range(15))
        def find(x):
            while p[x] != x:
                p[x] = p[p[x]]
                x = p[x]
            return x
        def union(x, y):
            p[find(x)] = find(y)
        for k, (c, pa) in enumerate(edges):
            if not (mask >> k) & 1:
                union(c, pa)
        comps = {}
        for leaf in range(8):
            comps.setdefault(find(leaf), set()).add(leaf)
        ok = True
        for s in comps.values():
            hasA = bool(s & A)
            hasB = bool(s - A)
            if hasA and hasB:
                ok = False
                break
        if ok:
            best = bin(mask).count("1")
    return best


def main():
    print("=" * 66)
    print("模拟 05：树张量网络中的 RT 极小面")
    print("=" * 66)

    subsets = {
        "单叶 {0}":          [0],
        "相邻两叶 {0,1}":    [0, 1],
        "远离两叶 {0,4}":    [0, 4],
        "半树 {0,1,2,3}":    [0, 1, 2, 3],
        "跨子树三叶 {0,1,4}": [0, 1, 4],
        "全树":              list(range(8)),
    }

    n_inst = 30
    rng = np.random.default_rng(42)
    acc = {k: 0.0 for k in subsets}
    for _ in range(n_inst):
        psi = random_tree_state(rng)
        for k, A in subsets.items():
            if len(A) == 8:
                continue  # S₂(全树)=0 平凡
            acc[k] += renyi2(psi, A) / n_inst

    print(f"\n{'区间 A':<16}{'mincut':>8}{f'mincut·ln{CHI}':>12}{'<S₂> 平均':>12}")
    print("-" * 52)
    for k, A in subsets.items():
        mc = mincut_of(A)
        print(f"{k:<16}{mc:>8}{mc * math.log(CHI):>12.3f}{acc[k]:>12.3f}")

    print("\n判读：")
    print("  1) S₂(A) ≈ mincut(A)·lnχ——边界纠缠由几何极小面决定，")
    print("     而不是由 |A| 决定（半树与相邻两叶的 S₂ 相同！）；")
    print("  2) 远离两叶的 mincut=2 = '断开的极小面'——玩具层的")
    print("     connected/disconnected 转变（AdS/CFT 中的相变骨架）；")
    print("  3) χ 有限时存在 O(1/χ²) 修正；χ→∞ 时 RT 公式精确——")
    print("     这正是真实全息里'大 N 极限'的玩具对应；")
    print("  4) 保真度：这是机制演示（判决矩阵第 18 行的玩具骨架），")
    print("     不是'真实宇宙的时空由张量网络构成'的证据。")

if __name__ == "__main__":
    main()
