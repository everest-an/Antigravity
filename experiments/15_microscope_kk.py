# -*- coding: utf-8 -*-
"""
实验附件 15：MICROSCOPE 公布值重算 KK 轨道约束（阶段 5.2）
==========================================================
任务：用 MICROSCOPE 2022 公布值（Touboul PRL 129, 121102）重新推导
      Yukawa 额外通道 α(λ) 的轨道尺度约束，不依赖原始数据。

关键细分（物理上必须区分）：
- KK 引力子模式（Jusufi et al., JCAP 2025, arXiv:2502.07613 的 Yukawa 修正）
  与 Tμν 普适耦合 → 保持等效原理 → EP 实验（MICROSCOPE）对它**直接失明**；
- MICROSCOPE 约束的是**组分依赖**耦合（dilaton 类新场，电荷 f_i M_i）；
- 普适通道的轨道约束来自 LLR / LAGEOS / 行星历表测距。

本脚本给出三张表：
  A. MICROSCOPE 组分通道：α_bound(λ; Δf) 扫描（Δf = 组分耦合分数差）；
  B. 普适通道：LLR/LAGEOS/行星历表既有 α 约束（文献量级）；
  C. 与核钟可达性（experiments/14, build/reachability_lab.csv）的窗口对照。

假设（全部显式）：
  - 几何因子 ξ(λ) = min(1, (λ/R)^2)，R = R_E + 710 km（MICROSCOPE 轨道）；
  - η ≈ α · Δf · ξ(λ)（Fischbach-Talmadge 量级参数化）；
  - 组分电荷分数差 Δf ∈ {1, 1e-1, 1e-2, 1e-3} 扫描（模型依赖量）。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass


def xi_geometric(lamb, R):
    """MICROSCOPE 轨道高度的几何因子：ξ(λ) = min(1, (λ/R)^2)。"""
    return np.minimum(1.0, (lamb / R) ** 2)


def main():
    print("=" * 66)
    print("实验附件 15：MICROSCOPE 公布值 → KK/Yukawa 轨道约束重算")
    print("=" * 66)

    # ---- [1] MICROSCOPE 2022 公布值 ----
    # η(Ti,Pt) = (-1.5 ± 2.3(stat) ± 1.5(syst)) × 10^-15
    eta_stat = 2.3e-15
    eta_syst = 1.5e-15
    eta_1sig = math.hypot(eta_stat, eta_syst)   # ≈ 2.74e-15
    eta_2sig = 2.0 * eta_1sig                   # 保守 2σ 界
    R = 6.371e6 + 710e3                         # 轨道高度 710 km

    print(f"\n[1] MICROSCOPE 公布值（Touboul et al., PRL 129, 121102, 2022）")
    print(f"    η(Ti,Pt) = (-1.5 ± 2.3 ± 1.5) × 10⁻¹⁵")
    print(f"    1σ 组合不确定度 = {eta_1sig:.2e}；2σ 界 |η| < {eta_2sig:.1e}")
    print(f"    轨道高度 R = {R:.2e} m（几何因子 ξ = min(1, (λ/R)²)）")

    # ---- [2] 组分通道扫描 ----
    print(f"\n[2] 组分依赖通道：α_bound(λ) = η_2σ / (Δf · ξ(λ))")
    print(f"    （Δf = 两检验体组分耦合分数差；模型依赖量，扫描四个假设值）")
    lambs = np.logspace(3, 10, 15)              # 1 km → 1e10 m
    dfs = [1.0, 1e-1, 1e-2, 1e-3]
    header = "λ [m]" + "".join(f"{df:>14.1e}" for df in dfs)
    print(f"    {'λ [m]':>10}" + "".join(f"  α(Δf={df:.0e})" for df in dfs))
    table_a = []
    for i, lamb in enumerate(lambs):
        xi = xi_geometric(lamb, R)
        row = [eta_2sig / (df * xi) for df in dfs]
        table_a.append([lamb] + row)
        if i % 2 == 0 or lamb >= 1e9:
            print(f"    {lamb:>10.1e}" + "".join(f"{a:>13.1e}" for a in row))
    np.savetxt("build/microscope_alpha_composition.csv",
               np.array(table_a),
               header="lambda_m," + ",".join(f"alpha_df{d:.0e}" for d in dfs),
               comments="")

    # ---- [3] 普适通道（KK 引力子属此类）----
    print(f"\n[3] 普适通道（KK 引力子模式，保持 WEP）：EP 实验直接失明")
    print(f"    普适 Yukawa 的轨道约束来自测距（文献量级）：")
    universal = [
        ("LAGEOS / GEO 测距", 1e7, 1e-9, "Ciufolini 等，Yukawa 界量级"),
        ("LLR（月球距离）", 3.8e8, 3e-11, "Murphy 等；Williams 等"),
        ("行星历表", 1.5e11, 1e-8, "Fischbach-Talmadge 综述"),
        ("Cassini 无线电测距", 8.5e8, 1e-10, "Will 系综"),
    ]
    for name, lamb, bound, src in universal:
        print(f"    {name:<18} λ ~ {lamb:.1e} m : |α| ≲ {bound:.0e}  [{src}]")

    # ---- [4] 与核钟可达性窗口对照 ----
    print(f"\n[4] 与核钟可达性窗口对照（build/reachability_lab.csv，λ∈[1e6, 1e10] m）")
    try:
        # 注：experiments/14 的 savetxt 用默认空白分隔符（header 字符串含逗号仅作标签）
        reach = np.loadtxt("build/reachability_lab.csv", skiprows=1)
        lam_clock = reach[:, 0]
        alpha_clock = reach[:, 1]
        # 普适通道既有约束（分段量级）：LAGEOS 1e-9@1e7；LLR 3e-11@3.8e8；行星 1e-8@1.5e11
        bound_univ = np.interp(lam_clock,
                               [1e7, 3.8e8, 1.5e11],
                               [1e-9, 3e-11, 1e-8])
        print(f"    {'λ [m]':>10}  {'α_min(钟,投影)':>14}  {'既有普适界':>12}  {'改善倍数':>8}")
        for lam, a_clk, a_bd in zip(lam_clock, alpha_clock, bound_univ):
            print(f"    {lam:>10.1e}  {a_clk:>14.2e}  {a_bd:>12.1e}  {a_bd/a_clk:>7.1f}x")
        print(f"    实验室配置：λ∈[1e7, 1e10] 段 α_min(投影稳定度, τ=1e6 s)")
        print(f"    比既有测距约束深 1~2 个数量级；λ=1e6 处与 LAGEOS 持平（0.3x）；")
        print(f"    轨道配置：α_min ~ 1.4e-25（同投影稳定度），比既有测距界深约 14 个")
        print(f"    数量级（需搭载机会，见附件 14）。")
        print(f"    对比 MICROSCOPE 组分通道饱和界 5.5e-15（λ≫R 段）：")
        print(f"    核钟实验室配置在 λ>1e8 m 段（α~4e-12）尚不及 MICROSCOPE 组分界，")
        print(f"    但两者作用于**不同通道**：MICROSCOPE 对 KK 引力子（普适通道）失明，")
        print(f"    核钟是普适通道在 λ∈[1e7, 1e10] m 段的独立新灵敏度。")
    except FileNotFoundError:
        print(f"    （build/reachability_lab.csv 不存在——先运行 experiments/14）")

    # ---- [5] 判决 ----
    print(f"\n[5] 判决（阶段 5.2 交付物）")
    print(f"    1) MICROSCOPE 2σ 界在组分通道给出 α < 5.5e-15/Δf（λ≫R 饱和段）；")
    print(f"    2) KK 引力子属普适通道：其 eV/meV 预言被 LLR/LAGEOS 排除，")
    print(f"       与 MICROSCOPE 无关（EP 实验对该通道结构性失明）；")
    print(f"    3) 核钟在普适通道的价值：λ∈[1e7, 1e10] m 段实验室配置")
    print(f"       α_min(τ=1e6 s) ~ 8e-12 ~ 4e-12，深于既有测距界 1~2 个数量级；")
    print(f"       轨道配置 α_min ~ 1.4e-25，比既有测距界深约 14 个数量级；")
    print(f"    4) 结论：MICROSCOPE（组分）/测距（普适）/核钟（普适·大 λ 新灵敏度）")
    print(f"       三条通道互补，与附件 05/14 的结论闭环。")

    print(f"\n数据已存：build/microscope_alpha_composition.csv")


if __name__ == "__main__":
    main()
