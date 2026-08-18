# -*- coding: utf-8 -*-
"""
实验附件 18：量子态作为引力检验控制变量的统一零背景定理（E5）
================================================================
把 T2 推论 4 的态相关耦合 EFT 上界推广为覆盖三类态控制检验的统一定理：

统一功率计数（局域、洛伦兹不变、弱耦合 EFT，截断 Λ，c ~ O(1)）：
  δg/g = c · ⟨O_eff⟩ · M_Pl / (√g_eff · Λ² · m_probe)
其中：
  有质量中介（强度 α、力程 λ）：g_eff = α，⟨O_eff⟩ = ⟨O⟩/λ²（∂²φ → φ/λ²）
  无质量引力子（源质量 M、距离 d）：g_eff = 1，⟨O_eff⟩ = ⟨O⟩/(d² M)（势比形式）

三实例：
  A. 核钟态相关搜索（KK 中介）：⟨O⟩ = Q(Th-229) = 9.4 b；→ 推论 4 数字
  B. GIE 内态控制（引力子）：⟨O⟩ = e·a_B（电子内态，保守取大值）
  C. 自旋分辨 frame dragging（引力子）：⟨O⟩ = S ~ 1（核自旋）
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

# ---- 自然单位常数（GeV）----
M_PL = 1.221e19
HBARC = 0.1973269804
GEV_INV_PER_M = 1.0 / (HBARC * 1e-15)   # 1 m = 5.068e15 GeV⁻¹
LAM_1M = GEV_INV_PER_M
ALPHA_EM = 1.0 / 137.035999
E_CHARGE = math.sqrt(4 * math.pi * ALPHA_EM)
M_E = 0.51099895e-3                     # GeV
A_BOHR = 1.0 / (ALPHA_EM * M_E)         # GeV⁻¹

Q_NUC = 9.4e-28 * GEV_INV_PER_M ** 2    # 9.4 b -> GeV⁻²
M_NUC = 229.0 * 0.9315

REACH_5SIG = 2.9e-11                    # 核钟 5σ 可达（实验室，τ=1e6 s）


def massive_bound(alpha, Lambda, lamb, O_eff):
    """有质量中介：δα/α = ⟨O_eff⟩·M_Pl/(√α·Λ²·m_probe)，⟨O_eff⟩ = ⟨O⟩/λ²。"""
    return O_eff * M_PL / (math.sqrt(alpha) * Lambda ** 2 * M_NUC)


def massless_bound(Lambda, d, M_src, O, m_probe):
    """无质量引力子：δG/G = ⟨O⟩·M_Pl²/(Λ²·d²·M_src·m_probe)。"""
    return O * M_PL ** 2 / (Lambda ** 2 * d ** 2 * M_src * m_probe)


def main():
    print("=" * 66)
    print("实验附件 18：量子态作为控制变量的统一零背景定理（E5）")
    print("=" * 66)

    Lambda = 1e4                          # 10 TeV 参考截断

    print(f"\n[1] 统一功率计数（Λ = 10 TeV，c = 1）")
    print(f"    有质量中介：δα/α = ⟨O⟩·M_Pl/(√α·Λ²·λ²·m_probe)")
    print(f"    无质量引力子：δG/G = ⟨O⟩·M_Pl²/(Λ²·d²·M_src·m_probe)")

    # ---- A. 核钟 ----
    print(f"\n[2] A. 核钟态相关搜索（α = 1e-6，λ = 1 m，⟨O⟩ = Q = {Q_NUC:.2e} GeV⁻²）")
    O_eff_A = Q_NUC / LAM_1M ** 2
    da_over_a_A = massive_bound(1e-6, Lambda, LAM_1M, O_eff_A)   # δα/α
    daA = 1e-6 * da_over_a_A                                     # δα（绝对）
    gap_A = REACH_5SIG / daA
    print(f"    δα/α = {da_over_a_A:.1e}；δα = {daA:.1e}")
    print(f"    vs 5σ 可达 {REACH_5SIG:.1e}：零背景间隙 = {gap_A:.1e}（约 "
          f"{math.log10(gap_A):.1f} 个数量级）")

    # ---- B. GIE 内态控制 ----
    print(f"\n[3] B. GIE 内态控制（m = 1e-14 kg，d = 450 μm，⟨O⟩ = e·a_B（保守））")
    m_probe = 1e-14 * 5.61e26             # kg -> GeV
    d_gie = 450e-6 * GEV_INV_PER_M
    O_dipole = E_CHARGE * A_BOHR          # e·a_B ≈ 8.1e4 GeV⁻¹
    dG_B = massless_bound(Lambda, d_gie, m_probe, O_dipole, m_probe)
    # GIE 灵敏度：相位相对读出 ~1e-2（乐观，200 次运行的 3σ 认证）
    sens_B = 1e-2
    gap_B = sens_B / dG_B
    print(f"    ⟨O⟩ = e·a_B = {O_dipole:.1e} GeV⁻¹；δG/G = {dG_B:.1e}")
    print(f"    vs GIE 相位读出灵敏度 δG/G ~ 1e-2：间隙 = {gap_B:.1e}"
          f"（约 {math.log10(gap_B):.1f} 个数量级）")
    # 若用 NV 自旋磁矩 μ_B（更小），间隙更大——结论稳健
    mu_B = 5.7883818e-14                  # GeV⁻¹
    dG_B_spin = massless_bound(Lambda, d_gie, m_probe, mu_B, m_probe)
    print(f"    （若取 NV 自旋磁矩 μ_B = {mu_B:.1e} GeV⁻¹：δG/G = {dG_B_spin:.1e}，")
    print(f"     间隙 {sens_B/dG_B_spin:.1e}——结论对 ⟨O⟩ 的选择稳健）")

    # ---- C. 自旋分辨 frame dragging ----
    print(f"\n[4] C. 自旋分辨 frame dragging（M_src = 1 kg，r = 1 m，⟨O⟩ = S ~ 1）")
    m_src = 5.61e26                       # 1 kg
    r = GEV_INV_PER_M
    dG_C = massless_bound(Lambda, r, m_src, 1.0, M_NUC)
    sens_C = 1e-2                         # 相位读出（保守）
    gap_C = sens_C / dG_C
    print(f"    δG/G = {dG_C:.1e}；vs 相位读出灵敏度 ~1e-2：间隙 = {gap_C:.1e}"
          f"（约 {math.log10(gap_C):.1f} 个数量级）")

    # ---- 汇总 ----
    print(f"\n[5] 统一判决表")
    print(f"    {'检验':<22} {'态区分算符':<14} {'EFT 上界':>12} {'零背景间隙':>14}")
    print(f"    {'核钟态相关':<22} {'Q(9.4 b)':<14} {'δα = ' + f'{daA:.1e}':>12} "
          f"{math.log10(gap_A):>13.1f} orders")
    print(f"    {'GIE 内态控制':<22} {'e·a_B':<14} {'δG/G = ' + f'{dG_B:.1e}':>12} "
          f"{math.log10(gap_B):>13.1f} orders")
    print(f"    {'frame dragging':<22} {'S ~ 1':<14} {'δG/G = ' + f'{dG_C:.1e}':>12} "
          f"{math.log10(gap_C):>13.1f} orders")
    print(f"    => 三类态控制检验在弱耦合局域 EFT 类中全部零背景；")
    print(f"       任何可观测态相关信号同时证伪 GR、标准 KK 与全部局域 EFT。")

    np.savetxt("build/state_resource_gaps.csv",
               np.array([[math.log10(gap_A), math.log10(gap_B), math.log10(gap_C)]]),
               header="gap_orders_nuclear,gie,framedrag", comments="")
    print(f"\n数据已存：build/state_resource_gaps.csv")


if __name__ == "__main__":
    main()
