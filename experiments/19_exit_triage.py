# -*- coding: utf-8 -*-
"""
实验附件 19：三个出口的分流协议（E6）
======================================
前提（T2 第五条证伪条款 + E5 统一零背景定理）：若任一态控制实验测得
高于读出灵敏度的态相关信号，则 GR、标准 KK 与一切弱耦合局域 EFT 被证伪，
新物理属于三类出口之一：强耦合扇区（Λ ≲ 43 MeV）、非局域理论、态荷引力扇区。

本脚本给出判别三出口的三个量化观测量与阈值：

[1] 强耦合：形状因子 F(E) ≈ 1/(1+E/Λ)——能标阈结构。判别量：
    R = δα(MeV 级探针)/δα(8.36 eV 探针) 的标度偏离（按 O 算符标度归一后
    应有 ~E/Λ 量级的残差）。r_c = ℏc/Λ ≈ 4.6 fm——空间形状偏离在宏观 r 不可见，
    只能经能量依赖观测。

[2] 非局域：双指数（ghost）谱 V ∝ e^{-r/λ₁} − β·e^{-r/λ₂}。
    判别量：单指数拟合的残差结构与 Δχ²（AIC 判据）；输出最小可检出 β_min。

[3] 态荷：选择定则——δα 对核自旋投影 m 的模式。
    判别量：线性模式 δα ∝ m（自旋荷）vs 常数（普适）vs ∝ m²（四极）。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

HBARC = 197.3269804          # MeV·fm
EV = 1.602176634e-19
E_TRANS = 8.355733554021     # eV
NU0 = E_TRANS * EV / 6.62607015e-34
D_F_PER_ALPHA = 23.0         # Hz per α（实验室，附件 14）

# 投影稳定度（附件 14）
SIGMA_PROJ = lambda tau: 4.6e-23 / np.sqrt(tau)


def freq_resolution(tau):
    """单次测量的频差分辨率 σ_δf = E_trans·σ_y(τ)/h。"""
    return E_TRANS * SIGMA_PROJ(tau) / (6.62607015e-34 / EV)


def main():
    print("=" * 66)
    print("实验附件 19：三个出口的分流协议（E6）")
    print("=" * 66)

    # ---- [1] 强耦合：形状因子与能标阈 ----
    print(f"\n[1] 出口一：强耦合扇区（Λ = 43 MeV）")
    r_c = HBARC / 43.0
    print(f"    空间形状偏离标度 r_c = ℏc/Λ = {r_c:.1f} fm——宏观 r 处不可见；")
    print(f"    能标阈：形状因子 F(E) ≈ 1/(1+E/Λ)，δF ≈ E/Λ")
    probes = [("Th-229 同质异能", 8.36, "eV"), ("U-235 同质异能", 76.7, "eV"),
              ("keV 跃迁探针", 10.0, "keV"), ("MeV 跃迁探针", 1.0, "MeV")]
    for name, E, unit in probes:
        E_MeV = E * (1e-6 if unit == "eV" else 1e-3 if unit == "keV" else 1.0)
        dF = E_MeV / 43.0
        print(f"    {name:<18} E = {E:>8.2f} {unit:<3} → δF ≈ {dF:.1e}")
    print(f"    判别量：多探针 δα 比值偏离 O 算符标度 ~E/Λ——MeV 探针可见 2% 量级。")

    # ---- [2] 非局域：双指数判别 ----
    print(f"\n[2] 出口二：非局域（ghost 双指数谱）")
    lam1, lam2, beta = 0.30, 0.05, 0.10
    alpha_sig = 1e-9
    tau = 1e5
    sigma_df = freq_resolution(tau)
    print(f"    ghost 模型：λ₁={lam1} m，λ₂={lam2} m，β={beta}")
    print(f"    噪声：σ_δf(τ={tau:.0e} s) = {sigma_df:.1e} Hz")

    def fit_pair(r_pts, y_obs, lam_tries):
        """单指数（λ 扫描 + 偏移）最优 χ² 与双指数（真值固定）χ²。"""
        best_chi2 = None
        for lam_try in lam_tries:
            A = np.vstack([np.exp(-r_pts / lam_try),
                           np.ones(len(r_pts))]).T
            coef, *_ = np.linalg.lstsq(A, y_obs, rcond=None)
            chi2 = np.sum((y_obs - A @ coef) ** 2) / sigma_df ** 2
            if best_chi2 is None or chi2 < best_chi2:
                best_chi2 = chi2
        A2 = np.vstack([np.exp(-r_pts / lam1), np.exp(-r_pts / lam2),
                        np.ones(len(r_pts))]).T
        coef2, *_ = np.linalg.lstsq(A2, y_obs, rcond=None)
        chi2_two = np.sum((y_obs - A2 @ coef2) ** 2) / sigma_df ** 2
        return best_chi2, chi2_two

    def beta_min_for(r_pts, lam_tries):
        y_ref = D_F_PER_ALPHA * alpha_sig * np.exp(-r_pts / lam1)
        for beta_try in np.logspace(-4, 0, 60):
            y_t = D_F_PER_ALPHA * alpha_sig * (
                np.exp(-r_pts / lam1) - beta_try * np.exp(-r_pts / lam2))
            c1, c2 = fit_pair(r_pts, y_t, lam_tries)
            if c1 - c2 >= 4.0:
                return beta_try
        return None

    rng = np.random.default_rng(20260819)
    lam_tries = np.linspace(0.2, 0.45, 60)

    # 标准扫描 0.15~0.5 m（设计论文默认近距段）
    r_std = np.linspace(0.15, 0.5, 20)
    y_std = D_F_PER_ALPHA * alpha_sig * (
        np.exp(-r_std / lam1) - beta * np.exp(-r_std / lam2))
    y_obs_std = y_std + rng.normal(0, sigma_df, len(r_std))
    c1s, c2s = fit_pair(r_std, y_obs_std, lam_tries)
    bm_std = beta_min_for(r_std, lam_tries)
    print(f"    标准扫描（0.15~0.5 m）：Δχ² = {c1s-c2s:+.1f}；"
          f"β_min ≈ {'>1（不可见）' if bm_std is None else f'{bm_std:.2f}'}")
    # 扩展近距扫描 0.02~0.5 m（分流协议要求：r 覆盖 λ₂）
    r_ext = np.logspace(math.log10(0.02), math.log10(0.5), 25)
    y_ext = D_F_PER_ALPHA * alpha_sig * (
        np.exp(-r_ext / lam1) - beta * np.exp(-r_ext / lam2))
    y_obs_ext = y_ext + rng.normal(0, sigma_df, len(r_ext))
    c1e, c2e = fit_pair(r_ext, y_obs_ext, lam_tries)
    bm_ext = beta_min_for(r_ext, lam_tries)
    print(f"    扩展近距扫描（0.02~0.5 m）：Δχ² = {c1e-c2e:+.1f}；"
          f"β_min ≈ {'>1' if bm_ext is None else f'{bm_ext:.2f}'}")
    print(f"    判读：第二尺度只在 r < λ₂ 的近距段有形状信息——")
    print(f"    标准扫描对 λ₂=0.05 m 的 β=0.1 混合不可见（Δχ² ≈ 0），")
    print(f"    扩展扫描立即给出强判别。分流协议第 1 步必须含近距扩展。")

    # ---- [3] 态荷：选择定则模式 ----
    print(f"\n[3] 出口三：态荷（自旋荷选择定则）")
    print(f"    Th-229：基态 I=5/2（6 个投影），同质异能态 I=3/2（4 个投影）")
    print(f"    模式矩阵（δα 对 |m| 的依赖，归一化到最大）：")
    print(f"    {'模式':<14} {'|m|=5/2':>8} {'|m|=3/2':>8} {'|m|=1/2':>8} {'判据':<20}")
    m52 = [5 / 2, 3 / 2, 1 / 2]
    patterns = {
        "普适（常数）": [1.0, 1.0, 1.0],
        "自旋荷（∝m）": [1.0, 0.6, 0.2],
        "四极（∝m²）": [1.0, 0.36, 0.04],
    }
    for name, pat in patterns.items():
        print(f"    {name:<14} {pat[0]:>8.2f} {pat[1]:>8.2f} {pat[2]:>8.2f}")
    print(f"    判别量：m 扫描（微波选投影 + 源翻转测量）得到模式，")
    print(f"    三条曲线互不重叠——单次 m 扫描即可判别态荷类型；")
    print(f"    配套：跃迁速率反常（态荷混入 E1 分量）作为正交检验。")

    # ---- [4] 分流协议汇总 ----
    print(f"\n[4] 分流协议（阳性信号后的三步）")
    print(f"    1) 形状拟合（**扩展近距扫描 0.02~0.5 m**）：单指数 vs 双指数")
    print(f"       → 非局域？（Δχ² > 4；λ₂ 形状信息只在 r < λ₂ 的近距段）；")
    print(f"    2) 多探针比值（8.36 eV / 76.7 eV / keV / MeV）：")
    print(f"       比值偏离 O 标度 ~E/Λ → 强耦合；")
    print(f"    3) m 扫描模式：线性/平方/常数 → 态荷类型。")
    print(f"    三步互为正交观测量，一轮实验可同时完成。")

    np.savetxt("build/exit_triage.csv",
               np.array([[c1s, c2s, c1s - c2s, bm_std or -1.0,
                          c1e, c2e, c1e - c2e, bm_ext or -1.0]]),
               header="chi2_1s_std,chi2_2s_std,dchi2_std,beta_min_std,"
                      "chi2_1s_ext,chi2_2s_ext,dchi2_ext,beta_min_ext",
               comments="")
    print(f"\n数据已存：build/exit_triage.csv")


if __name__ == "__main__":
    main()
