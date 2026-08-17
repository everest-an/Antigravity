# -*- coding: utf-8 -*-
"""
实验附件 04：引力 Aharonov-Bohm 边带核算（卫星方案）
=====================================================
来源：
- Chiao, Inan, Scheibner, Sharping, Singleton, Tobar, PRD 109, 064073 (2024), arXiv:2311.07764
- Chiao, Inan, Singleton, Tobar, IJMPD 33, 2441021 (2024)（时间版 Pound-Rebka）, arXiv:2409.13780

内容：
1. 椭圆轨道上引力势的时间变化 -> 能级边带间距与调制指数
2. 与原子钟/光钟稳定度的对比
3. 明确标注：该调制在数值上等于经典引力红移变化；
   "AB 解读"与"红移解读"的区分是解释问题，不是灵敏度问题。

假设：LEO 近圆轨道、小偏心率；钟的参考为地面对照钟。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

def orbital_params(a, GM=3.986004418e14):
    omega = math.sqrt(GM / a ** 3)
    T = 2.0 * math.pi / omega
    g = GM / a ** 2
    return omega, T, g

def main():
    print("=" * 66)
    print("实验附件 04：引力 AB 边带核算（LEO 卫星）")
    print("=" * 66)

    R_E = 6.371e6
    h_orbit = 400e3
    a = R_E + h_orbit
    e = 0.01
    omega, T_orb, g = orbital_params(a)

    delta_Phi = 2.0 * g * a * e          # 峰值-峰值引力势变化 [m^2/s^2]
    frac_mod = delta_Phi / 2.99792458e8 ** 2   # 分数频率调制幅度 delta nu / nu

    print(f"\n[1] 轨道参数")
    print(f"    高度 h = {h_orbit/1e3:.0f} km, 半长轴 a = {a/1e3:.0f} km, 偏心率 e = {e}")
    print(f"    轨道角频率 omega = {omega:.3e} rad/s,  周期 T = {T_orb:.0f} s")
    print(f"    轨道处 g = {g:.2f} m/s^2")

    print(f"\n[2] 引力势调制")
    print(f"    delta_Phi (峰-峰) = 2 g a e = {delta_Phi:.3e} m^2/s^2")
    print(f"    分数频率调制 delta_nu/nu = delta_Phi/c^2 = {frac_mod:.3e}")
    print(f"    （这正是经典引力红移随轨道位相的变化量）")

    print(f"\n[3] 边带结构（以钟跃迁能量 E0 为载波）")
    hbar = 1.054571817e-34
    hbar_omega_eV = hbar * omega / 1.602176634e-19
    print(f"    边带间距 hbar*omega_orb = {hbar_omega_eV:.3e} eV")

    clocks = [
        ("Cs 微波钟 (9.19 GHz)", 3.81e-5),
        ("Yb/Sr 光晶格钟 (THz)", 2.0),   # ~500 THz -> ~2 eV 量级
    ]
    print(f"    {'钟':<24} {'E0 [eV]':>10} {'delta E [eV]':>12} {'beta(调制指数)':>16}")
    for (name, E0) in clocks:
        dE = E0 * frac_mod
        beta = dE / hbar_omega_eV
        print(f"    {name:<24} {E0:>10.2e} {dE:>12.2e} {beta:>16.1f}")

    print(f"\n[4] 可检测性")
    print(f"    调制频率 = 1/T_orb = {1/T_orb:.2e} Hz（~1.8e-4 Hz）")
    print(f"    探测要求：在 ~{T_orb/3600:.1f} h 时间尺度上分辨 {frac_mod:.1e} 的相对频移")
    print(f"    Cs 钟 1 s 稳定度 ~1e-13 -> 积分 {T_orb:.0f} s 后 ~ {1e-13/math.sqrt(T_orb):.1e}")
    print(f"    光晶格钟 1 s 稳定度 ~1e-16 -> 积分后 ~ {1e-16/math.sqrt(T_orb):.1e}")
    print(f"    => 灵敏度远非瓶颈：任何好钟都能看到这个调制。")

    print(f"\n[5] 关键判读（箭头纪律）")
    print(f"    1) 计算得到的边带/调制在数值上=经典引力红移的轨道变化；")
    print(f"    2) 'AB 解读'的要点是：系统自由下落，局域等效原理屏蔽了引力场，")
    print(f"       但整体位相仍携带势的变化——这是对同一组数字的不同解读；")
    print(f"    3) 因此该实验的真正判决对象不是 GR 本身，")
    print(f"       而是'局域平坦是否足以抹去全部引力信息'这个量子版等效原理命题；")
    print(f"    4) 需要的不是更灵敏的钟，而是与经典红移模型可区分的实验几何。")

if __name__ == "__main__":
    main()
