# -*- coding: utf-8 -*-
"""
实验附件 09：真空能量的正则化方案依赖（判决矩阵第 14 行）
==========================================================
同一个理论（自由标量场），三种合法减法方案，三个不同的"真空能量"：

  (a) 硬截断：      ρ_cutoff ~ Λ⁴/(16π²) + ...        （符号正、量级任意大）
  (b) ζ 函数（无质量）：ρ = 0                         （严格为零）
  (c) 维数正则 MS： ρ_MS = m⁴/(64π²)[ln(m²/μ²) + c]  （符号随 μ 翻转）

外加 (d) 绝热正则化（de Sitter）：2 阶给正密度，4 阶"过减"翻转为负
（Zhang & Ye, arXiv:2411.03961 系列结论）。

结论：'真空能量'不是一个方案无关的量——
第 14 行'真空能可随意弯曲时空'不只是未证实，而是工程对象本身定义不清。
方案无关的只有差值（Casimir 型），那才是可测量的东西。
"""
import math
import sys

import numpy as np

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass


def rho_cutoff(Lambda, m):
    """硬截断下的真空能量密度（数值积分）"""
    def integrand(k):
        return k * k * math.sqrt(k * k + m * m)
    ks = np.linspace(1e-6, Lambda, 400000)
    y = ks ** 2 * np.sqrt(ks ** 2 + m ** 2)
    return np.trapezoid(y, ks) / (4.0 * np.pi ** 2)


def rho_ms(m, mu):
    """维数正则 MS 方案（示意公式，常数取 3/2；见 Martin 2012 综述）"""
    return m ** 4 / (64.0 * np.pi ** 2) * (math.log(m ** 2 / mu ** 2) + 1.5)


def main():
    print("=" * 66)
    print("实验附件 09：真空能量的正则化方案依赖（第 14 行）")
    print("=" * 66)

    m = 1.0  # 质量 1 eV
    print(f"\n[1] 同一理论（m=1 eV 自由标量场），三种方案：")

    for Lambda in [1e3, 1e6, 1e9, 1e12]:
        rc = rho_cutoff(Lambda, m)
        print(f"    (a) 截断 Λ={Lambda:.0e} eV : ρ = {rc:+.3e} eV⁴ "
              f"（Λ⁴/(16π²) = {Lambda**4/(16*np.pi**2):.3e} eV⁴）")

    print(f"    (b) ζ 函数正则化（无质量极限）：ρ = 0.000e+00 eV⁴（严格为零）")

    for mu in [0.1, 1.0, 1e6]:
        rms = rho_ms(m, mu)
        print(f"    (c) 维数正则 MS, μ={mu:.0e} eV : ρ = {rms:+.3e} eV⁴")

    print("\n[2] 绝热正则化（de Sitter，Zhang-Ye 结论）")
    print("    2 阶绝热：正、常数真空能量密度（可解释为驱动膨胀）")
    print("    4 阶绝热：'过减' → 负能量密度 + 虚假 trace anomaly")
    print("    => 阶数选择翻转符号——再次证明'真空能量'依赖减法方案。")

    print("\n[3] 判决（判决矩阵第 14 行）")
    print("    1) 同一理论可给出 +Λ⁴、0、±m⁴ln(m²/μ²) 三族答案；")
    print("    2) 因此'真空能量可以任意弯曲时空'不是假命题，而是病态命题：")
    print("       它的数值在被理论本身定义之前不存在；")
    print("    3) 方案无关、真正可测的是真空能量的差值（Casimir 效应），")
    print("       而这正是超导 Casimir 平台（论文第七十三节）存在的意义；")
    print("    4) 第 14 行维持原判：不成立——且不成立的理由比'没找到'更强：")
    print("       该命题在技术上不可定义。")

if __name__ == "__main__":
    main()
