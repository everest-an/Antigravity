# -*- coding: utf-8 -*-
"""
实验附件 12：单引力子 bolometric 探测的量级核算（判决矩阵第 16 行）
============================================================
问题：谐振四极探测器要"逐个"分辨引力子，需要什么条件？

两笔账：
  (1) 热账：探测器热声子数 N_th = k_B T / (ħ ω)；要分辨单个引力子
      沉积的能量 ħω，须 N_th ≲ 1，即 T ≲ ħω/k_B。
  (2) 截面账：Weber 杆对单引力子的吸收截面 σ ~ (G/c) M Q ...（量级：
      引力子与杆的耦合效率极低），单个引力子平均等待时间
      τ ~ 1/(F σ)，F 为引力子通量。

判决：单引力子 bolometry 需要 μK 以下温度 + 天文级通量，
与判决矩阵"10 年+"一致；可行替代是"统计噪声探测"（对称关联检验，
Athulya-Manikandan 2026）而非单粒子计数。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

KB = 1.380649e-23
HBAR = 1.054571817e-34
G = 6.6743e-11
C = 2.99792458e8


def thermal_phonons(T, f):
    return KB * T / (HBAR * 2 * math.pi * f)


def graviton_absorption_cross_section(M, f, l):
    """Weber 杆单引力子吸收截面（量级：σ ~ (32π/15)(G/c^4) M ω^2 l^2 的简化形）
    采用 Dyson/Braginsky 量级论证：σ ~ G M l^2 ω^2 / c^4 型。"""
    omega = 2 * math.pi * f
    return (G / C ** 4) * M * l * l * omega * omega


def main():
    print("=" * 66)
    print("实验附件 12：单引力子 bolometric 探测（第 16 行）")
    print("=" * 66)

    f = 1e3          # 1 kHz 谐振杆
    omega = 2 * math.pi * f

    print(f"\n[1] 热账：T 需满足 k_B T ≲ ħω")
    print(f"    ħω = {HBAR*omega:.2e} J = {HBAR*omega/1.602e-19:.2e} eV")
    print(f"    {'温度':>12} {'热声子数 N_th':>14}")
    for T in [300.0, 1.0, 1e-3, 1e-6, 1e-9]:
        print(f"    {T:>12.0e} K  {thermal_phonons(T, f):>14.2e}")
    print(f"    => 单引力子分辨率要求 T ≲ {HBAR*omega/KB:.2e} K（微开尔文以下）")

    print(f"\n[2] 截面账：M = 1000 kg、l = 1 m 的杆")
    M, l = 1e3, 1.0
    sigma = graviton_absorption_cross_section(M, f, l)
    print(f"    σ ~ {sigma:.2e} m²")
    # 引力子通量：假设 1 个引力子穿过探测器截面（极端乐观）
    F = 1.0 / (l * l)  # 1 引力子/m²/s
    tau = 1.0 / (F * sigma)
    print(f"    通量 F = 1 引力子/m²/s（乐观假设）→ 平均等待时间 τ = {tau:.2e} s")
    print(f"    以年计：{tau/(365.25*86400):.2e} 年")

    print(f"\n[3] 判决（第 16 行）")
    print(f"    1) 单引力子 bolometry 需 μK 温度 + 天文级通量，")
    print(f"       与判决矩阵'10 年+'一致；")
    print(f"    2) 现实路径是统计噪声探测：对称关联检验")
    print(f"       （Athulya-Manikandan 2026）与 GQuEST 型涨落探测；")
    print(f"    3) 本行维持 C 级、10 年+ 的原判，量级依据在此给出。")

if __name__ == "__main__":
    main()
