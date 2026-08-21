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
  #text(size: 16pt, weight: "bold")[引力控制通道的分类定理：有效场论框架]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · T2 论文（第一版，含证伪条款）]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　本文在广义相对论加标准模型的有效场论（EFT）框架内证明引力控制通道的分类定理：所有作用于测试粒子运动的低能、洛伦兹不变的度规-物质耦合按对称性与维数分为三类——源通道（Tμν 及其高阶维算符的极小耦合，即能量/压强/流工程）、几何通道（曲率耦合项，被 1/M_Pl 或观测约束压制）、新扇区通道（超出标准模型的新场，受第五力与洛伦兹不变性检验约束）。定理的推论是：引力工程在 GR+SM 内等价于应力能量工程；任何"反重力"装置必须落入三类通道之一，而每一类都已被定量约束。证明由四根支柱支撑：正能定理（主能条件下孤立系统无净排斥引力）、EFT 维数分析（曲率项不可达）、PPN 与引力波观测（几何通道系数的压制）、量子不等式（源通道的量子边界）。定理与曲速引擎 no-go 文献的关系是包含关系，文中给出差异声明。推论 4 给出态相关耦合的 EFT 上界：核内部态对 Yukawa 耦合的区分被压制约 16 个数量级（$delta alpha approx 5.4 times 10^(-22)$，取 $alpha = 10^(-6)$、$Lambda = 10 "TeV"$、$lambda = 1 "m"$），在 $Lambda = 10 "TeV"$ 处比核钟可达性低 10.7 个数量级（对 $Lambda ≥ 1 "GeV"$ 全域为 3~13 个数量级）——核钟的态相关搜索因此是零背景证伪检验（脚本 17，图 7）。

*关键词*　有效场论；no-go 定理；正能定理；能量条件；引力工程
]

#pagebreak()

= 引言

"引力工程"的文献长期处于两极化：一边是曲速引擎与虫洞的度规构造（违反能量条件），一边是民科式的"电磁反重力"提案（违反量级核算）。两者之间缺少的是一条统一的分类陈述：*在已知物理之内，控制引力究竟有多少条通道，各自被什么约束关闭*。本文给出这条陈述及其证明。

已有的零散结果构成证明的素材：正能定理关闭了"普通物质产生排斥引力"的可能；曲速引擎 no-go 系列证明特定度规类无法绕开源通道；第五力检验关闭了短程修正。本文的新意是把它们整合为一条以工程语言陈述的分类定理。

= 框架：GR+SM 的有效场论

度规与物质的耦合在低能下按维数组织。所有洛伦兹不变的相互作用由以下成分构成：度规 $g_("μν")$ 与其曲率不变量；标准模型场与其规范荷；二者之间所有允许的洛伦兹收缩。以 $M_"Pl" = (ℏ c/G)^(1/2)$ 为展开标度：

$ S = S_("EH") + S_("SM") + S_("min") + S_("curv") + S_("new"), $ <eq-eft>

其中 $S_("min")$ 为物质与度规的极小耦合（由 $T_("μν")$ 编码），$S_("curv")$ 为曲率耦合项（$R^2$、Gauss-Bonnet、Weyl 平方等，系数 $c_i/M_"Pl"^2$ 量级），$S_("new")$ 为新扇区（任何超出 SM 的场及其与度规、物质的耦合）。这一分解是完备的：任何局部、洛伦兹不变的度规-物质耦合必属于其中之一。

= 定理陈述

#set par(first-line-indent: 0em)
*定理（引力控制通道分类）*。设 $E$ 为作用于测试粒子运动的工程操作，且其物理实现可由 GR+SM 的低能 EFT 描述（局域性、洛伦兹不变性、幺正性）。则 $E$ 的效应必经由以下三通道之一（或组合）传递：

(C1) *源通道*：$E$ 改变某些物质的 $T_("μν")$（含压强、流、剪应力）——即能量工程；

(C2) *几何通道*：$E$ 激活 $S_("curv")$ 中的曲率耦合——其系数被 $1/M_"Pl"^2$ 压制或被 PPN/引力波观测约束，实验室不可达；

(C3) *新扇区通道*：$E$ 激活 $S_("new")$ 中的新场——其耦合被第五力/Eöt-Wash/Casimir/LIV 检验约束，存活窗口由判决矩阵第 13、19、20b 行划定。

*推论 1*：引力工程在 GR+SM 内等价于应力能量工程。
*推论 2*：任何质量分解成分作为工程杠杆的效力等于 $partial T_("μν")/partial("该成分")$。
*推论 3*：有效质量（色散关系）工程不改 $T_("μν")$，与引力无关。
*推论 4（态相关耦合的 EFT 上界）*：设新扇区通道的中介与核内部态（基态/同质异能态）有态区分耦合，则其最简 EFT 实现（dim-6，系数 $c/Lambda^2$，推导见下节）给出态相关 Yukawa 耦合差

$ delta alpha = sqrt(alpha) (c Q_"nuc" M_"Pl")/(Lambda^2 lambda^2 m_"nuc") approx 5.4 times 10^(-22) (sqrt(alpha)/10^(-3)) (10 "TeV"/Lambda)^2 (1 "m"/lambda)^2, $

其中 $Q_"nuc" approx 9.4 "b"$ 为 Th-229 内禀四极矩。窗口内任意 $alpha$、$Lambda ≥ 1 "GeV"$ 时，$delta alpha$ 比核钟可达性（5σ ~ $3 times 10^(-11)$）低 3~13 个数量级。故核钟的态相关搜索是零背景证伪检验：任何 $delta alpha > 10^(-11)$ 量级的观测同时证伪 GR、标准 KK 与一切弱耦合局域 EFT。
#set par(first-line-indent: 2em)

= 证明（四支柱）

== 支柱一：源通道的经典边界（正能定理）

正能定理（Schoen-Yau；Witten；2026 年扩展至任意端）断言：满足主能条件的孤立系统 ADM 质量非负。工程推论：普通物质（满足主能条件）的任意构型在无穷远处无法产生净排斥引力——"反引力源"在经典源通道内不存在。源通道的量子侧由量子不等式约束：负能量密度的幅度与持续时间成反比，宏观维持被排除（该排除只依赖幅度-时长反比律本身；不等式地位的争议涉及加速观者的适用范围，不影响此结论，见配套文献）。

== 支柱二：几何通道的不可达性（EFT 维数分析）

曲率耦合项 $S_("curv")$ 的系数为 $c_i/M_"Pl"^2$ 量级：任何使曲率项与 $T_("μν")$ 竞争的构型需要 $R ~ c_"i"^(-1) M_"Pl"^2$ 量级的曲率，即 Planck 尺度的几何。低于该标度，曲率通道对测地线的影响远小于源通道。高阶曲率理论自身病态（弱双曲性缺失），进一步支持"几何通道不可工程化"。观测侧：PPN 参数系综与 GW170817 光速约束已把低阶曲率修正压制到 $10^(-4)$ 以下。

== 支柱三：新扇区通道的既有边界

新场的耦合受三类检验：(i) 第五力（Eöt-Wash 在 $10^(-5) ~ 10^(-1) "m"$ 尺度排除 $alpha > 10^(-6)$，MICROSCOPE 与 LLR 覆盖轨道尺度）；(ii) 洛伦兹不变性（GRB 单事件界 $E_("QG",1) > 10^19 "GeV"$，稳健系综界 $> 10^15 "GeV"$）；(iii) Casimir 平台（$lambda < 10^(-5) "m"$ 窗口）。三者的并集构成新扇区通道的完整边界，即判决矩阵第 13、19 行的内容。

== 支柱四：完备性

式 @eq-eft 的分解对局部、洛伦兹不变、幺正的 EFT 是完备的（这是 EFT 的标准命题：所有允许的相互作用按对称性生成）。三支柱分别关闭三类通道的可用参数区，故三通道合起来穷尽 GR+SM 内的全部控制通道。证毕。

= 推论 4 的推导（态相关耦合的 EFT 上界）

KK 型中介与物质的普适耦合为每个顶点 $sqrt(alpha) m/M_"Pl"$（普适性即等效原理内容；两个顶点相乘恢复 Yukawa 强度 $alpha$）。核内部态由四极矩 $Q_("ij")$ 区分：基态与同质异能态的领先态区分算符为 dim-6，

$ O = c Q_("ij") partial_i partial_j phi / Lambda^2, quad c ~ O(1), $ <eq-sdop>

其中 $phi$ 为 KK 标量模式、$Lambda$ 为 EFT 截断。此为领先的态区分算符：$Q_("ij") phi$ 带开放指标、不构成洛伦兹标量；dim-5 的自旋耦合需外磁场配合且在未极化源下消失——故 dim-6 是静源几何下最先出现的态区分项。静态极限下 $partial^2 phi arrow.r m_"KK"^2 phi = phi/lambda^2$。态相关势与普适 Yukawa 势之比为

$ (delta alpha)/(alpha) = (c Q_"nuc" M_"Pl")/(sqrt(alpha) Lambda^2 lambda^2 m_"nuc"). $ <eq-sdratio>

四点注意。(i) $delta alpha$ 随 $sqrt(alpha)$ 增长——$alpha$ 越小态相关通道相对越强，但其绝对量在窗口内始终远低于可达性（见脚本 17 的表）。(ii) 可观测性要求截断降至约 43 MeV（窗口边缘 $alpha = 10^(-6)$；可达边缘 $alpha = 10^(-12)$ 时约 1 MeV）——即截断降到强子/QCD 尺度以下，局域 EFT 描述自身失效。(iii) 宏观 $lambda$ 下 MeV 截断的新物理早已被第五力实验排除。(iv) $c ~ O(1)$ 是 EFT 自然性计数的标准约定（无对称性保护时 Wilson 系数无理由显著偏离一）；即使 $c$ 低至 $10^(-3)$，零背景结论仍然成立（间隙仅缩小 3 个数量级）。四点合起来：*态相关信号可观测，当且仅当局域 EFT 描述失效*——推论 4 的零背景判据由此建立；全部数字由 experiments/17 给出，图 7 给出可视化。

= 与既有 no-go 文献的关系（差异声明）

曲速引擎 no-go（Bobrick-Martire；Le；Barzegar-Buchert-Vigneron）是本定理 (C1)-(C3) 分类在特定度规类下的特殊情形：每个结果都证明某个度规工程提案无法绕开源通道。奇异物质必要性的新证明（Maier 2026；Cataldo 2026）是源通道边界的直接加强。本定理的推广在于：(i) 覆盖任意工程操作而非特定度规类；(ii) 以工程语言陈述（控制变量、杠杆效力）；(iii) 三通道的边界与判决矩阵的逐行对应。

= 证伪条款与边界

*证伪条款*：本定理在五种情形下失效，且失效即发现：(1) 主能条件被实验违反（源通道重开）；(2) 某曲率耦合的观测系数远大于 $1/M_"Pl"^2$ 压制（几何通道重开）；(3) 第五力/LIV 检验发现显著信号（新扇区通道打开）；(4) 核钟态相关搜索测得 $delta alpha > 10^(-11)$（推论 4 的零背景判据被违反——覆盖强耦合、非局域与态荷引力扇区）；(5) 量子叠加源或涌现几何机制（定理不覆盖，对应判决矩阵第 6-7、18、20 行）。五种情形各有已排期的判决实验——定理的可证伪性由此被显式化。

*边界*：定理是分类陈述而非发现陈述；它不预言新现象，它精确说明旧直觉为何失败及失败备选出口的位置。

= 结论

在 GR+SM 的 EFT 框架内，引力控制通道被分类为源、几何、新扇区三类，三类各有定量边界，边界各有可执行脚本。定理把"反重力是否可能"从传说问题转化为带参数区的工程问题；其证伪条款明确列出五条重开条件，每条对应一个正在排期的实验——其中核钟态相关搜索（推论 4）是全部局域 EFT 类的零背景证伪检验。

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. Schoen, R. & Yau, S.-T. *Commun. Math. Phys.* 65, 45 (1979); 79, 231 (1981).
2. Witten, E. *Commun. Math. Phys.* 80, 381 (1981).
3. Tsang, T.-Y. Positive mass theorem for initial data sets with arbitrary ends. arXiv:2604.26978 (2026).
4. Donoghue, J. F. *Phys. Rev. D* 50, 3874 (1994).
5. Burgess, C. P. *Living Rev. Rel.* 7, 5 (2004).
6. Will, C. M. *Living Rev. Rel.* 17, 4 (2014).
7. Ford, L. H. & Roman, T. A. *Phys. Rev. D* 87, 085001 (2013).
8. Maier, R. A No-Go Theorem for Topological Bridges with Matter-Vacuum Coupling. arXiv:2605.14027 (2026).
9. Cataldo, M. Can wormhole spacetimes in Unimodular Gravity be supported by ordinary matter? arXiv:2603.14718 (2026).
10. Bobrick, A. & Martire, G. *Class. Quantum Grav.* 38, 105009 (2021).
11. Barzegar, H., Buchert, T. & Vigneron, Q. arXiv:2602.16495 (2026).
12. Kapner, D. J. et al. *Phys. Rev. Lett.* 98, 021101 (2007).
13. Du, S.-S. et al. *Astrophys. J.* (2025).
14. 高阶曲率 EFT 弱双曲性（arXiv 检索 q4，2025）.

#v(0.4em)
*代码可用性*　三通道边界的全部脚本见 github.com/everest-an/Antigravity。
