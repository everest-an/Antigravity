# figures/ — 投稿用图

判决矩阵与论文核心结构的可视化。全部由脚本生成（可复现），
输出 PNG（预览）+ SVG（矢量，投稿格式）。

## 生成

```powershell
py 01_decision_matrix.py
py 02_reality_stack.py
py 03_rt_mincut.py
py 04_fifth_force.py
py 05_gie_discrimination.py
```

依赖：matplotlib；fig03 调用 simulations/05、07，fig05 需 QuTiP。

## 图清单

| 图 | 内容 | 数据来源 |
|---|---|---|
| fig01 决策矩阵 | 19 个箭头按判决状态分布（不成立/成立/B/C） | 实验路线图.md 第 83 节 |
| fig02 Reality Stack | 七层栈 + 控制栈/测量栈 + T̂ 唯一入口标注 | 核心命题-形式化.md §2 |
| fig03 RT 极小面 | S₂ vs mincut·lnχ，两种独立实现互验 | simulations/05、07 |
| fig04 第五力全景 | α–λ 约束阶梯 + KK 需求点 + 开放窗口 | experiments/08、05 |
| fig05 GIE 歧视 | (a) 三模型负度 vs φ；(b) CV 收敛 ∝ e^(−2α²) | simulations/01、06 |

## 字体与渲染备注

- 中文字体：Microsoft YaHei（系统自带，无需安装）；
- 算子记号 T̂ 用 mathtext（$\hat{T}$）渲染以规避组合变音符的字体缺失；
- 已规避 ⟨⟩、⇒、₂ 等缺字问题（用 〈〉、→、S2 替代）。
