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
#set figure(placement: top)
#show figure: set block(above: 1em, below: 1.2em)
#show table: set text(size: 8.5pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[GIE 2025 之争的逻辑重建：三方各自证明了什么]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · E3 短评（Comment 格式）]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　2025 年关于引力诱导纠缠（GIE）的论战——原始论证、经典-量子混合反例、物质扇区反驳——常被综述为"谁对谁错"。本文指出这一总结遗漏了最有价值的内容：三方各自证明的是*逻辑上不同的命题*。本文以表格与三模型模拟为工具，把三方的主张分离为六个精确命题，标出各自的逻辑内容与未决部分。结论：论战的净产出不是胜负，而是一套关于"什么观测排除什么理论"的精确表述——这正是判决矩阵方法论在真实科学实践中发生的方式。

*关键词*　引力诱导纠缠；LOCC；量子引力；科学方法论
]

= 三方、六命题

#figure(
  table(
    columns: (1.2fr, 2.4fr, 2.4fr),
    align: (left, left, left),
    [*方*], [*主张（逻辑内容）*], [*命题状态*],
    [原始论证（BMV 逻辑）], [P1：只经引力相互作用的两质量产生纠缠，则中介非经典（局域性假设下）], [成立（前提依赖）],
    [原始论证], [P2：该观测可在桌面实现], [开放（成本已量化：10⁹–10²¹ 次）],
    [反例（Aziz–Howl）], [P3：存在"经典引力 + 量子场论物质"框架可复现纠缠], [成立（在自身框架内）],
    [反例], [P4：因此 GIE 不能证明引力量子化], [不成立（P3 的推论超出其逻辑内容）],
    [反驳（Marletto 等 + 2026 解剖）], [P5：P3 的纠缠位于物质扇区（不同物质种类时相关图归零）], [成立（模型无关重述）],
    [反驳], [P6：标准 BMV 推断完整保留], [成立（对 LOCC 类通道）],
  ),
  caption: [表 1：六命题分离。关键：P4 是 P3 的过度推论；P6 的成立范围是 LOCC 类通道，而非一切经典模型。]
)

= 逻辑重建

*原始论证的正确内容（P1）*：在局域中介假设下，纠缠的生成排除局域经典通道。这是量子信息的标准定理，无争议。

*反例的正确内容（P3）*：一个具体的经典-量子混合理论可以产生可观测量。其价值在于把 P1 的*前提*显式化——P1 的有效范围取决于"局域中介"假设的精确形式。

*反例的过度推论（P4）*：从"存在一个能复现的混合模型"推出"因此不能证明量子化"，忽略了两点：该模型的物质扇区本身是量子的（P5 的解剖）；牛顿引力加经典非局域演化同样产生纠缠（Marchese 等 2025），说明 P1 的排除对象本来就是 LOCC 而非"一切经典"。

*反驳的正确内容（P5、P6）*：纠缠通道在物质扇区，标准推断对 LOCC 类通道完整保留。

= 净产出：一套精确表述

论战的净产出不是胜负，而是以下表述的确立：

#set par(first-line-indent: 0em)
- GIE 是 *LOCC 排除器*：观测到纠缠排除局域经典通道，不排除一切经典模型。
- 判决对象必须精确化：不同排除强度对应不同模型类（LOCC / 半经典 / 混合）。
- 前提必须显式化：局域中介假设是 P1 的输入，不是导出。
- 实验成本的量级（10⁹–10²¹ 次）与装置反冲约束（~100 μm）构成该命题的工程边界。
#set par(first-line-indent: 2em)

这四条正是判决矩阵第 6-7 行的内容。方法论结论：*当一场争论的三方都部分正确时，科学的产出是命题的精确分离，而非胜负*——这是箭头纪律在真实实践中的一次完整发生。

= 附：三模型模拟摘要

四维希尔伯特空间的数值模拟实现上述排除逻辑：量子模型负度 $N approx 0.078$ 与 CHSH 违背 0.024；平均场与 LOCC 模型严格为零；连续变量验证以 $e^(-2 alpha^2)$ 偏差收敛。模拟不偏向任何一方——它精确呈现 P1 的有效范围。

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. Bose, S. et al. *Phys. Rev. Lett.* 119, 240401 (2017).
2. Aziz, A. & Howl, R. *Nature* (2025)（及配套批评文献）.
3. Marletto, C., Oppenheim, J., Vedral, V. & Wilson, A. arXiv:2511.07348 (2025).
4. Tibau Vidal, N. & Varna Iyer, A. arXiv:2607.03429 (2026).
5. Marchese, M. M. et al. *Phys. Rev. A* 111, 042202 (2025).
6. Céleri, L. C. et al. arXiv:2607.08819 (2026).
