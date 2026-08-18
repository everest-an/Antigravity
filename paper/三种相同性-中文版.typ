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
  #text(size: 16pt, weight: "bold")[三种相同性：统一断言的完备分类]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · T1 论文（第一版，含证伪条款）]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　"统一场论"一词被用于三类逻辑上不同的断言：转换式（一种场物理地转化为另一种场）、几何式（多种场是高维几何的投影）、代数式（多种理论共享更深的代数结构）。本文证明：这三类穷尽了所有"物理现象 A 与 B 是同一件事"的可检验断言——相同性断言只有三种形式：映射、共同投影、共享不变量。证明以理论的形式化框架（理论即范畴，Halvorson 2019）与对偶等价的形式化文献（De Haro-Butterfield 2018；Weatherall 2018）为语言，并以 De Haro-Butterfield 2025 年专著《The Philosophy and Physics of Duality》为对话对象：该专著把映射型相同性（理论等价）形式化到权威形态，本文把它扩展为包含投影型与不变量型的完备三分。三类形式各自对应一种证据格局（定量判决/窗口收窄/本体沉默），从而解释了为什么三类统一以不同方式失败、需要不同实验判决——这正是判决矩阵方法论的形式基础。本文包含显式证伪条款：若发现第四种相同性结构，分类即被修正。

*关键词*　统一场论；理论等价；范畴论；对偶；科学实在论
]

#pagebreak()

= 引言

统一场论的历史叙事把三类不同的断言混为一个词，造成百年混乱。区分它们（见配套论文《三种统一》）是第一步；证明它们*穷尽*可能性是第二步，也是本文的任务。一个分类的完备性证明把它从"许多观点之一"升格为"全部可能性的穷举"——这是该分类能作为方法论基础的资格条件。

= 形式框架

== 理论即范畴

采用 Halvorson（2019）的框架：一个物理理论 $T$ 是一个范畴，其对象为物理系统的模型，态射为物理允许的变换。两个理论的"相同"因此有三种基本形式——这是范畴论的标准词汇：

#set par(first-line-indent: 0em)
- *映射*：函子 $f: T_A arrow T_B$（可能为等价），把 A 的结构翻译为 B 的结构；
- *共同投影*：存在第三理论 $T_C$ 与函子 $p_A: T_C arrow T_A$、$p_B: T_C arrow T_B$（A、B 均为 C 的商/纤维）；
- *共享不变量*：存在代数/范畴不变量 $K$，使得 A 与 B 均为 $K$ 的表示或实现。
#set par(first-line-indent: 2em)

对偶等价的形式化文献（De Haro-Butterfield；Weatherall）处理的主要是第一种形式（理论之间的等价映射），其框架可以自然扩展到后两种。

== 相同性断言的定义

*定义*。一个"相同性断言"是一个由观测数据支撑的命题 $P(A,B)$："物理现象 A 与 B 是同一件事"，且 $P$ 的实现必须是一个可计算的结构——即 A 与 B 的结构之间存在一个可由数据检验的具体关系。

= 定理：三分完备性

#set par(first-line-indent: 0em)
*定理（相同性断言的三分完备性）*。设 $P(A,B)$ 为如上定义的相同性断言。则 $P$ 的结构基础必为以下三种之一（或三种的复合）：

(1) *映射型*：存在保持 A 的可观测结构的映射至 B（对称、对偶或动力学转换）——对应转换式统一；

(2) *投影型*：A 与 B 均为共同母结构 C 的投影/限制——对应几何式统一；

(3) *不变量型*：A 与 B 共享一个代数或运动学不变量 K——对应代数式统一。

不存在第四种基础结构。
#set par(first-line-indent: 2em)

*证明草图*。相同性断言的结构基础由 A 与 B 之间的范畴关系给出。范畴论的基本事实：两个范畴之间的任何关系都可分解为函子（映射）、万有构造（极限/余极限——共同域的投影）与不变量（表示/模结构的核）三类原料的复合。若 P 的实现是可计算的（按定义），其范畴实现必为可构造的函子关系，故必为三类原料的复合。三类原料恰好对应三种统一。若出现不可分解为三类的第四种，则 P 的实现不可计算，与定义矛盾。证毕（完整形式化版本待后续工作给出；本文的定位是给出证明的结构与证伪条款）。

= 物理对应：三结构 ↔ 三证据格局

三种结构各自决定一种证据格局，这解释了三种统一的不同命运：

#figure(
  table(
    columns: (0.9fr, 1.9fr, 1.9fr, 1.6fr),
    align: (left, left, left, left),
    [*结构*], [*物理原型*], [*证据格局*], [*判决方式*],
    [映射], [电磁对偶（自对偶扇区）；Lorentz 变换], [定量可算], [直接计算（Schwinger 反推）],
    [投影], [Kaluza-Klein 纤维化], [窗口收窄], [轨道约束 + 核钟窗口],
    [不变量], [double copy 的 kinematic algebra], [本体沉默], [不可由计算判决],
  ),
  caption: [表 1：三种结构、三种证据格局、三种判决方式的一一对应。]
)

这一对应是判决矩阵方法论的形式基础：矩阵的每行先被归类为某种相同性断言，再按该类的证据格局配置判决通道——不是方法论的选择，而是结构的必然。

= 与 De Haro-Butterfield（2025）的关系

De Haro 与 Butterfield 的 2025 年专著《The Philosophy and Physics of Duality》（Oxford University Press，开放获取）把对偶的哲学形式化推进到权威形态：理论即带结构范畴、对偶为等价映射，并给出理论等价判据与基于对偶的实在论论证。本定理与该专著的关系是三重：

#set par(first-line-indent: 0em)
(1) *包含*。专著处理的"相同性"是本文分类中的第一类（映射型）——他们给出其最精密的现代形式化。本文不作重复，而是直接引用：映射型的全部形式内容以专著框架为准。

(2) *推广*。本文证明相同性断言只有三类，映射型只是其中之一。投影型（Kaluza-Klein 纤维化、AdS/CFT 全息）与不变量型（double copy 的运动学代数）在专著框架中作为例子出现，本文把它们升格为与映射型并列的完备分类成员——"共同投影"与"共享不变量"是两种逻辑上独立于等价映射的相同性结构。

(3) *检验性连接*。本文的"三结构对应三证据格局"（表 1）为专著的实在论讨论提供了一条其未系统化的维度：相同性断言的结构类型决定其可检验方式——映射型可计算判决、投影型窗口收窄、不变量型本体沉默。这是从"理论等价的形式判据"到"统一断言的检验策略"的桥，也是判决矩阵方法论在哲学文献中的立足点。
#set par(first-line-indent: 2em)

*方法论声明*：本文不挑战专著的对偶等价判据；本文声称的是，当物理学家说"A 与 B 是同一件事"时，其断言的结构基础只有三种，每种对应不同的证据命运——这一命题在专著框架内表述为范畴事实（三分完备性定理），并以证伪条款公开其修正条件。定位上，本文面向科学哲学（SHPSM/Philosophy of Science）读者：三分完备性是哲学命题，物理内容（判决矩阵、脚本）是其检验支撑。

= 证伪条款

本定理包含显式证伪条款：*若存在一个可检验的相同性断言，其结构基础不可分解为映射/投影/不变量三类，则本定理被证伪，分类被修正*。历史上"第四种"的候选——共同边界条件的对偶（bulk-boundary 对应）——在本文框架内属于投影型（AdS/CFT 是全息投影）；若未来的新物理提供真正的第四种，分类随之扩展。完备性证明的价值恰在于它使这种修正可被精确描述。

= 结论

三种统一不是许多观点之一，而是相同性断言的三种可能结构。此完备性使三类统一的证据格局差异成为结构必然，使判决矩阵成为该结构的操作化。本文是第一版，证明的形式化细节（函子分解的完整表述）留待后续工作；证伪条款保证其科学地位。

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. Halvorson, H. *Scientific Theories* (Oxford, 2019).
2. Butterfield, J. & De Haro, S. et al. On Dualities and Equivalences Between Physical Theories. arXiv:1806.01505 (2018).
3. Weatherall, J. O. Theoretical Equivalence in Physics. arXiv:1810.08192 (2018).
4. De Haro, S. Conceptual Aspects of Gauge/Gravity Duality. arXiv:1509.09231 (2015).
5. De Haro, S. & Butterfield, J. *The Philosophy and Physics of Duality* (Oxford University Press, 2025), 624 pp, open access. arXiv:2508.01616.
6. Book review: Metascience 35, 9 (2026), DOI 10.1007/s11016-026-01101-7.
7. Bern, Z., Carrasco, J. J. & Johansson, H. (double copy 纲领综述系列).
8. Kaluza, T. (1921); Klein, O. (1926)（纤维化原型）.
9. MuningAn. 三种统一：量子引力前沿的一张可证伪地图（2026）.

#v(0.4em)
*致谢声明*　本文的范畴语言只用于分类骨架；物理内容全部来自配套论文与文献。
