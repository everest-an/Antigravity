# experiments/ — 实验路线图的数量级核算附件

《从特斯拉到时空工程》第七十六至八十四节（`../实验路线图.md`）的"第一批可执行任务"：
把判决矩阵的每一行变成具体数字。本目录存放可复现的数量级核算脚本。

## 运行

```powershell
py 01_bmv_qgem_sensitivity.py
py 02_gquest_geontropic.py
py 03_wep_pathway.py
py 04_grav_ab_sidebands.py
py 05_kk_nuclear_clock.py
```

仅依赖 Python 标准库（`math`）。所有脚本输出为数量级报告。

## 内容与来源

| 脚本 | 内容 | 主要来源 |
|---|---|---|
| 01 | BMV/QGEM 纠缠相位、3σ 测量次数、真空要求、装置反冲约束（"Apparatus Strikes Back"） | Bose 2017 PRL；Elahi arXiv:2411.02325；Xiang arXiv:2601.06608；Céleri arXiv:2607.08819 |
| 02 | 桌面干涉仪 SQL vs geontropic 涨落两档基准；光子计数读出积分时间 | GQuEST PRX 15, 011034 (2025) |
| 03 | WEP 已实现梯级 + 原子干涉标度律 + 量子算符通道 | CSS 在轨 arXiv:2603.22981；MICROSCOPE 2022；Onofrio PRD 112, 124014 |
| 04 | 引力 AB 边带：调制幅度、边带间距、与经典红移的等价性判读 | Chiao et al. PRD 109, 064073；IJMPD 33, 2441021 |
| 05 | KK 分裂 vs 钍核钟巧合核查：反推所需耦合并对照轨道第五力约束 | Jusufi JCAP 2025, arXiv:2502.07613 |

## 方法论备注

- 全部为**数量级核算**：标度律、参数化模型、最简噪声假设；
- 每个脚本在注释中明确标注假设，输出中区分"已确立数字"与"参数化推演"；
- 目的不是替代原论文的计算，而是给判决矩阵每一行一个可独立复核的"量级锚点"。
