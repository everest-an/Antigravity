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
  #text(size: 16pt, weight: "bold")[量子态作为引力检验的控制变量：统一零背景定理]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · E5 论文（第一版，含证伪条款）]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　引力检验传统上把量子态当作"更干净的探测器"；本文证明量子态可以做得更多——作为*控制变量*。我们把三个已排期的态控制检验（核钟态相关搜索、GIE 内态控制、自旋分辨 frame dragging）统一在一个定理之下：局域、洛伦兹不变、弱耦合有效场论（EFT）中，探针内部态对引力/Yukawa 耦合的区分被 dim-6 功率计数压制——有质量中介时 $delta alpha/alpha = angle O_"eff" angle M_"Pl"/(sqrt(alpha) Lambda^2 m_"probe")$，无质量引力子时 $delta G/G = angle O angle M_"Pl"^2/(Lambda^2 d^2 M_"src" m_"probe")$。三个实例的 EFT 上界分别比各自读出灵敏度低 10.7、13.1、28.3 个数量级：*态控制检验在全部弱耦合局域 EFT 类中零背景*。因此任何可观测的态相关信号同时证伪广义相对论、标准 KK 与一切弱耦合局域 EFT，指向强耦合、非局域或态荷引力扇区。定理附带显式证伪条款与判决矩阵的"态控制列"。全部数字由 experiments/18 给出，图 8 可视化。

*关键词*　量子态；引力检验；有效场论；零背景；态相关耦合；判决矩阵
]

#pagebreak()

= 引言：从"用什么探测器"到"用什么态"

引力检验的实验史是探测器进步史：扭秤、原子干涉仪、核钟。每一步都把系统误差压得更低，但探测器始终扮演被动角色——它测量给定几何下的引力效应。本文提出另一种用法：*把量子态本身当作控制变量*。探针的内部态（核同质异能态、电子内态、自旋取向）成为可以切换的实验旋钮；态相关信号的出现与否本身就是判决对象。

这一思想在文献中以零散形式存在：核钟方案进阶阶段提出微波调控核内部态；GIE 方案的升级版提出观测纠缠耦合是否被量子态调制。本文把它们统一为一个框架，并给出统一的零背景定理。

= 一般框架：四要素与态控制三通道

一个引力检验由四要素构成：源（质量分布）、探针（量子系统）、可观测量（相位/频率/纠缠）、态（探针内部态的控制）。传统实验优化前三者；态控制实验把第四者变为独立变量。态控制有三条通道：

#set par(first-line-indent: 0em)
- *内态通道*：单系统的两个内部态（核钟的基态/同质异能态）——态区分算符为核四极矩 $Q_("ij")$；
- *叠加通道*：质量叠加与纠缠作为资源（GIE）——内态控制版本以电子内态（偶极/自旋）为区分算符；
- *自旋-轨道通道*：自旋取向作为旋钮（frame dragging 读出）——态区分算符为自旋 $S$。
#set par(first-line-indent: 2em)

三通道的共同结构：态区分算符 $O$ 的矩阵元 $angle O angle$ 决定态相关耦合的理论上限。

= 定理：态相关耦合的普适 EFT 上界

#set par(first-line-indent: 0em)
*定理（态控制的零背景性）*。设局域、洛伦兹不变、弱耦合 EFT（截断 $Lambda$）中，探针（质量 $m_"probe"$）的内部态由算符 $O$ 区分，$c ~ O(1)$ 为 Wilson 系数。

(1) *有质量中介*（相对引力强度 $alpha$、力程 $lambda$）：态区分算符的领先实现为 dim-6 算符 $c O_("ij") partial_i partial_j phi/Lambda^2$；静态极限下

$ (delta alpha)/(alpha) = (c angle O_("eff") angle M_"Pl")/(sqrt(alpha) Lambda^2 m_"probe"), quad angle O_("eff") angle = angle O angle/lambda^2. $ <eq-massive>

(2) *无质量引力子*（源质量 $M_"src"$、距离 $d$）：态相关势与引力势之比为

$ (delta G)/(G) = (c angle O angle M_"Pl"^2)/(Lambda^2 d^2 M_"src" m_"probe"). $ <eq-massless>

*推论（零背景）*：两个上界在全部已排期态控制实验的读出灵敏度之上 10 个数量级以上（见第 4 节表 1）。因此*态控制检验在弱耦合局域 EFT 类中期望零背景*；任何可观测态相关信号即构成对 GR、标准 KK 与全部弱耦合局域 EFT 的同时证伪。
#set par(first-line-indent: 2em)

式 @eq-massive 是分类定理（配套论文 T2）推论 4 的推广：推论 4 是 $O = Q_("ij")$、$m_"probe" = m_"Th"$ 的特例；式 @eq-massless 覆盖引力子自身的态相关性（等效原理的态分辨版）。

= 三实例

#figure(
  table(
    columns: (1.1fr, 1.2fr, 1.4fr, 1.2fr, 1.2fr, 1.1fr),
    align: (left, left, left, left, left, left),
    [*检验*], [*态区分算符*], [*EFT 上界*], [*读出灵敏度*], [*零背景间隙*], [*脚本/图*],
    [核钟态相关], [$Q ~ 9.4 "b"$], [$delta alpha = 5.4 times 10^(-22)$], [$3 times 10^(-11)$ (5σ)], [10.7 个数量级], [17, fig07],
    [GIE 内态控制], [$e dot a_"B"$（保守）], [$delta G/G = 7.4 times 10^(-16)$], [$10^(-2)$（相位）], [13.1 个数量级], [18, fig08],
    [frame dragging], [$S ~ 1$], [$delta G/G = 4.9 times 10^(-31)$], [$10^(-2)$（相位）], [28.3 个数量级], [18, fig08],
  ),
  caption: [表 1：三实例对照。全部取 $Lambda = 10 "TeV"$、$c = 1$；GIE 取 $m = 10^(-14) "kg"$、$d = 450 μ"m"$；核钟取 $alpha = 10^(-6)$、$lambda = 1 "m"$。上界随 $Lambda$ 平方变紧，间隙只增不减。]
)

三个实例的间隙排序（核钟 < GIE < frame dragging）反映探针质量与距离的差异，不反映方法论差异——三者的共同点是*间隙全部巨大*。结论对态区分算符的具体选择稳健（GIE 若取 NV 自旋磁矩而非原子偶极，间隙升至 31 个数量级，见脚本 18）。

= 判决矩阵的态控制列

判决矩阵的方法论纪律是每行一条判决通道。态控制框架为其增加一列：对任何一行，若探针存在内部态区分，则该行自动获得一条零背景的态控制检验。具体而言：

#set par(first-line-indent: 0em)
- 第 12 行（KK 额外维）：核钟态相关搜索（推论 4）；
- 第 6-7 行（GIE）：内态控制升级版；
- 第 8 行（frame dragging）：自旋分辨读出。
#set par(first-line-indent: 2em)

三列共用同一零背景定理——这是态控制框架对矩阵方法论的回馈：检验的可证伪性从"窗口内搜索"升格为"零背景证伪"。

= 证伪条款

定理的证伪条款与 T2 第五条一致并在此细化：*若任一态控制实验测得高于表 1 读出灵敏度的态相关信号，则 GR、标准 KK 与一切弱耦合局域 EFT 同时被证伪*，新的物理必须属于以下三类之一：强耦合扇区（$Lambda ≤ 43 "MeV"$ 量级，见脚本 17）、非局域理论、态荷引力扇区（引力耦合携带态量子数）。三者各自的可检验特征——强耦合的能标结构、非局域的传播子修正、态荷的选择定则——构成后续工作的搜索清单。

= 结论

量子态是引力检验的第四个变量。本文给出其统一框架与零背景定理：三通道（内态/叠加/自旋-轨道）共用一条 dim-6 功率计数，三个已排期实验的零背景间隙为 10.7~28.3 个数量级。态控制检验因此成为"零背景证伪"类实验：没有信号时它验证 EFT 图景的自洽，有信号时它一次性打开强耦合/非局域/态荷三种新物理出口。这是从"测引力"到"测引力的态相关性"的升级。

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. MuningAn. 引力控制通道的分类定理：有效场论框架（T2，2026）——推论 4 及其推导.
2. MuningAn. 核钟实验设计方案（v2.0，2026）——进阶阶段与 GIE 备份附录.
3. Bose, S. et al. *Phys. Rev. Lett.* 119, 240401 (2017).
4. Vermeulen, S. M. et al. *Phys. Rev. X* 15, 011034 (2025).
5. Zhang, C. et al. *Nature* (2024)（Th-229 直接激发）.
6. Derevianko, A., Elwell, R. & Hudson, E. R. Colloquium: Nuclear clocks. arXiv:2606.11048 (2026).
7. Jusufi, K. et al. *J. Cosmol. Astropart. Phys.* (2025).
8. Kapner, D. J. et al. *Phys. Rev. Lett.* 98, 021101 (2007).
9. Touboul, P. et al. *Phys. Rev. Lett.* 129, 121102 (2022) (MICROSCOPE).
10. Donoghue, J. F. *Phys. Rev. D* 50, 3874 (1994)（EFT 功率计数基准）.

#v(0.4em)
*代码可用性*　experiments/17（推论 4）、18（统一零背景定理）与图 7、8 见 github.com/everest-an/Antigravity。
