# -*- coding: utf-8 -*-
"""
实验附件 03：弱等效原理（WEP）检验路径核算
==========================================
来源：
- Zhang et al., arXiv:2603.22981（中国空间站在轨原子干涉 WEP）
- MICROSCOPE 最终结果（PRL 129, 121102 (2022)）
- Onofrio, Smith, Viola, PRD 112, 124014 (2025), arXiv:2512.06333（WEP 算符化）

内容：
1. 已实现梯级：CSS 在轨 -> MICROSCOPE -> 扭秤/LLR
2. 原子干涉仪 WEP 灵敏度的标度律（LMT、自由下落时间、统计量）
3. 量子算符通道（加速度算符方差）的参数化灵敏度

注意：标度律为参数化模型，用于展示"到 10^-15/10^-17 需要什么"。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

def atom_wep_sensitivity(n_lmt, T, N_at, N_meas, g=9.8):
    """
    原子干涉 WEP 灵敏度（参数化）：
    phase = n_lmt * k_eff * g * T^2 / (eta 差分), shot noise = 1/sqrt(N_at)
    eta ~ 1/(n_lmt * k_eff * g * T^2 * sqrt(N_at * N_meas))
    k_eff = 2*pi/(852nm) 取 Rb。
    """
    lam = 852e-9
    k_eff = 2.0 * math.pi / lam * n_lmt
    return 1.0 / (k_eff * g * T ** 2 * math.sqrt(N_at * N_meas))

def quantum_operator_wep(torque_noise, coherence_time, N_meas, I_eff=1e-9, omega=0.1):
    """
    量子算符通道（Onofrio 2025）参数化：
    测量角加速度算符方差中的 WEP 违反信号；
    信号 ~ (eta^2) 依赖相干时间 tau_c，噪声 ~ torque_noise/sqrt(N_meas)。
    返回：以 eta 计的 3σ 灵敏度（量级估计，明确假设）。
    """
    # 信号：相干叠加造成的加速度方差贡献 ~ eta^2 * g^2 * (tau_c/T_tb)^2 类标度
    # 此处采用最简单的参数化：灵敏度 ~ torque_noise/(I_eff * omega^2) * 1/sqrt(N_meas)
    return 3.0 * torque_noise / (I_eff * omega ** 2 * math.sqrt(N_meas))

def main():
    print("=" * 66)
    print("实验附件 03：WEP 检验路径核算")
    print("=" * 66)

    print(f"\n[1] 已实现梯级（Eotvos 参数 eta = Delta a / g）")
    ladder = [
        ("CSS 在轨原子干涉（2026）",      "eta ~ (-3.1±4.6)e-7（不确定度 2.8e-8）"),
        ("MICROSCOPE 卫星（2022 终版）",  "eta(Ti,Pt) = [-1.5±2.3(stat)±1.5(syst)]e-15"),
        ("扭秤（Eot-Wash）",              "eta ~ 1e-13"),
        ("月球激光测距（LLR）",           "eta ~ 1e-13"),
    ]
    for (name, val) in ladder:
        print(f"    {name:<32} {val}")

    print(f"\n[2] 原子干涉理想散粒下限：eta ~ 1/(n k_eff g T^2 sqrt(N_at N_meas))")
    print(f"    （注意：这是散粒噪声下限；CSS 实际 2.8e-8 与理想值的差距")
    print(f"     即系统误差主导——'换平台'的实质是把系统误差压下去）")
    print(f"    {'n_LMT':>6} {'T [s]':>6} {'N_at':>8} {'N_meas':>10} {'eta_ideal':>12}")
    cases = [
        (10,    1.0, 1e6, 1e6),    # 当前 CSS 量级（演示）
        (100,   2.0, 1e8, 1e8),    # 长基线/LMT 升级
        (1000, 10.0, 1e8, 1e10),   # 未来空间任务量级（STE-QUEST 类）
    ]
    for (n, T, Na, Nm) in cases:
        eta = atom_wep_sensitivity(n, T, Na, Nm)
        print(f"    {n:6d} {T:6.1f} {Na:8.0e} {Nm:10.0e} {eta:12.2e}")

    print(f"\n[3] 量子算符通道（Onofrio 2025，参数化量级）")
    # 假设：扭矩噪声 1e-15 N m/rtHz（扭秤级）、有效惯量 1e-9 kg m^2、角频率 0.1 rad/s
    for (tq, Nm) in [(1e-15, 1e6), (1e-17, 1e8)]:
        eta_q = quantum_operator_wep(tq, 0.1, Nm)
        print(f"    torque_noise={tq:.0e} Nm/rtHz, N={Nm:.0e} -> eta(3σ) ~ {eta_q:.2e}")

    print(f"\n[4] 结论")
    print(f"    1) 从 1e-7 到 1e-15：已靠'换平台'完成（在轨 + 卫星差分）；")
    print(f"    2) 散粒噪声从来不是瓶颈（理想下限远低于已实现精度）；")
    print(f"       瓶颈是系统误差：CSS 的 2.8e-8 与 MICROSCOPE 的 1e-15")
    print(f"       之间的差距全部来自系统效应控制；")
    print(f"    3) 到 1e-17 需 LMT n~1000、T~10 s 并把系统误差压到同一水平；")
    print(f"    4) 量子算符通道的价值不在精度，而在'新轴'：")
    print(f"       它检验惯性/引力质量作为算符的相干结构，而非经典均值相等性。")

if __name__ == "__main__":
    main()
