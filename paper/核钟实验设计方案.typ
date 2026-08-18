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
  #text(size: 16pt, weight: "bold")[Kaluza-Klein 引力 Aharonov-Bohm 实验方案（实验室配置版）]
  #v(0.4em)
  #text(size: 12pt)[面向钍-229 核钟实验组 · 几何式统一（路线 B）原理验证 · 版本 2.0（数字修正版）]
  #v(0.4em)
  #text(size: 11pt)[MuningAn · PlanetarySystem · 2026-08]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　本方案利用钍-229 核钟检验引力是否存在可调控的额外自由度，目标表述严格限定为"搜寻紧致额外维度的 Yukawa 修正"，不宣称"测反重力"。与轨道配置（地球为源，信号系数 $2.8 alpha "eV"$）不同，实验室配置以 100 kg 可移动钨块为源，信号系数为 $9.5 times 10^(-14) alpha "eV"$（$Delta f = 23 alpha "Hz"$）——比轨道配置小十个数量级，但在无自旋宿主晶体的投影稳定度（$4.6 times 10^(-23)/sqrt(tau)$）下，于 $tau = 10^6 "s"$ 处达到 $alpha_"min" approx 7 times 10^(-12)$，比 Eöt-Wash 在实验室尺度的约束深 5-6 个数量级。方案的存活窗口是 $alpha in [10^(-12), 10^(-6)]$（更低段为实验室新增覆盖区，$[10^(-6), 10^(-5)]$ 已被 Eöt-Wash 排除）。两阶段流程：阶段一以实验室质量完成首个核钟引力红移测量并建立误差预算；阶段二拟合 Yukawa 残差。判决三条件（系统误差排除、落在未排除窗口、与源质量线性）后，进阶阶段以微波脉冲调控核内部量子态，检验耦合是否态相关——这是通往引力工程的前置原理检验。本方案同时给出零结果的约束价值、噪声预算、发表路径与局限声明。

*关键词*　钍-229；核钟；Kaluza-Klein；第五力；精密测量；态相关耦合
]

#pagebreak()

= 科学目标与表述纪律

*主目标*：利用钍-229 核钟的极高频率稳定性，测量引力势变化引起的核跃迁频移，搜寻 Kaluza-Klein 最轻模式带来的 Yukawa 型引力修正。

*次级目标*：(1) 更新耦合强度 $alpha$-力程 $lambda$ 参数平面的实验约束；(2) 检验引力耦合是否可被核内部量子自由度调控（引力工程的前置条件）。

*表述纪律（写论文与实验组沟通必须使用）*：本实验不直接演示反重力；若观测到非零、可调制的 $alpha$，代表引力存在可工程访问的新自由度，为后续引力操控研究提供物理基础。全程使用"引力额外自由度检验"，不使用"反重力装置"。

= 物理预言与窗口的精确位置

== 信号形式（复用原文公式）

$ V(r) = - (G m_1 m_2)/(r) (1 + alpha e^(-r/lambda)), $ <eq-kk>

$ Delta E = m_"sys" alpha Delta Phi(r, lambda), $ <eq-ab>

其中 $alpha$ 为 KK 模式相对标准引力的耦合、$lambda$ 为 Compton 力程、$Delta Phi$ 为源质量移动引起的引力势变化、$m_"sys"$ 为钍核有效质量（$3.8 times 10^(-25) "kg"$）。

== 数字修正：实验室配置的信号量级

*关键修正（相对上一版的轨道数字）*：式 @eq-ab 的 $Delta Phi$ 依源而定。实验室 100 kg 钨块从 $r_1 = 0.15 "m"$ 移至 $r_2 = 1.5 "m"$：

$ Delta Phi = G M (1/r_1 - 1/r_2) approx 4.0 times 10^(-8) "m"^2/"s"^2. $ <eq-labphi>

故实验室信号系数为

$ (Delta E)/(alpha) = m_"Th" Delta Phi approx 9.5 times 10^(-14) "eV", quad (Delta f)/(alpha) = (Delta E)/(h alpha) approx 23 "Hz". $ <eq-labsig>

与之对照：轨道配置（地球为源，$Delta Phi approx 1.18 times 10^6$）的系数为 $2.8 alpha "eV"$。*上一版方案把轨道系数误用于实验室源，导致信号被高估约七个数量级*——原方案的"$Delta E in [0.1, 10] "neV"$ 对应 $24 "kHz" ~ 2.4 "MHz"$"需要 $alpha = 330 ~ 3.3 times 10^4$，被 Eöt-Wash 在实验室尺度排除 7-9 个数量级，恰好落在本文开篇纪律禁止的"已被排除参数区"。本版全部数字按式 @eq-labphi 与 @eq-labsig 重算。

== 存活窗口与可达性

实验室配置的物理窗口：

#set par(first-line-indent: 0em)
- *新增覆盖区*：$alpha in [10^(-12), 10^(-6)]$——$10^(-6)$ 以下未被 Eöt-Wash 覆盖，是实验的真正目标区。
- *已排除区*：$alpha > 10^(-6)$（Eöt-Wash 在 $lambda ~ 10^(-2) ~ 10^(-1) "m"$ 的约束）。
- *灵敏度*：投影稳定度 $4.6 times 10^(-23)/sqrt(tau)$ 下，$tau = 10^4 "s"$ 时 $alpha_"min" approx 7 times 10^(-11)$，$tau = 10^6 "s"$ 时 $alpha_"min" approx 7 times 10^(-12)$。
- *频率尺度*：对应频移 $Delta f in [10^(-10), 10^(-5)] "Hz"$——亚纳赫兹到微赫兹，全部低于当前 kHz 线宽平台的分辨能力，*本实验只在无自旋宿主达到投影稳定度后可行*。
#set par(first-line-indent: 2em)

= 装置硬件配置

#figure(
  table(
    columns: (1.2fr, 1.9fr, 2.6fr),
    align: (left, left, left),
    [*模块*], [*技术选型*], [*关键指标*],
    [核钟宿主晶体], [Th(SO#sub[4])#sub[2] 无自旋宿主], [消除磁偶极展宽；投影不稳定度 $4.6 times 10^(-23)/sqrt(tau)$],
    [激发光源], [VUV 148.18 nm 窄线宽激光], [直接激发钍-229 同质异能态],
    [读出], [X 射线淬灭读出], [读出周期加速 ≥50 倍],
    [引力源], [高密度钨块 $M = 100 "kg"$（边长约 17 cm）], [电控平移台，距离 $r in [0.15, 1.5] "m"$（近距扫描 $0.15 ~ 0.3 "m"$ 用于 Yukawa 形状）],
    [屏蔽], [多层磁屏蔽 + 静电屏蔽 + 隔振], [残余磁场 $< 1 "nT"$；接地屏蔽壳；隔振平台],
    [姿态控制], [晶体姿态旋转 / 核自旋极化], [微波脉冲调控，用于态相关耦合检验],
  ),
  caption: [表 1：装置配置。全部组件均有文献验证；新增硬件仅为可移动大质量引力源与高精度位移台。]
)

= 两步测量流程

== 阶段一：基线校准（不可跳过）

#set par(first-line-indent: 0em)
1. 钨块移至远距离（$r > 2 "m"$），采集参考频率 $f_0$。
2. 将钨块移至一组固定距离 $r_i$，测量频移 $Delta f(r_i)$，与广义相对论预言 $Delta f_"GR" = f_0 Delta Phi(r_i)/c^2$ 比对。
3. 拟合并扣除热漂移、光移、斯塔克位移、磁场漂移等系统偏移，建立完整误差预算。
#set par(first-line-indent: 2em)

*阶段一的定量内容*：实验室源的经典红移为 $Delta Phi/c^2 approx 4.4 times 10^(-25)$（$0.15 ~ 1.5 "m"$ 全程扫描），在 $tau = 10^4 "s"$ 的投影稳定度（$4.6 times 10^(-25)$）下信噪比约 1，$tau = 10^6 "s"$ 下约 10——*这是首个用核钟测量实验室质量引力红移的实验*（Panda 等的原子干涉测量是其力版，此为频率版），本身即可独立发表。若宿主晶体未达投影稳定度，阶段一不可执行，方案整体延后。

== 阶段二：Yukawa 偏离搜索

#set par(first-line-indent: 0em)
1. 扫描 $r in [0.15, 1.5] "m"$（重点近距段），测量 $Delta f_"obs"(r_i)$。
2. 残差：$delta f(r_i) = Delta f_"obs"(r_i) - Delta f_"GR"(r_i)$。
3. 将残差拟合到 $delta f(r) = 23 alpha e^(-r/lambda) "Hz"$（含 $lambda$ 依赖的形状因子），提取 $alpha, lambda$。
#set par(first-line-indent: 2em)

= 判决判据（无模糊空间）

#set par(first-line-indent: 0em)
1. *零结果（最可能）*：残差与零在统计误差内一致。产出：$alpha(lambda)$ 平面的新排除边界（$alpha < 7 times 10^(-12)$ 量级，$tau = 10^6 "s"$），把 Eöt-Wash 边界下推 5-6 个数量级。零结果同样是高质量成果。
2. *阳性候选信号*：残差显著偏离零且随 $r$ 呈指数衰减 $prop e^(-r/lambda)$。须同时满足：条件 A（排除全部已知系统误差）；条件 B（拟合参数落在 $alpha in [10^(-12), 10^(-6)]$ 的未排除窗口）；条件 C（改变源质量 $M$，信号与 $M$ 线性）。三者齐备方为候选证据。
3. *进阶判据（核心创新点）*：保持引力源、距离、质量完全不变，用微波脉冲改变核自旋/同质异能态内部量子态，检验拟合耦合 $alpha$ 是否随核内部态发生可重复变化。若可重复变化，证明引力耦合可被物质内部量子自由度调制——引力工程物理窗口打开的前置证据。*注意*：即使观测到 $alpha$ 可调，也不等于造出反重力样机，只证明存在可操控通道。理论定位必须写清：标准 KK 的 $alpha$ 是常数，态相关性若测得则同时证伪 GR 与标准 KK，指向新的态相关耦合通道。
#set par(first-line-indent: 2em)

= 噪声预算（核心摘要）

#set par(first-line-indent: 0em)
1. *核钟本征不稳定度*：$4.6 times 10^(-23)/sqrt(tau)$；$tau = 10^4 "s"$ 时约 $4.6 times 10^(-25)$，$tau = 10^6 "s"$ 时约 $4.6 times 10^(-26)$。
2. *静磁场*：磁屏蔽残余 $< 1 "nT"$；无自旋宿主消除一阶 Zeeman。
3. *晶体热梯度*：温度稳定优于 $1 "mK"$。
4. *引力源振动*：隔振平台抑制；位移台定位精度需 $< 0.1 "mm"$（对应 $delta Phi/Phi ~ 10^(-3)$，需在拟合中作为系统误差建模）。
5. *静电场*：屏蔽壳接地，消除斯塔克频移。
6. *X 射线淬灭循环*：占空比效应需循环相位锁定。
#set par(first-line-indent: 2em)

= 产出与发表路径

#set par(first-line-indent: 0em)
1. *理论预稿（独立完成）*：本方案的预言、参数扫描、噪声分析写为 arXiv 预印本；Yukawa 拟合与信号模拟脚本上传仓库（复用现有框架）。
2. *合作实验*：对接国内精密测量组（引力中心/光机所/核钟团队），以理论合作者身份参与。
3. *发表分级*：零结果约束 → PRD / Nature Communications；候选 KK 信号 → Nature Physics / PRL；$alpha$ 量子态可调 → 重大突破，冲击 Nature 主刊。
#set par(first-line-indent: 2em)

= 必须写进讨论的局限（避免审稿人攻击）

#set par(first-line-indent: 0em)
1. 本实验只检验*特定一类 KK 模型（最轻模式 Yukawa 修正）*，不能排除所有高维理论。
2. 即便观测到 $alpha$ 可调，距离宏观引力操控仍有巨大工程鸿沟；本实验只做原理层可行性检验。
3. 本实验不覆盖涌现引力与量子叠加源类模型；那些需要 GIE 纠缠实验检验（见附录）。
4. 本方案的全部灵敏度数字依赖无自旋宿主的*投影*稳定度；若实际性能低于投影，$alpha_"min"$ 按 $4.6 times 10^(-23)/sqrt(tau)$ 的同比例缩放退化，需在论文中以"投影-实测"两栏呈现。
#set par(first-line-indent: 2em)

= 附录：GIE 备选实验要点（方案 B 备份）

若核钟合作门槛过高，并行准备 GIE 方案理论设计：

#set par(first-line-indent: 0em)
- *探测对象*：引力介导的量子纠缠（判决矩阵第 6-7 行）。
- *可观测量*：负度 $N$、CHSH 不等式违背；配套三模型歧视模拟已完成（量子模型 $N approx 0.078$，平均场/LOCC 严格为零）。
- *独特改进*：增加内部量子态调控，观测纠缠耦合强度是否被量子态调制。
- *难点*：纳克级质量的空间叠加态制备，噪声难度更高，全球尚未完成最终实测。
- *现成筹码*：连续变量验证（qubit 抽象忠实性 $~e^(-2 alpha^2)$）与 N(3σ) 成本核算均已入库，可直接作为合作提案附件。
#set par(first-line-indent: 2em)

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. MuningAn. 三种统一：量子引力前沿的一张可证伪地图（2026）.
2. MuningAn. 三种统一之后：反重力问题的三个存活出口与一个可证伪候选原理（2026）.
3. Derevianko, A., Elwell, R. & Hudson, E. R. Colloquium: Nuclear clocks. arXiv:2606.11048 (2026).
4. Hiraki, T. et al. *Nat. Commun.* 15, 5536 (2024).
5. Morgan, H. W. T. et al. arXiv:2503.11374 (2025).
6. Girvin, S. M. & Radzihovsky, L. arXiv:2511.13017 (2025).
7. Chiao, R. Y. et al. *Phys. Rev. D* 109, 064073 (2024).
8. Jusufi, K. et al. *J. Cosmol. Astropart. Phys.* (2025).
9. Panda, C. D. et al. *Nature* 631, 515 (2024).
10. Touboul, P. et al. *Phys. Rev. Lett.* 129, 121102 (2022) (MICROSCOPE).
11. Kapner, D. J. et al. *Phys. Rev. Lett.* 98, 021101 (2007) (Eöt-Wash).
