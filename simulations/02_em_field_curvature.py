# -*- coding: utf-8 -*-
"""
模拟 02：电磁场的引力效应（判决矩阵第 3/17 行——"Tesla 线圈"判决）
==================================================================
线性化 GR 的牛顿极限：

    ∇²Φ = (4πG/c²) (T00 + Txx + Tyy + Tzz)

对静态电磁场：T00 = ρ_E,  沿场方向 p∥ = -ρ_E,  垂直方向 p⊥ = +ρ_E
=> 有效源 = (ρ - ρ + ρ + ρ)/c² = 2ρ_E/c²

即：**电磁场产生的引力是其能量密度的两倍**（压强也进入 Tμν）。
这正是论文第十二节"关键变量是压力"的直接数值演示。

数值：FFT 求解泊松方程，输出电容器的引力势/引力场，并与地球重力比较。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

G = 6.6743e-11
C = 2.99792458e8
EPS0 = 8.8541878128e-12


def poisson_fft(rho, dx):
    """FFT 求解 ∇²Φ = rho，周期边界。返回 Φ。"""
    kx = np.fft.fftfreq(rho.shape[0], dx) * 2 * np.pi
    ky = np.fft.fftfreq(rho.shape[1], dx) * 2 * np.pi
    kz = np.fft.fftfreq(rho.shape[2], dx) * 2 * np.pi
    K2 = kx[:, None, None] ** 2 + ky[None, :, None] ** 2 + kz[None, None, :] ** 2
    K2[0, 0, 0] = 1.0  # 零模暂置
    f_rho = np.fft.fftn(rho)
    f_phi = -f_rho / K2
    f_phi[0, 0, 0] = 0.0  # 去掉零模（孤立源假设）
    return np.real(np.fft.ifftn(f_phi))


def capacitor_source(n, dx, plate_sep, plate_radius, E_field):
    """平行板电容器的有效引力源 (T00+Σp)/c² = 2ρ_E/c²"""
    rho_E = 0.5 * EPS0 * E_field ** 2          # J/m³
    src = np.zeros((n, n, n))
    c = n // 2
    dz = int(plate_sep / dx / 2)
    rad = plate_radius / dx
    for i in range(n):
        for j in range(n):
            r2 = (i - c) ** 2 + (j - c) ** 2
            if r2 <= rad * rad:
                src[i, j, c - dz: c + dz] = 2.0 * rho_E / C ** 2
    return src


def main():
    print("=" * 66)
    print("模拟 02：电磁场的引力效应（Tesla 线圈判决）")
    print("=" * 66)

    # ---- 参数：一个极端的 1 m³ 电容器 ----
    n, L = 64, 4.0
    dx = L / n
    plate_sep, plate_radius = 1.0, 0.5      # 1 m 间隙, 0.5 m 半径
    E = 1e7                                 # 10 MV/m（接近击穿的极端场强）

    rho_E = 0.5 * EPS0 * E * E
    print(f"\n[1] 电磁场能量密度 rho_E = ε₀E²/2 = {rho_E:.1f} J/m³")
    print(f"    等效质量密度（含压强因子2）= 2ρ_E/c² = {2*rho_E/C**2:.2e} kg/m³")

    src = capacitor_source(n, dx, plate_sep, plate_radius, E)
    print(f"\n[2] FFT 求解 ∇²Φ = 8πG ρ_E/c²（{n}³ 网格, L={L} m）...")
    phi = poisson_fft(4.0 * np.pi * G * src, dx)

    # 中心轴上的引力场 g = -dΦ/dz
    c = n // 2
    axis = phi[c, c, :]
    gz = -np.gradient(axis, dx)
    g_max = np.max(np.abs(gz))
    print(f"    电容器附近最大引力场 g_max = {g_max:.2e} m/s²")

    # 距源 1 m 处
    idx1 = c + int(1.0 / dx)
    g1 = abs(gz[idx1]) if idx1 < n else float('nan')
    print(f"    距源 1 m 处 g ≈ {g1:.2e} m/s²")

    print(f"\n[3] 对照表")
    g_earth = 9.81
    print(f"    地球表面重力          g = {g_earth:.2e} m/s²")
    print(f"    10 MV/m · 1 m³ 电容器  g ~ {g_max:.2e} m/s²  (比值 {g_max/g_earth:.2e})")
    # Tesla 线圈量级：10 kV/m, 1 m³
    g_tesla = g_max * (1e4 / 1e7) ** 2
    print(f"    Tesla 线圈量级(10kV/m) g ~ {g_tesla:.2e} m/s²  (比值 {g_tesla/g_earth:.2e})")

    # 反推：悬浮 1 kg 需要多大的场
    rho_need = (g_earth / (8.0 * np.pi * G)) * C ** 2  # 需要 8πGρ_eff = g_earth/L_char 量级，取 1m 特征尺度
    E_need = math.sqrt(2 * rho_need / EPS0)
    print(f"\n[4] 反推：要在 1 m 尺度产生地球级引力，需要能量密度 ~ {rho_need:.2e} J/m³")
    print(f"    对应电场 E ~ {E_need:.2e} V/m")
    print(f"    （量子电动力学 Schwinger 极限 E_S = 1.3e18 V/m，")
    print(f"     该需求是 Schwinger 极限的 {E_need/1.32e18:.2e} 倍）")

    print(f"\n[5] 判决（判决矩阵第 3/17 行）")
    print(f"    1) 电磁场确实产生引力——Tμν 里既有能量又有压强；")
    print(f"    2) 且其引力源是能量密度的 2 倍（压强贡献，论文第十二节）；")
    print(f"    3) 但数值上：1 m³ 的 10 MV/m 场只产生 ~1e-25 m/s² 的引力；")
    print(f"    4) 要产生地球级引力需要场强达到 Schwinger 极限的 ~8 倍——")
    print(f"       该极限处真空本身已不稳定（自发产生正负电子对），")
    print(f"       到那时你制造的是物质，而不是'反重力'；")
    print(f"    5) 转换式统一（EM→gravity 工程）在此闭合。")

if __name__ == "__main__":
    main()
