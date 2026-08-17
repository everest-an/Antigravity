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
  #text(size: 16pt, weight: "bold")[钍-229 核钟检验引力的额外自由度：实验设计方案]
  #v(0.4em)
  #text(size: 12pt)[路线 B：先验证"时空是否存在可调控的额外自由度"，再谈工程操控]
  #v(0.4em)
  #text(size: 11pt)[MuningAn · PlanetarySystem · 2026-08 · 版本 1.0（对接实验组用）]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　本方案的目标不是"反重力样机"，而是检验引力是否存在可调控的额外自由度。实验以钍-229 核钟为核心仪器，在椭圆轨道上测量核同质异能态跃迁频率的引力调制：经典广义相对论给出固定的基线信号（分数调制 $1.3 times 10^(-11)$），Kaluza-Klein 额外维度在基线上叠加 $Delta E approx 2.8 alpha "eV"$ 的额外分量（$alpha$ 为最轻额外模式耦合）。以核钟目标分数稳定度 $10^(-18)$ 计，实验可覆盖 $alpha$ 低至 $3 times 10^(-18)$（力程 $lambda > 10^7 "m"$），比现有轨道约束深约三个数量级。方案分两阶段执行：阶段一建立经典基线（排除系统误差），阶段二搜索偏离（判决窗口钉死或打开）；进阶阶段以核自旋态主动调控检验耦合是否态相关。本方案给出核心参数表、预期信号量级、系统误差来源分析与判决公式。零结果同样具有发表价值：$alpha < 10^(-17)$ 的约束即 PRL 级成果。

*关键词*　钍-229；核钟；Kaluza-Klein；引力 Aharonov-Bohm；等效原理；精密测量
]

#pagebreak()

= 科学定位与目标

*定位*：本实验属于"检验引力基本属性并探索其可调控性"的正统前沿物理，不是"反重力装置"研制。表述纪律：审稿与答辩场合一律使用"引力额外自由度检验"，不使用"反重力"一词作为实验目标。

*科学目标*（分层）：

#set par(first-line-indent: 0em)
- *目标 1（必达）*：以核钟首次完成引力红移/引力 Aharonov-Bohm 效应的核跃迁级测量，建立经典基线。
- *目标 2（必达）*：在 neV 窗口给出 $alpha$ 的约束或信号，把 Kaluza-Klein 参数空间钉死或打开。
- *目标 3（可选，进阶）*：主动调控核自旋态，检验引力耦合是否态相关——若测得态相关性，则直接证明引力存在可工程调控的额外自由度（同时证伪广义相对论与标准 Kaluza-Klein，指向新的耦合通道）。
#set par(first-line-indent: 2em)

*零结果价值*：目标 2 的零结果给出 $alpha < 10^(-17)$ 量级约束，比现有轨道约束（约 $10^(-15)$）深两个数量级以上，独立发表即具 PRL / Nature Physics 级价值。

= 物理原理与窗口位置

== 信号形式

额外紧致维的最轻引力子模式对牛顿势贡献 Yukawa 修正

$ V(r) = - (G m_1 m_2)/(r) (1 + alpha e^(-r/lambda)), $ <eq-kk>

其中 $alpha$ 为相对标准引力的耦合强度，$lambda$ 为 Compton 力程。绕引力体自由下落的量子系统获得能级分裂

$ Delta E = m_"sys" alpha Delta Phi(r, lambda), $ <eq-ab>

$Delta Phi$ 为修正势沿轨道的峰-峰变化。对钍核（$m_"Th" approx 3.8 times 10^(-25) "kg"$）在低地球轨道（高度 400 km、偏心率 0.01）的配置，$Delta Phi approx 2 g a e approx 1.18 times 10^6 "m"^2/"s"^2$（经典部分），故

$ Delta E approx 2.8 alpha "eV". $ <eq-signal>

== 窗口位置

反解式 @eq-ab 的历史约束：核系统 eV 级分裂需要 $alpha approx 0.4$，被轨道第五力约束排除 7-8 个数量级；meV 级需要 $alpha approx 10^(-3)$，同样被排除。允许窗口因此位于 neV 及以下。式 @eq-signal 表明：现有轨道约束 $alpha ~ 10^(-15)$ 对应 $Delta E ~ 3 "feV"$——恰好落在核钟目标灵敏度的覆盖范围内。这就是本实验的窗口位置：*不是"有没有信号"，而是"现有约束与核钟灵敏度之间的三个数量级由谁先填上"*。

== 经典基线

经典通道（无额外维）的引力红移调制为轨道引力势的峰-峰变化：

$ (Delta nu)/(nu) = (Delta Phi)/(c^2) approx 1.31 times 10^(-11) $ <eq-baseline>

调制频率即轨道频率 $f_"orb" approx 1.80 times 10^(-4) "Hz"$。此基线在数值上恒等于经典引力红移的轨道变化（引力 Aharonov-Bohm 效应的判读见文献），其作用有三：系统误差调试靶标、广义相对论核钟检验、阶段二信号扣除的参照。

= 实验设计：两阶段 + 进阶

== 阶段一：经典基线测量

#set par(first-line-indent: 0em)
- *装置*：钍-229 固态核钟（现有平台：148.18 nm 激光直接激发已实现；CaF₂ 宿主半衰期 $447 plus.minus 25 "s"$；X 射线淬灭读出周期加速 ≥50 倍）。
- *操作*：将核钟置于已知引力势差环境中（地面：垂直高度差 1 m，$g Delta h/c^2 approx 1.09 times 10^(-16)$；在轨：式 @eq-baseline 的全幅调制），测量同质异能态跃迁频率随势差的移动，复现广义相对论预言。
- *判决*：地面基线要求分数稳定度优于 $10^(-16)$（对应无自旋宿主晶体路线，Th(SO#sub[4])#sub[2] 预期不稳定度 $4.6 times 10^(-23)/sqrt(tau)$）；在轨基线对稳定度要求低四个数量级，可用于早期系统误差调试。
#set par(first-line-indent: 2em)

== 阶段二：KK 偏离搜索

#set par(first-line-indent: 0em)
- *操作*：在轨配置下，于轨道频率处拟合总调制幅度 $A_"tot" = A_"GR" + A_"KK"$，其中 $A_"GR"$ 由式 @eq-baseline 精确建模，残差即 $A_"KK" = 2.8 alpha "eV"$（能量单位）。
- *判据（零结果）*：$|A_"KK"| < 3 sigma_"clock"$，给出 $alpha < alpha_"min"(lambda)$ 的约束曲线（第 5 节表 3）。
- *判据（正信号）*：残差非零，且 (i) 幅度落在 neV 量级；(ii) 随轨道几何按 Yukawa 修正的相位变化；(iii) 与经典建模无关（交叉检验：不同高度/不同偏心率轨道）。
#set par(first-line-indent: 2em)

== 进阶阶段：主动调控演示

#set par(first-line-indent: 0em)
- *操作*：外加微波/磁场调控核自旋极化态，观测耦合强度是否随操控参数变化。
- *理论定位（必须写清）*：标准 Kaluza-Klein 的耦合 $alpha$ 是常数，*不*依赖核自旋态；若测得态相关性，则证伪的不仅是广义相对论，还有标准 Kaluza-Klein——该信号指向一种新的、态相关的引力耦合通道。因此本阶段的正确表述是"态相关引力耦合的搜索"，而非"调 $alpha$"。这一表述纪律是方案区别于民科提案的关键。
#set par(first-line-indent: 2em)

= 核心参数表

== 仪器参数（表 1）

#figure(
  table(
    columns: (1.2fr, 2.2fr, 1.4fr),
    align: (left, left, left),
    [*参数*], [*数值*], [*来源/状态*],
    [跃迁能量], [8.355733554021(8) eV], [2024 精确测量],
    [波长 / 半衰期], [148.18 $plus.minus$ 0.42 nm；$447 plus.minus 25$ s（CaF₂ 实测）], [Nat. Commun. 2024],
    [固态宿主寿命], [641 s（CaF₂）], [2025 综述],
    [当前线宽], [kHz 量级（晶体展宽主导）], [现状],
    [目标稳定度], [$4.6 times 10^(-23)/sqrt(tau)$（Th(SO#sub[4])#sub[2]）], [理论预期，2025],
    [读出], [X 射线淬灭，周期加速 ≥50 倍], [Nat. Commun. 2024],
  ),
  caption: [表 1：钍-229 核钟仪器参数。]
)

== 平台参数（表 2）

#figure(
  table(
    columns: (1.2fr, 2.2fr, 1.4fr),
    align: (left, left, left),
    [*参数*], [*数值*], [*说明*],
    [轨道], [400 km 高度，$e = 0.01$], [LEO，$a = 6771$ km],
    [轨道频率], [$1.80 times 10^(-4)$ Hz], [调制频率即此值],
    [经典 $Delta Phi$], [$1.18 times 10^6$ m²/s²], [峰-峰，$2 g a e$],
    [经典调制 $Delta nu/nu$], [$1.31 times 10^(-11)$], [式 (4)],
    [核质量], [$3.8 times 10^(-25)$ kg], [$m_"Th"$],
    [信号系数], [$Delta E = 2.8 alpha$ eV], [式 (3)],
  ),
  caption: [表 2：轨道平台与信号系数。]
)

== 可达性（表 3）

#figure(
  table(
    columns: (1.1fr, 1.6fr, 1.6fr, 1.6fr),
    align: (left, left, left, left),
    [*力程 $lambda$*], [*抑制因子 $e^(-a/lambda)$*], [*$alpha_"min"$（$10^(-18)$ 目标）*], [*现有约束*],
    [$10^6$ m], [$1.1 times 10^(-3)$], [$2.7 times 10^(-15)$], [$~10^(-15)$（MICROSCOPE）],
    [$3 times 10^6$ m], [$0.10$], [$2.9 times 10^(-17)$], [$~10^(-15)$],
    [$10^7$ m], [$0.51$], [$5.9 times 10^(-18)$], [$~10^(-15)$],
    [$10^9$ m], [$0.99$], [$3.0 times 10^(-18)$], [$~10^(-11)$（LLR）],
  ),
  caption: [表 3：不同力程下的可达性与现有约束对比。$alpha_"min" = delta E/(m_"Th" Delta Phi) times e^(a/lambda)$，$delta E = 8.36 "eV" times 10^(-18)$。实验在 $lambda > 10^6 "m"$ 窗口比现有约束深 2-8 个数量级。]
)

= 系统误差来源分析

#figure(
  table(
    columns: (1.5fr, 1.3fr, 2.6fr, 1.6fr),
    align: (left, left, left, left),
    [*误差源*], [*量级（现状）*], [*控制方法*], [*目标*],
    [轨道确定], [cm 级 → $delta Phi/c^2 ~ 10^(-15)$], [SLR/GNSS 精密定轨 + 事后重处理], [mm 级 → $10^(-16)$],
    [重力场模型], [J2 以上多极建模 $~10^(-10)$], [高阶多极 + 时变场模型], [$10^(-18)$ 级残差],
    [潮汐/大气], [时变，$~10^(-12)$], [共模扣除 + 双钟比对], [≤ $10^(-17)$],
    [晶体场四极频移], [kHz 级（当前主导误差）], [无自旋宿主 + 电四极抑制], [mHz 级],
    [温度漂移], [参数化（待标定）], [mK 级控温 + 原位标定], [由实验组标定],
    [磁场 Zeeman], [一阶敏感], [魔角取向 / 自旋零宿主], [一阶消除],
    [X 射线淬灭循环], [占空比效应], [循环相位锁定], [≤ $10^(-18)$],
    [星地比对链], [$~10^(-16)$], [光频梳/微波双向链], [$10^(-18)$],
  ),
  caption: [表 4：系统误差预算。标"参数化"的条目需实验组以实际平台标定；本表给出的是控制方法与目标量级，而非承诺值。]
)

判读：系统误差的主战场不是灵敏度，而是*经典基线的精确建模*——阶段二信号与经典调制处于同一轨道频率，必须靠建模精度分离，而非靠频谱区分。这是本方案与引力 Aharonov-Bohm 实验的判读完全同构之处，也是阶段一存在的意义。

= 判决标准（公式化）

#set par(first-line-indent: 0em)
- *零结果判决*：$|A_"KK"| < 3 sigma$ 则 $alpha < alpha_"min"(lambda)$，$alpha_"min"$ 按表 3 给出；发表形式为约束曲线 $alpha(lambda)$。
- *正信号判决*：残差非零且同时满足 (i) 量级 neV；(ii) Yukawa 相位行为；(iii) 跨轨道配置的交叉验证。
- *态相关判决（进阶）*：耦合随核自旋极化态变化 → 证伪 GR 与标准 KK，指向新通道；不变 → 排除态相关耦合至实验灵敏度。
#set par(first-line-indent: 2em)

= 里程碑与产出

#figure(
  table(
    columns: (0.9fr, 2.2fr, 1.6fr, 1.8fr),
    align: (left, left, left, left),
    [*里程碑*], [*内容*], [*前置条件*], [*产出*],
    [M1], [参数空间、可达性、系统误差预算（本文档）], [无], [理论论文（可立即投稿）],
    [M2], [地面核钟红移测试（1 m 高度差，$1.09 times 10^(-16)$）], [无自旋宿主达到 $10^(-16)$], [GR 核钟检验 + 系统误差调试],
    [M3], [在轨基线 + KK 偏离搜索], [M2 + 搭载机会], [约束 $alpha < 10^(-17)$ 或正信号],
    [M4], [主动调控演示], [M3 正信号], [态相关耦合判决],
  ),
  caption: [表 5：里程碑。M1 现在即可完成；M2-M4 依赖宿主材料与搭载机会的进展。]
)

= 合作对接要点

#set par(first-line-indent: 0em)
- *理论合作者提供*：信号预言（式 1-4）、可达性表（表 3）、系统误差预算（表 4）、判决公式（第 7 节）、参数扫描代码与三模型歧视模拟（配套仓库已具备）。
- *实验组提供*：核钟平台、环境频移原位标定、轨道搭载或地面引力势差平台。
- *候选合作组*：华中科技大学引力中心、中国科学技术大学精密测量院、上海光机所及欧洲 Th-229 核钟组。
- *成本模式*：理论合作者零硬件投入；地面基线实验可在现有核钟平台上开展。
#set par(first-line-indent: 2em)

= 与既有约束的相容性核对

本方案的全部参数均落在未被排除的窗口：目标参数区间（$lambda > 10^6 "m"$，$alpha > 10^(-18)$）位于 MICROSCOPE（$alpha ~ 10^(-15)$）与 LLR 约束之下的开放区；实验本身不引入新相互作用假设（标准 KK 是既有理论框架），不与 Eöt-Wash、第五力短程约束冲突。方案引入的假说只有一条，且已显式标注（第 3.3 节：态相关耦合是*待检验的猜想*，不是方案预设的前提）。

= 结论

本方案以最低成本回答最高价值的问题：*时空是否存在可调控的额外自由度*。两阶段设计保证每一步都有独立产出——基线测量本身即是核钟引力红移的首次检验；偏离搜索的零结果是两个数量级的约束提升；正信号则打开引力工程的第一扇门。方案的学术安全来自三点：目标表述纪律（检验属性，不宣称工程）、零结果价值（约束即成果）、参数合规（全部落在未被排除的窗口）。

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
