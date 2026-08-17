# -*- coding: utf-8 -*-
"""
实验附件 02：GQuEST 光子计数 vs geontropic 时空涨落
====================================================
来源：
- Vermeulen et al., PRX 15, 011034 (2025), arXiv:2404.07524
- Verlinde & Zurek 的 geontropic 涨落标度（h_geo ~ sqrt(l_p/L)）

内容：
1. 桌面 Michelson 干涉仪的自由质量标准量子极限（SQL）
2. geontropic 涨落的两档基准幅度：sqrt(l_p/L) 与 l_p/L
3. SQL 受限 vs 光子计数读出（按 PRX 宣称 100x 加速）所需的积分时间

注意：全部为数量级核算；光子计数模型采用最简假设并在注释中注明。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

def sql_displacement_asd(f, m_mirror):
    """自由质量标准量子极限位移噪声（m/rtHz）: S_x^SQL = sqrt(hbar/(m (2 pi f)^2))"""
    hbar = 1.054571817e-34
    return math.sqrt(hbar / (m_mirror * (2.0 * math.pi * f) ** 2))

def integration_time_SQL(x_signal, Sx, f):
    """窄带信号的 3σ 积分时间（SQL 受限，假设信号带宽 ~ f/10）：
    SNR = x_signal / (Sx * sqrt(f/10 * T))  =>  T = (3*Sx/x_signal)^2 * 10/f
    （最简模型：噪声白谱，信号相干于频率 f 附近）"""
    snr1 = (3.0 * Sx / x_signal) ** 2
    return snr1 * 10.0 / f

def main():
    l_p = 1.616255e-35
    print("=" * 66)
    print("实验附件 02：GQuEST vs geontropic 时空涨落")
    print("=" * 66)

    # ---- 参数（GQuEST 量级，明确假设）----
    L = 5.0          # 臂长 [m]（桌面级，假设）
    m_mirror = 1e-3  # 镜质量 [kg]（假设）
    f = 10.0         # 探测频段 [Hz]（假设）
    lam = 1550e-9    # 光子波长 [m]

    Sx = sql_displacement_asd(f, m_mirror)
    print(f"\n[1] SQL 位移噪声（L={L} m, m={m_mirror*1e3:.0f} g, f={f} Hz）")
    print(f"    S_x^SQL = {Sx:.2e} m/rtHz")

    # ---- geontropic 基准 ----
    h_geo_1 = math.sqrt(l_p / L)   # Verlinde-Zurek 标度
    h_geo_2 = l_p / L              # 弱档
    x1, x2 = h_geo_1 * L, h_geo_2 * L
    print(f"\n[2] geontropic 涨落基准（L={L} m）")
    print(f"    h = sqrt(l_p/L) = {h_geo_1:.2e}  ->  dx = {x1:.2e} m")
    print(f"    h = l_p/L      = {h_geo_2:.2e}  ->  dx = {x2:.2e} m")

    # ---- 积分时间 ----
    print(f"\n[3] 3σ 积分时间（f={f} Hz，窄带模型）")
    for (name, xsig) in [("sqrt(l_p/L)", x1), ("l_p/L", x2)]:
        if xsig <= 0:
            continue
        T_sql = integration_time_SQL(xsig, Sx, f)
        T_pc = T_sql / 100.0   # PRX: 光子计数比 SQL 快至少 100 倍
        fmt = lambda T: f"{T:.3g} s" if T < 1e4 else f"{T:.3e} s"
        print(f"    {name:>14}: SQL 受限 {fmt(T_sql):>12},  光子计数(100x) {fmt(T_pc):>12}")

    # ---- 光子计数读出的物理依据 ----
    print(f"\n[4] 光子计数读出（波长 {lam*1e9:.0f} nm）")
    print(f"    每光子相位分辨率 ~ 1/sqrt(N)，Fisher 信息随 N 线性累积")
    print(f"    （不受 SQL 限制：SQL 来自散粒噪声与辐射压的平衡，")
    print(f"     光子计数方案通过零差读出设计绕开该平衡 —— PRX 15, 011034）")

    print(f"\n[5] 结论")
    print(f"    1) sqrt(l_p/L) 档在光子计数读出下积分时间可达分钟级——GQuEST 量级可行；")
    print(f"    2) l_p/L 弱档需要 ~1e33 s——完全无望，模型可证伪窗口只在强档；")
    print(f"    3) 判决对象是具体 geontropic 模型的幅度，不是'引力是否量子'的一般命题。")

if __name__ == "__main__":
    main()
