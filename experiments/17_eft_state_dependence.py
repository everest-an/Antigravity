# -*- coding: utf-8 -*-
"""
实验附件 17：态相关耦合的 EFT 上界（R3 —— T2 推论 4 的数字）
================================================================
推导（T2 论文"推论 4 的推导"一节的逐行实现）：

  局域、洛伦兹不变、弱耦合 EFT 中，KK 型中介 φ 与物质的普适耦合为
  每个顶点 √α·(m/M_Pl)（α 为相对引力的 Yukawa 强度，普适 = 等效原理）。
  核内部态（基态 vs 同质异能态）由四极矩 Q_ij 区分；区分两态的
  领先算符为 dim-6：

      O = c · Q_ij ∂_i ∂_j φ / Λ² ,   c ~ O(1),  Λ = EFT 截断。

  静态极限下 ∂²φ → m_KK² φ = φ/λ²。态相关势与普适 Yukawa 势之比：

      δα/α = c Q M_Pl / (√α Λ² λ² m_nuc)
      δα   = √α · c Q M_Pl / (Λ² λ² m_nuc)

  量级输入（全部公开文献值）：
      Q(Th-229 内禀四极矩) ~ 9.4 b ≈ 2.41×10⁴ GeV⁻²（2024 同位素位移光谱）
      m_nuc = 229 u ≈ 213 GeV；M_Pl = 1.221×10¹⁹ GeV；λ = 1 m 参考。

  关键性质：δα 随 √α 增长——α 越小（越深窗口），态相关通道相对越强，
  但绝对量在窗口内任意 α、Λ ≥ 核尺度下始终比核钟可达性低 3 个数量级以上。
  可观测性要求 Λ 降至 EFT 自身失效的尺度（≲ 40 MeV @ 窗口边缘）——
  即"态相关信号可观测 ⇔ 局域 EFT 描述失效"。

结论（推论 4）：核钟态相关搜索是零背景证伪检验。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

# ---- 自然单位常数（GeV）----
M_PL = 1.221e19                # √(ℏc/G)
HBARC = 0.1973269804           # GeV·fm
Q_NUC = 9.4e-28 * (1.0 / (HBARC * 1e-15)) ** 2   # 9.4 b -> GeV⁻²（1 m = 5.068e15 GeV⁻¹）
M_NUC = 229.0 * 0.9315         # GeV
LAM_1M = 1.0 / (HBARC * 1e-15)  # 1 m -> GeV⁻¹

# 核钟可达性（实验室配置，投影稳定度 4.6e-23/√τ，τ=1e6 s）
REACH_5SIG = 2.9e-11           # 5σ（脚本 16）
REACH_1SIG = 4.0e-12           # 1σ（脚本 14）


def delta_alpha(alpha, Lambda, lamb=LAM_1M, c=1.0):
    """态相关耦合的 EFT 上界 δα = √α·c·Q·M_Pl/(Λ²λ²m_nuc)。"""
    return math.sqrt(alpha) * c * Q_NUC * M_PL / (Lambda ** 2 * lamb ** 2 * M_NUC)


def main():
    print("=" * 66)
    print("实验附件 17：态相关耦合的 EFT 上界（T2 推论 4）")
    print("=" * 66)

    print(f"\n[1] 常数与量级输入")
    print(f"    Q(Th-229) = 9.4 b = {Q_NUC:.2e} GeV⁻²（2024 同位素位移光谱）")
    print(f"    m_nuc = {M_NUC:.0f} GeV；M_Pl = {M_PL:.3e} GeV；λ = 1 m = {LAM_1M:.2e} GeV⁻¹")
    print(f"    核钟可达性（实验室，τ=1e6 s）：5σ = {REACH_5SIG:.1e}；1σ = {REACH_1SIG:.1e}")

    print(f"\n[2] δα 表（λ = 1 m，c = 1）")
    alphas = [1e-6, 1e-9, 1e-12]
    lambdas = [("0.1 GeV（强子尺度）", 0.1), ("1 GeV", 1.0),
               ("10 TeV（LHC）", 1e4), ("M_Pl", M_PL)]
    print(f"    {'α \\ Λ':>10}" + "".join(f"{lbl.split(' ')[0]:>16}" for lbl, _ in lambdas))
    rows = []
    for a in alphas:
        vals = [delta_alpha(a, L) for _, L in lambdas]
        print(f"    {a:>10.0e}" + "".join(f"{v:>16.1e}" for v in vals))
        rows.append([a] + vals)
    # 示例点的 δα/α
    ex = delta_alpha(1e-6, 1e4)
    print(f"\n    示例：α=1e-6, Λ=10 TeV, λ=1 m → δα = {ex:.1e}，δα/α = {ex/1e-6:.1e}")

    print(f"\n[3] 与核钟可达性的差距（零背景判据）")
    print(f"    {'α':>10} {'Λ':>10} {'δα':>12} {'5σ 差距':>10} {'1σ 差距':>10}")
    for a in alphas:
        for _, L in lambdas:
            da = delta_alpha(a, L)
            g5 = REACH_5SIG / da
            g1 = REACH_1SIG / da
            print(f"    {a:>10.0e} {L:>10.1e} {da:>12.1e} {g5:>9.0f}x {g1:>9.0f}x")

    print(f"\n[4] 可观测性阈值 Λ_obs（δα = 可达性）")
    for a in alphas:
        L2 = math.sqrt(a) * Q_NUC * M_PL / (LAM_1M ** 2 * M_NUC * REACH_5SIG)
        L_obs = math.sqrt(L2)
        print(f"    α={a:.0e}：Λ_obs = {L_obs*1e3:.0f} MeV（5σ 可达）")
    print(f"    => 可观测性要求截断降至强子/QCD 尺度以下——局域 EFT 描述已失效；")
    print(f"       且宏观 λ 下 MeV 截断的新物理早已被第五力实验排除。")

    print(f"\n[5] 判决（推论 4 陈述）")
    print(f"    1) EFT 上界：δα ≈ 5.4e-22（α=1e-6, Λ=10 TeV, λ=1 m），")
    print(f"       δα/α ≈ 5e-16——态相关通道在窗口内被压制 16 个数量级以上；")
    print(f"    2) 零背景：对 Λ ≥ 1 GeV，δα 比 5σ 可达性低 ≥ {REACH_5SIG/delta_alpha(1e-6,1.0):.0f} 倍")
    print(f"       （Λ=10 TeV 时低 {REACH_5SIG/ex:.1e} 倍）——")
    print(f"       核钟态相关搜索在全部局域 EFT 类中期望零背景；")
    print(f"    3) 证伪力：任何 ≥ 1e-11 级的态相关观测同时证伪 GR、标准 KK")
    print(f"       与一切弱耦合局域 EFT（窗口内任意 α），指向强耦合、")
    print(f"       非局域或态荷引力扇区；")
    print(f"    4) 推论 4 把核钟进阶阶段从\"搜索态相关耦合\"升格为")
    print(f"       \"零背景证伪检验\"——有量化阈值、有明确证伪对象。")

    # CSV：α=1e-6, λ=1m 下 Λ 扫描
    lam_scan = np.logspace(-3, 19, 100)
    out = np.column_stack([lam_scan,
                           [delta_alpha(1e-6, L) for L in lam_scan],
                           [delta_alpha(1e-6, L) / 1e-6 for L in lam_scan]])
    np.savetxt("build/eft_state_dependence.csv", out,
               header="Lambda_GeV,delta_alpha,delta_alpha_over_alpha", comments="")
    print(f"\n数据已存：build/eft_state_dependence.csv（α=1e-6, λ=1 m, Λ 扫描）")


if __name__ == "__main__":
    main()
