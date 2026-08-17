# -*- coding: utf-8 -*-
"""
实验附件 05：Kaluza-Klein 引力 AB 分裂 vs 钍核钟——巧合核查
=============================================================
来源：
- Jusufi, Yasser, Battista, Inan, JCAP 2025, arXiv:2502.07613
  （KK 引力通过引力 AB 效应给出原子系统 meV、核系统 eV 量级能级分裂）
- Th-229 核钟：8.355733554021(8) eV（2024 精确测量）

核查问题（实验路线图第八十四节任务 5）：
eV 量级的 KK 分裂恰好落在钍-229 8.355 eV 跃迁附近，这个"巧合"是否值得追？

方法：独立参数化 Yukawa 额外通道，反推产生 eV/meV 分裂所需的耦合强度，
并与太阳系/轨道第五力既有约束对比。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

def required_alpha(dE_target_J, m_system, delta_Phi):
    """产生 dE 所需的额外 Yukawa 耦合（相对 G 的强度）x e^{-r/lambda}
    dE = m * alpha * delta_Phi
    """
    return dE_target_J / (m_system * delta_Phi)

def main():
    print("=" * 66)
    print("实验附件 05：KK 分裂 vs 钍核钟——巧合核查")
    print("=" * 66)

    # 轨道参数（同附件 04）
    GM = 3.986004418e14
    R_E = 6.371e6
    a = R_E + 400e3
    e = 0.01
    g = GM / a ** 2
    delta_Phi = 2.0 * g * a * e   # 1.18e6 m^2/s^2

    print(f"\n[1] 引力势峰-峰变化 delta_Phi = {delta_Phi:.3e} m^2/s^2（LEO, e=0.01）")

    # 系统质量
    u = 1.66053906660e-27
    m_Cs = 133.0 * u
    m_Th = 229.0 * u
    eV = 1.602176634e-19

    print(f"\n[2] 产生宣称分裂所需的额外耦合 alpha_eff = alpha * e^(-r/lambda)")
    print(f"    {'系统':<16} {'宣称分裂':>12} {'所需 alpha_eff':>14}")
    rows = [
        ("Cs 原子", 1e-3 * eV, m_Cs),      # meV
        ("Th-229 核", 1.0 * eV, m_Th),     # eV
    ]
    for (name, dE, m) in rows:
        alpha = required_alpha(dE, m, delta_Phi)
        print(f"    {name:<16} {dE/eV:>10.2e} eV {alpha:>14.2e}")

    print(f"\n[3] 既有约束（轨道尺度 lambda >~ 1e6 m 的 Yukawa 偏离）")
    print(f"    LLR / LAGEOS / 太阳系：|alpha| <~ 1e-8（量级）")
    print(f"    => 产生 eV/meV 分裂所需的 alpha ~ 1e-1 ~ 1e-3，")
    print(f"       被既有轨道检验排除 4~8 个数量级。")

    print(f"\n[4] 钍核钟的实际情况")
    print(f"    Th-229 同质异能态：8.355733554021(8) eV")
    print(f"    已测精度：~1e-11 eV 量级；核钟目标分数稳定度 1e-18 ~ 1e-19")
    print(f"    允许参数空间内的 KK 效应（alpha ~ 1e-8）：")
    dE_Th_allowed = 1e-8 * m_Th * delta_Phi
    dE_Cs_allowed = 1e-8 * m_Cs * delta_Phi
    print(f"    delta_E(Th) ~ {dE_Th_allowed/eV:.2e} eV,  delta_E(Cs) ~ {dE_Cs_allowed/eV:.2e} eV")
    print(f"    => 真正开放的可测窗口在 neV 量级，而非 eV。")

    print(f"\n[5] 判决")
    print(f"    1) 'eV 级 KK 分裂'与 8.355 eV 核跃迁的'巧合'是伪问题：")
    print(f"       eV 窗口已被轨道第五力约束排除 4~8 个数量级；")
    print(f"    2) 若某具体 KK 模型无视约束仍预言 eV 级分裂，")
    print(f"       该模型已被现有数据证伪，无需等核钟；")
    print(f"    3) 核钟在路线图中的真实位置：neV~ueV 窗口的引力红移/AB 相位")
    print(f"       检验与短程 Yukawa 修正——那里才是唯一未封死的空间；")
    print(f"    4) 本核查演示了判决矩阵的方法论价值：")
    print(f"       一个'巧合'经两行计算就从'值得追'变为'已闭合'。")

if __name__ == "__main__":
    main()
