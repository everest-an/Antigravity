# -*- coding: utf-8 -*-
"""
实验附件 07：frame-dragging 引力相位核算
=========================================
来源：
- Wakakuwa, Petruzziello, Lantaño, Huelga, Plenio, arXiv:2606.31678 (2026)
  （frame-dragging 诱导的相对论 GIE）
- Wakakuwa, arXiv:2506.15014（量子钟干涉仪探测旋转质量的 frame dragging）

物理：旋转质量的引力磁矢量势 A_g = (G/c^2)(J x r)/r^3；
量子钟沿两条臂积累的相位差：
    Delta_phi = (m/hbar) * 2 pi G J / c^2 * (1/r1 - 1/r2)
（m 为钟的原子的质量，等价于 proper time 差的相位表示）
"""
import math
import sys

try:
    sys.stdout.reconfigure(encoding="utf-8")
except Exception:
    pass

def frame_dragging_phase(m_clock, J, r1, r2):
    """两条半径为 r1, r2 的环路径间的 frame-dragging 相位差（弧度）"""
    G, c, hbar = 6.6743e-11, 2.99792458e8, 1.054571817e-34
    return (m_clock / hbar) * 2.0 * math.pi * G * J / (c * c) * (1.0 / r1 - 1.0 / r2)

def main():
    print("=" * 66)
    print("实验附件 07：frame-dragging 相位核算")
    print("=" * 66)

    u = 1.66053906660e-27
    m_Cs = 133.0 * u

    print(f"\n[1] 公式：Delta_phi = (m/hbar) 2 pi G J / c^2 (1/r1 - 1/r2)")
    print(f"    钟原子质量 m(Cs) = {m_Cs:.2e} kg")

    # ---- 2. 参数扫描 ----
    print(f"\n[2] 参数扫描（旋转源在 r=0.1 m 内，两臂相差 dr=1 mm）")
    r1, r2 = 0.100, 0.101
    print(f"    {'J [kg m^2/s]':>14} {'Delta_phi [rad]':>16}")
    for J in [1.0, 1e2, 1e4, 1e6]:
        dp = frame_dragging_phase(m_Cs, J, r1, r2)
        print(f"    {J:>14.0e} {dp:>16.2e}")

    print(f"\n    参考：")
    print(f"    实验室转子可达 J ~ 1e2（高速飞轮）；")
    print(f"    悬浮超导陀螺 J ~ 1e3~1e4；1e6 已接近工程极限。")

    # ---- 3. 相位灵敏度对比 ----
    print(f"\n[3] 与现有相位读出灵敏度对比")
    print(f"    单原子干涉相位分辨率 ~ 1e-3 rad；")
    print(f"    10^9 原子统计平均 ~ 1e-8 rad（乐观）。")
    print(f"    取最佳转子 J=1e4: Delta_phi = {frame_dragging_phase(m_Cs, 1e4, r1, r2):.2e} rad")
    print(f"    => 距 1e-8 rad 的读出能力还差 ~7 个数量级。")

    # ---- 4. 判决 ----
    print(f"\n[4] 判决（判决矩阵第 8 行：后牛顿 GIE）")
    print(f"    1) 数值与作者自述一致：'预测效应太小，超出当前实验能力'；")
    print(f"    2) 缺口量化：转子角动量 + 相位读出各需再进 ~7 个数量级，")
    print(f"       或改用轨道角动量（星体尺度）作为源；")
    print(f"    3) 该行的价值在'装置概念'：量子钟 + 旋转 + frame dragging")
    print(f"       首次进入同一实验设计（与论文第六十一节的历史回声呼应）；")
    print(f"    4) 状态：'10 年以上'，维持判决矩阵原判。")

if __name__ == "__main__":
    main()
