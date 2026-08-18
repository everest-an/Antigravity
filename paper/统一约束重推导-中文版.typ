#set page(paper: "a4", margin: (x: 2.2cm, y: 2.4cm), numbering: "1 / 1")
#set text(font: ("New Computer Modern", "Noto Serif SC"), size: 10.5pt, lang: "zh")
#set par(justify: true, first-line-indent: 2em, leading: 0.8em)
#set heading(numbering: "1.1.1")
#show heading.where(level: 1): it => [
  #v(0.6em)
  #text(size: 14pt, weight: "bold")[#it.body]
  #v(0.4em)
  #line(length: 100%, stroke: 0.6pt)
  #v(0.6em)
]
#show heading.where(level: 2): it => [
  #v(0.4em)
  #text(size: 12pt, weight: "bold")[#it.body]
  #v(0.3em)
]
#set math.equation(numbering: "(1)")
#set figure(placement: top)
#show figure: set block(above: 1em, below: 1.2em)
#show table: set text(size: 8.5pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[统一约束重推导：二十一条引力边界的单一框架]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · E1 论文（配合仓库 github.com/everest-an/Antigravity）]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　本文在单一框架内重新推导量子引力前沿的二十一条实验约束。方法论纪律：*一条边界，一个脚本*——每条约束对应仓库中一份可执行计算，边界值可直接复核。约束按四个证据等级组织：已证伪（四条：电磁-引力转换的 Schwinger 极限边界、期望值源的混合态等效原理排除、不定因果序的 QC-QC 定理、真空能量的正则化依赖）；已确立（三条：电磁与电弱统一、惯性工程与应力能量工程的同一性）；A 级实验事实（四条）；活跃的 B/C 级约束（十条，含 GIE 相位、第五力全景、frame dragging 缺口、KK 窗口、geontropic 可证伪区间、LIV 界）。三条代表性推导在正文给出（Schwinger 反推、KK 信号反解、GIE 相位），三条逻辑条目（double copy 本体论、ICO、控制通道定理）以文档化形式收录。本文的产物是方法论的：一张每行都可独立复核的约束表，以及支撑它的计算基础设施。

*关键词*　量子引力；约束；可复现性；判决矩阵；第五力；等效原理
]

#pagebreak()

= 方法论：一条边界，一个脚本

量子引力唯象约束的传统呈现方式是零散的：每条约束使用各自的几何、各自的近似、各自的记法。本文的纪律是相反的：*所有二十一条边界在同一个框架（线性化引力 + 有效参数化）内重新推导，每条边界绑定一个可执行脚本*。由此获得三项收益：(1) 边界值可被任何读者独立复核；(2) 更新一条边界的输入（如核钟稳定度新值）自动传播到全部关联表；(3) 各约束的相对强弱可以直接比较，因为它们的输入假设被显式化。

约束清单见表 1。证据等级沿用 Level A-D 体系；脚本列给出仓库内文件名。

#figure(
  table(
    columns: (0.4fr, 2.2fr, 1.3fr, 1.9fr, 1.4fr),
    align: (left, left, left, left, left),
    [*行*], [*命题*], [*等级*], [*边界（量级）*], [*脚本*],
    [1-2], [电磁/电弱统一], [A], [电弱 ~100 GeV 收敛；GUT 三线擦肩], [experiments/10],
    [3], [电磁→引力转换], [已证伪], [需 $8 times E_"Schwinger"$], [simulations/02],
    [4], [double copy 本体论], [B], [逻辑条目], [文档],
    [5], [$angle hat(T)_("μν") angle$ 源], [已证伪], [MEP 违反（数值复现）], [experiments/11],
    [6-7], [GIE 见证], [B], [$phi = 0.217 "rad"$（基准）], [simulations/01,06],
    [8], [后牛顿 GIE], [C], [差 ~7 个数量级], [experiments/07, simulations/04],
    [9], [ICO→量子时空], [已证伪], [逻辑条目], [文档],
    [11], [量子 WEP], [B], [散粒下限远低于实测], [experiments/03],
    [12], [KK 额外维], [C], [eV 关，neV 开], [experiments/05],
    [13], [第五力], [已证伪（O(1)）], [α 边界随 λ 的阶梯], [experiments/08],
    [14], [真空工程], [已证伪], [正则化依赖（符号翻转）], [experiments/09],
    [15], [geontropic], [C], [强档 0.03 s / 弱档 10³³ s], [experiments/02],
    [16], [引力子噪声], [C], [μK 温度门槛], [experiments/12],
    [17], [惯性工程=Tμν], [分类陈述], [逻辑条目（定理）], [文档],
    [18], [纠缠→几何], [C], [$S_2 approx "mincut" dot ln chi$], [simulations/03,05,07],
    [19], [LIV/GUP], [B], [$E_("QG",1) > 1 times 10^19 "GeV"$（单事件）], [experiments/13],
    [20], [相干源假设], [B], [$phi$ 杠杆，量级已知], [simulations/01,06],
    [20b], [KK neV 窗口], [C], [α_min 可达性表], [experiments/05,14],
  ),
  caption: [表 1：二十一条约束清单。全部脚本可在仓库以单一入口运行（test_all.py）。]
)

= 代表性推导一：Schwinger 反推

电磁场引力效应的判决在原理层完成。以电磁能量密度为源反解泊松方程（因子 2 记录压强内容），

$ E_"needed" = sqrt((2 rho_"needed") / epsilon_0), quad rho_"needed" = (g c^2) / (8 pi G L), $ <eq-schwinger>

对 $g = 9.8 "m/s"^2$、$L = 1 "m"$ 给出 $E_"needed" approx 1.1 times 10^19 "V/m"$，为 Schwinger 极限 $1.3 times 10^18 "V/m"$ 的约八倍。该处真空对正负电子对产生不稳定，转换式纲领在此关闭——*不是技术不可达，而是原理不可行*。

= 代表性推导二：KK 信号反解

额外紧致维的最轻模式给出 Yukawa 修正 $V = -(G m_1 m_2/r)(1+alpha e^(-r/lambda))$，绕引力体自由下落的核系统获得分裂

$ Delta E = m_"sys" alpha Delta Phi. $ <eq-ab>

对钍核在低地球轨道（$e = 0.01$）：$Delta Phi approx 2 g a e approx 1.18 times 10^6 "m"^2/"s"^2$，故 $Delta E approx 2.8 alpha "eV"$。eV 级分裂需 $alpha approx 0.4$，被轨道约束排除 7-8 个数量级；meV 级需 $alpha approx 10^(-3)$，同样被排除。存活窗口在 neV 及以下，实验室配置（100 kg 源）的信号系数为 $9.5 times 10^(-14) alpha "eV"$，轨道配置为 $2.8 alpha "eV"$——两配置的可达性表见配套实验设计文档。

= 代表性推导三：GIE 相位

两质量各处于空间叠加，四分支相对相位取精确式

$ phi = (G m^2 t)/(ℏ) (1/(d+Delta x) + 1/(d-Delta x) - 2/d). $ <eq-gie>

基准参数给出 $phi = 0.217 "rad"$（负度 $N approx 0.078$，CHSH 违背 0.024，数值模拟）；现实芯片参数给出 $10^(-6) ~ 10^(-5) "rad"$，3σ 认证从约 200 次膨胀到 $10^9 ~ 10^21$ 次。三模型模拟（量子/平均场/LOCC）实现排除逻辑；连续变量版本以 $e^(-2 alpha^2)$ 偏差验证 qubit 抽象忠实性。

= 逻辑条目三条

*行 4（double copy 本体论）*：代数事实成立（off-shell N=8 = (N=4)²；相干态背景映射；Ehlers = 电磁对偶的平方），但残余规范代数坍缩表明共享代数不等于共享物理内容——本体论地位不可由计算判决。此为归纳问题，无脚本可写。

*行 9（ICO→量子时空）*：Salzger-Vilasini 定理——QC-QC 恰为经典非循环时空中可实现的全部高阶过程。量子开关的"不定因果序"可在精细层面展开为经典时空中的无环结构。逻辑排除，无脚本可写。

*行 17（惯性工程 = Tμν 工程）*：控制通道唯一性定理的推论（见配套论文）。分类陈述，证据为定理本身。

= 结论

二十一条边界在单一框架内重推导完毕，每条绑定可执行脚本或文档化逻辑条目。本文的贡献不是任何单条边界——它们大多在文献中已有——而是*边界的组织方式*：可复核、可传播、可比较。当核钟稳定度、GQuEST 灵敏度或 QGEM 参数更新时，表 1 的对应行通过重跑脚本自动更新。约束表因此成为活的领域基础设施，而非静态综述。

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. Fedida, S. & Kent, A. *Phys. Rev. D* 111, 126016 (2025).
2. Bose, S. et al. *Phys. Rev. Lett.* 119, 240401 (2017).
3. Marchese, M. M. et al. *Phys. Rev. A* 111, 042202 (2025).
4. Salzger, M. & Vilasini, V. arXiv:2605.08351 (2026).
5. Vermeulen, S. M. et al. *Phys. Rev. X* 15, 011034 (2025).
6. Panda, C. D. et al. *Nature* 631, 515 (2024).
7. Touboul, P. et al. *Phys. Rev. Lett.* 129, 121102 (2022).
8. Du, S.-S. et al. *Astrophys. J.* (2025).
9. Jusufi, K. et al. *J. Cosmol. Astropart. Phys.* (2025).
10. Maclay, G. J. & Davis, E. W. *Found. Phys.* 49, 797 (2019).
11. Holton, B. arXiv:2509.24112 (2025).
12. Céleri, L. C. et al. arXiv:2607.08819 (2026).

#v(0.4em)
*代码可用性*　全部脚本见 github.com/everest-an/Antigravity（test_all.py 一键回归）。
