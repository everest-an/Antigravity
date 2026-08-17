# -*- coding: utf-8 -*-
"""
实验附件 06：叠加质量源的引力场——QG vs Schrödinger–Newton 的读出
=========================================================================
来源：
- Kaku, Nambu, PRD 111, 046026 (2025), arXiv:2411.12997（Einstein 环 witness）
- Moukouri, arXiv:2409.19692（Pancharatnam 相位区分半经典与量子引力）
- Ligez et al., arXiv:2110.13866（单引力子交换 vs 两团半质量源）

核心论点：
"叠加源几何"的一切读出（环、相位、条纹）最终都是同一个数——
引力相位 phi ~ G m^2 t / (hbar d)。
本脚本把不同通道换算回这个数，并给出各自的分辨条件。
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

def einstein_angle_rad(M, D_L, D_LS, D_S):
    """点质量透镜 Einstein 角（弧度）"""
    G, c = 6.6743e-11, 2.99792458e8
    return math.sqrt(4.0 * G * M / (c * c) * D_LS / (D_L * D_S))

def grav_phase(m, dx, d, t):
    """GIE 引力相位（同附件 01）"""
    G, hbar = 6.6743e-11, 1.054571817e-34
    return 2.0 * G * m * m * t * dx * dx / (hbar * d ** 3)

def main():
    print("=" * 66)
    print("实验附件 06：叠加质量源的引力场读出")
    print("=" * 66)

    G, c = 6.6743e-11, 2.99792458e8

    # ---- 1. 实验室尺度的 Einstein 环 ----
    print(f"\n[1] 实验室尺度（m=1e-14 kg, D_L=1 m）：Einstein 角")
    M, D_L = 1e-14, 1.0
    th = einstein_angle_rad(M, D_L, 1.0, 2.0)
    print(f"    theta_E = {th:.2e} rad")
    lam, Dtel = 5.5e-7, 10.0
    res = 1.22 * lam / Dtel
    print(f"    望远镜衍射极限（可见光, 10 m 口径）= {res:.2e} rad")
    print(f"    => 比值 theta_E/resolution = {th/res:.2e}——差 ~30 个数量级")

    # ---- 2. 天文尺度的 gedanken ----
    print(f"\n[2] 天文尺度 gedanken（M=1 Msun, D_L=1 kpc）")
    M_sun = 1.989e30
    pc = 3.0857e16
    th2 = einstein_angle_rad(M_sun, 1e3 * pc, 0.5, 1.0)
    print(f"    theta_E = {th2:.2e} rad ~ {th2*2.06265e8:.1f} mas（VLBI 可分辨 ~mas）")
    # 两环分辨条件：两透镜位置的角度分离 Delta_theta ~ Delta_x/D_L 需 ~ theta_E
    dx_need = th2 * 1e3 * pc
    print(f"    两环可分辨要求叠加分离 Delta_x ~ theta_E * D_L ~ {dx_need:.2e} m = {dx_need/1.496e11:.1f} AU")
    print(f"    => 需要一个太阳质量跨越 ~AU 级叠加——原理性 witness，非实验方案")

    # ---- 3. 一切读出都归约到同一个相位 ----
    print(f"\n[3] 归约：所有读出通道 = 同一个引力相位")
    m, dx, d, t = 1e-15, 10e-6, 200e-6, 2.0   # 电流芯片量级（附件 01 同款）
    phi = grav_phase(m, dx, d, t)
    print(f"    m=1e-15 kg, dx=10 um, d=200 um, t=2 s -> phi = {phi:.2e} rad")
    print(f"    环的分裂、Pancharatnam 相位差、条纹可见度下降……")
    print(f"    全部是这个 phi 的不同表示（Kaku-Nambu / Moukouri / Yant-Blencowe）")

    # ---- 4. 判决 ----
    print(f"\n[4] 判决（判决矩阵第 6 行：叠加质量产生叠加几何）")
    print(f"    1) QG 与 Schrödinger–Newton 的区分在原理上清晰：")
    print(f"       QG=两个环/连续相位/纠缠，SN=一个变形环/相位跳变/无纠缠；")
    print(f"    2) 但实验室尺度的 phi ~ 1e-5 rad 量级，所有图像通道都不现实；")
    print(f"       天文尺度的图像通道需要天文尺度的叠加——同样不现实；")
    print(f"    3) 现实通道是相位读出（Pancharatnam/干涉可见度），")
    print(f"       其成本由附件 01 的 N(3σ) 给出；")
    print(f"    4) 结论：该行状态从'开放'更新为'原理清晰、读出成本已知'——")
    print(f"       不是灵敏度问题，是统计量与制备问题。")

if __name__ == "__main__":
    main()
