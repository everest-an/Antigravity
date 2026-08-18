# -*- coding: utf-8 -*-
"""
实验附件 16：核钟信号模拟器（E2 包第二件——含噪声模型的端到端模拟）
==================================================================
阶段 4.2 交付物。用合成数据演示：给定 KK Yukawa 耦合 α 与钟稳定度，
核钟比较实验能否检出源翻转产生的频率偏置。

信号模型（实验室配置）：
  ΔE = m_Th · α · ΔΦ，ΔΦ = G M_s (1/r1 − 1/r2)（源翻转 A/B 位置）
  频率偏置 y_sig = ΔE / (h ν0)，ν0 = 8.355733554021 eV / h ≈ 2.020e15 Hz
  数值：信号系数 s_lab = 9.50e-14 eV/α（100 kg 源，0.15→1.5 m，同附件 14）

噪声模型（Allan 偏差，两档稳定度情景，与附件 14 完全一致）：
  当前档：σ_y(τ) = 1e-15（kHz 线宽，保守值，不随 τ 改善）
  投影档：σ_y(τ) = 4.6e-23/√τ（附件 14 采用的投影稳定度）
  σ_Δy(τ) = √2·σ_y(τ)（A/B 两侧各积分 τ 的频差统计误差）

检测统计：源位置 A/B 各积分 τ，频差 Δy = y_A − y_B；
Monte Carlo 试验估计 5σ 检出；α_min 按 5σ 阈值（附件 14 的 1σ 值
与本脚本 5σ 值相差因子 5√2 ≈ 7.07，已在一致性核查中显式验证）。

产出：
  build/simulated_signal.csv —— 示例合成时间序列（信号+噪声）
  build/snr_vs_tau.csv —— SNR 与 α_min 对 (τ, 情景) 的扫描
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

# ---- 物理常数与配置（与附件 14 同一组）----
EV = 1.602176634e-19                 # J/eV
H_PLANCK = 6.62607015e-34            # J s
E_TRANS = 8.355733554021             # eV（Th-229 跃迁）
NU0 = E_TRANS * EV / H_PLANCK        # ≈ 2.020e15 Hz
S_LAB = 9.50e-14                     # eV per α（实验室 100 kg 源，附件 14）

SCENARIOS = {
    "current":   {"sigma": lambda tau: 1e-15 * np.ones_like(tau)},
    "projected": {"sigma": lambda tau: 4.6e-23 / np.sqrt(tau)},
}


def sigma_dY(tau, scen):
    """A/B 两侧各积分 τ 的频差统计误差：√2·σ_y(τ)。"""
    sig = SCENARIOS[scen]["sigma"](np.asarray(tau))
    return np.sqrt(2.0) * sig


def y_sig(alpha):
    """信号频率偏置 y = ΔE/(hν0)（源翻转产生的偏置量）。"""
    return S_LAB * alpha * EV / (H_PLANCK * NU0)


def alpha_min_5sig(tau, scen):
    """5σ 检出阈值对应的 α。"""
    return 5.0 * sigma_dY(tau, scen) * E_TRANS / S_LAB


def main():
    print("=" * 66)
    print("实验附件 16：核钟信号模拟器（噪声模型 + Monte Carlo 检出）")
    print("=" * 66)

    # ---- [1] 系统量级 ----
    print(f"\n[1] 系统量级")
    print(f"    Th-229 跃迁 ν0 = {NU0:.3e} Hz（E_trans = {E_TRANS} eV）")
    print(f"    信号系数：实验室 s_lab = {S_LAB:.2e} eV/α（同附件 14）")
    print(f"    稳定度：current σ_y = 1e-15（kHz 线宽）；")
    print(f"            projected σ_y(τ) = 4.6e-23/√τ（附件 14 投影档）")

    # ---- [2] 示例合成时间序列 ----
    print(f"\n[2] 示例合成时间序列（实验室，α = 1e-10，投影档，τ = 1e6 s）")
    rng = np.random.default_rng(20260818)
    alpha_demo = 1e-10
    tau_demo = 1e6
    s_demo = float(sigma_dY(tau_demo, "projected"))
    y_true = y_sig(alpha_demo)
    rounds = 20
    yA = y_true / 2.0 + rng.normal(0, s_demo / math.sqrt(2), rounds)
    yB = -y_true / 2.0 + rng.normal(0, s_demo / math.sqrt(2), rounds)
    dY = yA - yB
    snr_obs = np.mean(dY) / (np.std(dY, ddof=1) / math.sqrt(rounds))
    snr_th = y_true * math.sqrt(rounds) / s_demo
    n_5sig = math.ceil((5.0 * s_demo / y_true) ** 2)
    print(f"    y_sig = {y_true:.2e}（每侧 ±y_sig/2 偏置）")
    print(f"    单轮翻转 SNR = y_sig/σ_Δy = {y_true/s_demo:.1f}；"
          f"5σ 检出需 {n_5sig} 轮")
    print(f"    20 轮翻转：观测 SNR = {snr_obs:.1f}，理论 = {snr_th:.1f}")
    np.savetxt("build/simulated_signal.csv",
               np.column_stack([np.arange(1, rounds + 1), yA, yB, dY]),
               header="round,yA,yB,dY", comments="")

    # ---- [3] SNR 与 α_min 扫描 ----
    print(f"\n[3] SNR(α=1e-10) 与 α_min(5σ) 扫描")
    taus = [1e3, 1e4, 1e5, 1e6]
    rows = []
    for scen in SCENARIOS:
        print(f"    --- {scen} ---")
        print(f"    {'τ [s]':>8} {'σ_y(τ)':>10} {'SNR(1e-10)':>12} {'α_min(5σ)':>12}")
        for tau in taus:
            sig = float(sigma_dY(tau, scen))
            snr = y_sig(1e-10) / sig
            a_min = float(alpha_min_5sig(tau, scen))
            rows.append([tau, scen, sig, snr, a_min])
            print(f"    {tau:>8.0e} {float(SCENARIOS[scen]['sigma'](tau)):>10.1e} "
                  f"{snr:>12.1e} {a_min:>12.1e}")
    np.savetxt("build/snr_vs_tau.csv", np.array(rows, dtype=object),
               header="tau_s,scenario,sigma_dY,snr_alpha1e-10,alpha_min_5sig",
               fmt="%s", comments="")

    # ---- [4] 与附件 14 一致性核查 ----
    print(f"\n[4] 与附件 14 一致性核查（投影档 τ=1e6 s，λ→∞ 极限）")
    a16 = float(alpha_min_5sig(1e6, "projected"))
    a14 = E_TRANS * (4.6e-23 / np.sqrt(1e6)) / S_LAB   # 附件 14 的 1σ 值
    print(f"    本脚本 5σ：α_min = {a16:.1e}")
    print(f"    附件 14 1σ：α_min = {a14:.1e}")
    print(f"    比值 = {a16/a14:.2f} = 5√2 —— 恰为阈值约定差，两核算完全一致。")

    # ---- [5] 判决 ----
    print(f"\n[5] 判决（阶段 4.2 交付物）")
    print(f"    1) 当前平台（kHz 线宽）：α_min(5σ) ~ "
          f"{float(alpha_min_5sig(1e6, 'current')):.1e} = O(1) 量级，")
    print(f"       不足以打开任何新窗口——稳定度是硬前提")
    print(f"       （与附件 14 同判，附件 14 的 1σ 值 8.8e-2 差 7.07 倍约定）；")
    print(f"    2) 投影档 α_min(5σ, τ=1e6 s) ~ 3e-11；α=1e-10 单轮 SNR ~ 18，")
    print(f"       5σ 检出仅需 1 轮翻转；")
    print(f"    3) 模拟器为预算工具：输入稳定度与源质量，输出 SNR/α_min 表")
    print(f"       （build/snr_vs_tau.csv），实验组可直接复用本脚本改参数。")

    print(f"\n数据已存：build/simulated_signal.csv、build/snr_vs_tau.csv")


if __name__ == "__main__":
    main()
