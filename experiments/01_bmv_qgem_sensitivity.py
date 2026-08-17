# -*- coding: utf-8 -*-
"""
实验附件 01：BMV/QGEM 灵敏度核算
=================================
来源：
- Bose et al., PRL 119, 240401 (2017)：纠缠相位公式与基准参数
- Elahi et al., arXiv:2411.02325（微芯片反磁阱）
- Xiang et al., arXiv:2601.06608（电流芯片方案）
- Céleri, Soares-Pinto, Turolla Vanzella, arXiv:2607.08819（装置反冲约束）

内容：
1. 双质量叠加的牛顿纠缠相位 φ 与 concurrence C = |sin φ|
2. 3σ 认证所需测量次数 N
3. 气体碰撞退相干率（压力→真空要求）
4. "Apparatus Strikes Back"：装置反冲对叠加分离 d 的普遍约束

注意：全部为数量级核算；噪声模型采用最简假设并在注释中注明。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

def bmv_phase(m, dx, d, t):
    """Newtonian entanglement phase, d >> dx.
    phi = 2 G m^2 t dx^2 / (hbar d^3)
    """
    G = 6.6743e-11
    hbar = 1.054571817e-34
    return 2.0 * G * m * m * t * dx * dx / (hbar * d ** 3)

def runs_for_3sigma(phi, eta=1.0):
    """极简假设：每次测量以投影效率 eta 读出 |sin phi| 信号，
    需 3σ 区分于可分态。N ~ (3/sin(phi))^2 / eta。
    （假设无系统噪声；实际需按 witness 完整统计，见 Riera-Campeny 2026）"""
    if abs(math.sin(phi)) < 1e-12:
        return float('inf')
    return (3.0 / abs(math.sin(phi))) ** 2 / eta

def gas_decoherence_rate(P_mbar, R_nm, T_env=300.0):
    """稀薄气体碰撞退相干率（每粒子）。
    Gamma = n * sigma * v_bar, n = P/(kB T), sigma = pi R^2。
    假设每个碰撞粒子都携带动量~h/R 的相位信息（上限估计）。"""
    kB = 1.380649e-23
    u = 1.66053906660e-27      # 平均空气分子 ~28 u
    m_gas = 28.0 * u
    P = P_mbar * 100.0          # mbar -> Pa
    n = P / (kB * T_env)
    R = R_nm * 1e-9
    sigma = math.pi * R * R
    v_bar = math.sqrt(3.0 * kB * T_env / m_gas)
    return n * sigma * v_bar

def apparatus_recoil_bound_dmax(m, M, T):
    """Céleri et al. (2026)：装置反冲位移 x_M = m*d/M 必须小于装置质心热相干长度
    lambda = h / sqrt(M kB T)，否则叠加被装置质心自由度"偷走"。
    => d_max = (h/m) * sqrt(M / (kB T))
    刚性锚定到实验室（M -> 无穷）时约束解除；自由漂浮平台受此约束。"""
    h = 6.62607015e-34
    kB = 1.380649e-23
    return (h / m) * math.sqrt(M / (kB * T))

def main():
    G = 6.6743e-11
    print("=" * 66)
    print("实验附件 01：BMV/QGEM 灵敏度核算")
    print("=" * 66)

    # ---- 1. 基准校验：Bose et al. 2017 ----
    m, dx, d, t = 1e-14, 250e-6, 450e-6, 2.5
    phi = bmv_phase(m, dx, d, t)
    C = abs(math.sin(phi))
    print(f"\n[1] 基准校验（Bose 2017: m=10^-14 kg, dx=250 um, d=450 um, t=2.5 s）")
    print(f"    纠缠相位 phi = {phi:.3f} rad")
    print(f"    concurrence C = |sin phi| = {C:.3f}")
    print(f"    => 与文献量级一致（~0.2 rad）" if 0.1 < phi < 0.4 else
          f"    => 注意：与文献量级存在偏差，检查参数")

    # ---- 2. 参数扫描 ----
    print(f"\n[2] 参数扫描（电流芯片方案，Xiang 2026 量级）")
    print(f"    {'m [kg]':>12} {'dx':>8} {'d':>8} {'t [s]':>7} {'phi':>8} {'C':>8} {'N(3σ)':>12}")
    cases = [
        (1e-15, 1e-6,  100e-6, 2.0),
        (1e-15, 10e-6, 200e-6, 2.0),
        (1e-16, 10e-6, 100e-6, 1.0),
        (1e-17, 1e-6,  50e-6,  1.0),
        (1e-18, 1e-6,  20e-6,  0.5),
    ]
    for (mm, xx, dd, tt) in cases:
        p = bmv_phase(mm, xx, dd, tt)
        cc = abs(math.sin(p))
        n = runs_for_3sigma(p)
        n_str = f"{n:.2e}" if n != float('inf') else "inf"
        p_str = f"{p:.4f}" if abs(p) >= 1e-3 else f"{p:.2e}"
        print(f"    {mm:12.0e} {xx*1e6:7.2f}u {dd*1e6:7.1f}u {tt:7.1f} "
              f"{p_str:>8} {cc:8.2e} {n_str:>12}")

    # ---- 3. 真空要求 ----
    print(f"\n[3] 气体退相干率 vs 压力（R=100 nm, T=300 K）")
    for P in [1e-6, 1e-9, 1e-12, 1e-15]:
        g = gas_decoherence_rate(P, 100.0)
        tau = 1.0 / g if g > 0 else float('inf')
        tau_str = f"{tau:.1f} s" if tau >= 1.0 else f"{tau:.2e} s"
        print(f"    P = {P:.0e} mbar : Gamma = {g:.2e} Hz,  相干时间 ~ {tau_str}")
    print("    => QGEM 需要 1e-12 ~ 1e-15 mbar 量级真空（与 Elahi 2024 一致）")

    # ---- 4. Apparatus Strikes Back ----
    print(f"\n[4] 装置反冲约束 d_max = (h/m)*sqrt(M/(kB T))（Céleri 2026）")
    print(f"    {'m [kg]':>12} {'M [kg]':>10} {'T [K]':>8} {'d_max':>12}")
    rows = [
        (1e-14, 1.0,   1.0),   # 桌面, 1kg 装置, 1K
        (1e-14, 100.0, 10.0),  # 桌面, 100kg 光学平台, 10K
        (1e-16, 100.0, 10.0),
        (1.66e-18, 1000.0, 4.0),  # MAQRO 级: 10^9 u 粒子, 吨级航天器, 4K
        (1.66e-18, 1.0, 1.0),     # 自由漂浮内部构件: 1kg, 1K
    ]
    for (mm, MM, TT) in rows:
        dm = apparatus_recoil_bound_dmax(mm, MM, TT)
        print(f"    {mm:12.0e} {MM:10.1f} {TT:8.1f} {dm:12.2e} m ({dm*1e6:.1f} um)")

    print(f"\n[5] 结论")
    print(f"    1) 基准参数（Bose 2017）下纠缠相位 ~0.2 rad，与文献一致；")
    print(f"       该参数下 3σ 认证只需 ~200 次测量（理想投影假设）；")
    print(f"    2) 但电流芯片方案的可实现参数（m~1e-15 kg, dx~1-10 um）")
    print(f"       相位只有 1e-6~1e-5 rad，需要 1e9~1e21 次测量——")
    print(f"       这正是 GIE 难做的真正原因，也是 reservoir-engineered")
    print(f"       方案（Tang 2025）与更大质量/分离路线存在的理由；")
    print(f"    3) 刚性锚定的地面实验不受装置反冲约束；")
    print(f"    4) 自由漂浮平台（MAQRO 级）的装置反冲约束落在 ~100 um 量级，")
    print(f"       与目标叠加分离同量级——'Apparatus Strikes Back' 是真实的。")

if __name__ == "__main__":
    main()
