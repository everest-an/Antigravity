# -*- coding: utf-8 -*-
"""figures 共用样式：中文字体 + 尺寸规范。"""
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt

plt.rcParams["font.sans-serif"] = ["Microsoft YaHei", "SimHei", "SimSun"]
plt.rcParams["axes.unicode_minus"] = False
plt.rcParams["figure.dpi"] = 150
plt.rcParams["savefig.bbox"] = "tight"

GRAY = "#666666"
COLORS = {
    "false": "#c0392b",      # 不成立（红）
    "true": "#27ae60",       # 成立/已确立（绿）
    "B": "#2980b9",          # B 级（蓝）
    "C": "#8e44ad",          # C 级（紫）
}
