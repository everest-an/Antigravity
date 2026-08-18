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
  #text(size: 16pt, weight: "bold")[三个出口的分流协议：强耦合、非局域与态荷的可检验特征]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · E6 论文（第一版，协议论文）]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　分类定理（T2）与统一零背景定理（E5）的证伪条款把"态相关信号出现"之后的新物理限定为三个出口：强耦合扇区（截断 $Lambda <~ 43 "MeV"$）、非局域理论、态荷引力扇区。本文给出判别三出口的分流协议与量化阈值：第 1 步，扩展近距扫描（$0.02 ~ 0.5 "m"$）的形状拟合——双指数（ghost）谱的第二尺度只在 $r < lambda_2$ 的近距段携带形状信息，标准扫描（$0.15 "m"$ 起）对 $lambda_2 = 0.05 "m"$、$beta = 0.1$ 的混合不可见（$Delta chi^2 approx 0$），扩展扫描给出 $Delta chi^2 approx 10$ 与最小可检出混合 $beta_"min" approx 0.10$；第 2 步，多探针比值（$8.36 "eV" / 76.7 "eV" / "keV" / "MeV"$ 跃迁）——强耦合的形状因子 $F(E) approx 1/(1+E/Lambda)$ 使比值偏离四极标度 $~E/Lambda$，MeV 探针可见 2% 量级；第 3 步，自旋投影 m 扫描——态荷的选择定则给出互不重叠的模式（常数/线性/平方）。三步观测量相互正交，一轮实验可同时完成全部判别。协议包含反向自检：若三步全部落回零，则"信号"是系统误差而非新物理。全部数字由 experiments/19 给出（合成数据 + 拟合 + 阈值扫描），图 9 给出决策树。本文是协议论文：它不预言信号出现，它规定信号出现之后如何归属。

*关键词*　态相关耦合；分流协议；强耦合；非局域；态荷；形状拟合；选择定则
]

#pagebreak()

= 引言：阳性信号之后

T2 的分类定理与 E5 的统一零背景定理证明：若任一态控制实验（核钟态相关搜索、GIE 内态控制、自旋分辨 frame dragging）测得高于读出灵敏度的态相关信号，则 GR、标准 KK 与一切弱耦合局域 EFT 同时被证伪，新物理属于三类出口之一：*强耦合扇区、非局域理论、态荷引力扇区*。这是一个前所未有的判决位置：三个出口不是修辞，而是逻辑结论。

但"属于三类之一"还不够——科学需要知道*是哪一个*。本文给出分流协议：三个相互正交的观测量，各自以量化阈值判别一个出口。它是判决矩阵方法论在阳性分支上的延伸：矩阵处理"哪个箭头成立"，协议处理"成立之后指向哪里"。

= 前提回顾（协议的两条输入）

#set par(first-line-indent: 0em)
- *零背景定理（E5）*：局域、洛伦兹不变、弱耦合 EFT 中，态相关耦合被 dim-6 功率计数压制 10.7~28.3 个数量级——任何可观测态相关信号即证伪全部弱耦合局域 EFT。
- *三出口（T2 第五条证伪条款细化）*：信号若为真，新物理必属：(1) 强耦合扇区（可观测性要求 $Lambda <~ 43 "MeV"$，与 EFT 失效区重合）；(2) 非局域理论（传播子解析结构改变）；(3) 态荷扇区（引力耦合携带态量子数）。
#set par(first-line-indent: 2em)

协议的任务：在三个出口之间给出判别，且判别必须可执行、可量化、可复核。

= 出口一：强耦合扇区——能标阈

强耦合扇区的可检验特征在*能量依赖*而非空间形状：形状因子偏离标度 $r_c = ℏ c/Lambda approx 4.6 "fm"$，宏观 $r$ 处完全不可见；但形状因子 $F(E) approx 1/(1+E/Lambda)$ 对探针跃迁能量敏感，偏离量 $delta F approx E/Lambda$：

#figure(
  table(
    columns: (1.6fr, 1.2fr, 1.2fr),
    align: (left, left, left),
    [*探针*], [*跃迁能量*], [*δF ≈ E/Λ*],
    [Th-229 同质异能], [$8.36 "eV"$], [$1.9 times 10^(-7)$],
    [U-235 同质异能], [$76.7 "eV"$], [$1.8 times 10^(-6)$],
    [keV 跃迁探针], [$10 "keV"$], [$2.3 times 10^(-4)$],
    [MeV 跃迁探针], [$1 "MeV"$], [$2.3 times 10^(-2)$],
  ),
  caption: [表 1：强耦合出口的能标阈特征。多探针 δα 比值在归一化到四极标度后应显示 ~E/Λ 的残差。]
)

*判别量*：多探针 $delta alpha$ 比值。局域 EFT 预言比值严格按 $angle O angle$ 标度；强耦合出口预言额外因子 $F(E)$——MeV 探针可见 2% 量级偏离。这要求把态控制检验从单一核种推广到多核种/多跃迁平台（Th-229、U-235 与固体核钟谱线），构成一条自然的实验升级路径。

= 出口二：非局域——双指数判别与近距扩展

非局域的传播子修改在坐标空间表现为双指数（ghost）谱：

$ delta f(r) = 23 alpha (e^(-r/lambda_1) - beta e^(-r/lambda_2)) "Hz", $ <eq-ghost>

以 $lambda_1 = 0.30 "m"$、$lambda_2 = 0.05 "m"$、$beta = 0.1$ 为基准模型，在投影稳定度（$tau = 10^5 "s"$，$sigma_("δf") approx 2.9 times 10^(-10) "Hz"$）下做合成数据拟合（脚本 19）：

- 标准扫描（$0.15 ~ 0.5 "m"$）：$Delta chi^2 approx 0$，第二尺度不可见——因为 $r >= 0.15 "m" > 3 lambda_2$，ghost 项已衰减至 5% 以下；
- 扩展近距扫描（$0.02 ~ 0.5 "m"$）：$Delta chi^2 approx 10$，$beta_"min" approx 0.10$——第二尺度立即可判别。

*协议结论*：分流第 1 步的形状拟合必须包含近距扩展段（$r < lambda_2$ 的采样）。这同时是一条硬件建议：核钟方案的位移台近距扫描应从 $0.15 "m"$ 延伸到 $0.02 "m"$（对应平移台行程与屏蔽设计的修改，量级上完全可行）。$Delta chi^2 > 4$ 判非局域；$beta_"min"$ 随 $sqrt(tau)$ 改善。

= 出口三：态荷——选择定则与 m 扫描

态荷扇区中引力耦合携带态量子数，其直接特征是选择定则：$delta alpha$ 对核自旋投影 $m$ 的模式。Th-229 基态 $I = 5/2$ 提供三个 $|m|$ 值：

#figure(
  table(
    columns: (1.6fr, 1.2fr, 1.2fr, 1.2fr),
    align: (left, left, left, left),
    [*模式*], [*|m| = 5/2*], [*|m| = 3/2*], [*|m| = 1/2*],
    [普适（常数）], [1.00], [1.00], [1.00],
    [自旋荷（$prop m$）], [1.00], [0.60], [0.20],
    [四极荷（$prop m^2$）], [1.00], [0.36], [0.04],
  ),
  caption: [表 2：态荷出口的选择定则模式（归一化到 |m| = 5/2）。三条曲线互不重叠——单次 m 扫描即可判别。]
)

*判别量*：微波选投影 + 源翻转测量的 $delta alpha(m)$ 模式。三条曲线互不重叠，一次 m 扫描即可判定态荷类型；正交检验是跃迁速率反常（态荷混入 E1 分量改变同质异能态寿命的角分布特征）。

= 分流协议与判别表

#figure(
  table(
    columns: (0.8fr, 2.0fr, 1.6fr, 1.6fr),
    align: (left, left, left, left),
    [*步*], [*观测量*], [*阈值*], [*出口*],
    [1], [形状拟合（扩展近距 0.02~0.5 m）：单 vs 双指数], [$Delta chi^2 > 4$], [非局域],
    [2], [多探针比值：偏离四极标度], [$delta F ~ E/Lambda$（MeV 探针 2%）], [强耦合],
    [3], [m 扫描模式：线性/平方], [模式与常数偏离], [态荷],
    [—], [三步全部落回零], [—], [系统误差（协议自检）],
  ),
  caption: [表 3：分流协议。三步互为正交观测量，一轮实验可同时完成。]
)

= 反向风险：当信号是系统误差

协议必须回答自己的反面：若"阳性信号"实际是系统误差（例如源位置相关磁场、晶体热梯度的残余），三步会给出什么？*全部落回零*：形状为纯指数、比值为常数、模式为常数。三步全零即触发系统误差复查——这是协议的自检条款，与判决矩阵的"条件 A（排除全部已知系统误差）"闭环。协议因此双向安全：真信号必被归属，假信号必被暴露。

= 结论

本文把证伪条款的三个出口转化为三步可执行的分流协议，每步有量化阈值与合成数据支撑：近距扩展形状拟合判别非局域（$beta_"min" approx 0.10$ @ $tau=10^5 "s"$）、多探针比值判别强耦合（MeV 探针 2%）、m 扫描判别态荷（模式互不重叠）。协议的更广意义：它示范了"阳性分支"的方法论——判决矩阵不仅规定如何证伪，还规定证伪之后的归属路径。配合 T2 与 E5，三步构成从"哪些箭头成立"到"成立之后是什么"的完整闭环。

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. MuningAn. 引力控制通道的分类定理：有效场论框架（T2，2026）.
2. MuningAn. 量子态作为引力检验的控制变量：统一零背景定理（E5，2026）.
3. MuningAn. 核钟实验设计方案（v2.0，2026）——位移台近距扫描参数.
4. Zhang, C. et al. *Nature* (2024)（Th-229 直接激发）.
5. Derevianko, A., Elwell, R. & Hudson, E. R. arXiv:2606.11048 (2026).
6. Donoghue, J. F. *Phys. Rev. D* 50, 3874 (1994).
7. Will, C. M. *Living Rev. Rel.* 17, 4 (2014)（多探针等效原理检验综述）.

#v(0.4em)
*代码可用性*　experiments/19（合成数据 + 双指数判别 + 阈值扫描）与图 9 见 github.com/everest-an/Antigravity。
