#set page(paper: "a4", margin: (x: 2.2cm, y: 2.4cm), numbering: "1 / 1")
#set text(font: ("New Computer Modern", "SimSun"), size: 10.5pt, lang: "zh")
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

#align(center)[
  #text(size: 17pt, weight: "bold")[三种统一：量子引力前沿的一张可证伪地图]
  #v(0.5em)
  #text(size: 11.5pt)[MuningAn$""^1$ · PlanetarySystem$""^1$]
  #v(0.3em)
  #text(size: 9.5pt)[$""^1$ PlanetarySystem。通讯作者：MuningAn。配套仓库：github.com/everest-an/Antigravity]
]

#par(justify: false, first-line-indent: 0em)[
*摘要*　"统一场论"一词混淆了三个逻辑上完全不同的主张。本文分离三个主张并逐一赋予其证据格局，然后给出可复现的定量判决。*论点一*：转换式统一（一种场物理地转化为另一种场）对实验室电磁源已被证伪——产生地球量级引力所需场强约为 Schwinger 极限的八倍，该处真空已不稳定。*论点二*：几何式统一（已知作用力是高维几何的投影）仍开放但被收窄——其引力 Aharonov-Bohm 信号在电子伏特尺度被轨道约束排除，唯一窗口在钍-229 核钟可及的纳电子伏特量级。*论点三*：代数式统一（规范理论与引力共享更深运动学代数）是已确立的数学事实，但对本体论保持沉默。在此之上，我们证明*控制通道唯一性定理*：广义相对论加标准模型之内，保持源、度规与通道不变的工程操作不改变任何测地线运动，故惯性工程没有独立于应力能量工程的自由度。我们进一步将十九个活跃命题编为*判决矩阵*，每行携带判别实验、判决对象与时间尺度；十六行由六个可复现计算锚定（第 7 节）。本文产物是一张描述性地图而非新理论：它解释百年民间提案失败的具体位置，并指出时空源变量的三个存活候选，每一个都有已排期的实验。
]
#par(justify: false, first-line-indent: 0em)[
*关键词*　统一场论；double copy；量子引力；引力诱导纠缠；等效原理；可证伪性；核钟
]

#pagebreak()

= 引言

== 研究背景：一个世纪的混淆

"统一场论"这一短语至少被用于三个不同的思想事业，三者的混用是百年混乱的根源。第一个事业追求物理转换：把一种场变成另一种场的过程，例如民间流传的"变化的电磁场产生引力"。第二个事业追求几何嵌入：一个高维几何，其投影包含已知作用力，这是 Kaluza 与 Klein 开辟的路线。第三个事业追求代数同一：一种运动学结构，两个不同理论的振幅都从它导出，这是 double copy 计划今天正在实现的路线。三个事业有不同的证据基础、以不同方式失败、需要不同种类的实验来判决。因此，对"统一场论"的一揽子否定与一揽子肯定同样没有信息量。

民间叙事提供了反面的典型案例。Tesla 在 1937 年确曾公开声称完成"Dynamic Theory of Gravity"，但不存在可信一手证据表明他发表过完整理论，更不存在证据表明其中包含"引力门"或"旋转电磁场反重力"内容。张祥前的《统一场论》则提供了另一个可解剖的样本：其推导链的前两步（电磁场的洛伦兹变换关系及其对时间求导）是标准物理，第三步——把加速度项解释为引力场——是额外的物理解读，没有任何动力学内容。两者的失败模式相同：*箭头是被断言的，而不是被推导的*。这一诊断正是本文方法论的起点。

== 本文的论点、贡献与结构

本文围绕三个论点展开，每个论点由明确的论据支撑：

#set par(first-line-indent: 0em)
- *论点一*（第 3 节）：转换式统一已被定量证伪。论据：Schwinger 极限反推（式 1）；第五力约束全景（式 2、图 2）。
- *论点二*（第 4 节）：几何式统一的开放窗口已知。论据：Kaluza-Klein 参数化与 Aharonov-Bohm 分裂反解（式 3、4）；核钟硬件现状。
- *论点三*（第 5 节）：代数式统一对本体论沉默。论据：double copy 的三个代数事实；残余对称代数坍缩。
#set par(first-line-indent: 2em)

在三个论点之上，第 6 节给出控制通道唯一性定理及其三个推论，第 7 节给出支撑全文的六个可复现计算，第 8 节将全部结论综合为十九行判决矩阵，第 9 节讨论应用，第 10 节讨论局限与争议，第 11 节总结。

= 理论框架：三种统一的定义与失败模态

== 三个定义

#set par(first-line-indent: 0em)
*定义 1（转换式统一）。* 转换式统一断言存在一个从场 $A$ 到场 $B$ 的物理映射，使得工程化 $A$ 通过动力学本身产生 $B$，无需引入额外结构。

*定义 2（几何式统一）。* 几何式统一断言 $A$ 与 $B$ 被嵌入为单一几何对象的分量，二者均由投影得到，且不声称 $A$ 产生 $B$。

*定义 3（代数式统一）。* 代数式统一断言存在一个共享的代数或运动学结构，两个理论的振幅按固定规则由它导出，同样不涉及转换。
#set par(first-line-indent: 2em)

== 三种失败模态

三种主张以不同模态失败，这是全文的组织原则。转换式统一定量地失败：它是动力学主张，其数字可以被算出来。几何式统一的失败（当它失败时）表现为收窄：其独有信号被逐轮实验驱赶进越来越窄的窗口。代数式统一作为数学根本不失败；它缺少的是本体论判决，而任何有限计算都无法提供这一判决。表 1 汇总三个主张的定义、失败模态与判决通道。

#set par(first-line-indent: 0em)
#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    [*类型*], [*命题*], [*失败方式*], [*判决通道*],
    [转换式], [$A$ 场物理地转化为 $B$ 场（Tesla/张祥前路线）], [定量失败（初等算术）], [Schwinger 反推 + 第五力全景],
    [几何式], [$A$、$B$ 是高维几何的投影（Kaluza-Klein）], [窗口收窄（未被排除）], [轨道约束 + 核钟 neV 窗口],
    [代数式], [$A$、$B$ 共享更深运动学代数（double copy）], [本体论沉默（数学成立）], [不可直接判决（归纳问题）],
  ),
  caption: [表 1：三种统一的定义、失败模态与判决通道。]
)
#set par(first-line-indent: 2em)

== 与既有文献的关系

三组文献与本文最近，差异须显式陈述。其一，三分类本身：对"统一类型 + double copy"分类方案的系统预印本检索未发现先例；最近的讨论是物理哲学中统一与还原的区分，本分类不试图涉足。其二，曲速引擎 no-go 文献：Bobrick 与 Martire 证明任何曲速引擎都是惯性运动的物质壳、必然需要推进；Le 证明正能引擎转向必须辐射并损失质量；Barzegar、Buchert 与 Vigneron 对曲速时空完成分类并证明新 no-go 定理。这些结果是第 6 节定理假设下的特殊情形，本文将其推广到任意工程操作。其三，"metric engineering"一词继承自 Puthoff（2010），其探索性口吻在本文被替换为具体判决。

= 论点一：转换式统一已被定量证伪

*论点陈述*：对实验室电磁源，"变化的电磁场产生引力"这一转换式主张在量级上不可能——所需场强超越真空稳定极限，因而该主张作为工程命题被证伪。

== 论据 A：Schwinger 极限反推

相关物理没有争议：电磁应力能量张量以其全部内容——能量密度加压强——进入爱因斯坦方程。唯一的问题是量级。场强 $E = 10^7 "V/m"$、体积一立方米的电容器携带约 $440 "J/m"^3$ 的能量密度，产生引力加速度约 $10^(-25) "m/s"^2$，比地球重力小二十五个数量级。

反推比正算更有信息量。以电磁能量密度为源反解泊松方程（因子 2 记录压强内容），产生目标加速度 $g$、特征尺度 $L$ 所需的场强为

$ E_"needed" = sqrt((2 rho_"needed") / epsilon_0), quad rho_"needed" = (g c^2) / (8 pi G L). $ <eq-schwinger>

对 $g = 9.8 "m/s"^2$、$L = 1 "m"$，所需场强为 $1.1 times 10^19 "V/m"$，约为 Schwinger 极限 $E_S = m_e^2 c^3/(e ℏ) approx 1.3 times 10^18 "V/m"$ 的八倍——该处量子真空对自发正负电子对产生不再稳定。到那一步，计划的性质已经改变：*你制造的是物质，而不是引力工程*。式 @eq-schwinger 不依赖任何臆测物理，直接关闭了实验室电磁源的转换式纲领。

== 论据 B：第五力约束全景

同一算术约束相邻的第五力窗口。牛顿引力的 Yukawa 修正为

$ a_Y (r) = alpha (G M)/(r^2) (1 + r/lambda) e^(-r/lambda), $ <eq-yukawa>

其中 $alpha$ 为相对 $G$ 的耦合强度、$lambda$ 为力程。约束反推结果如图 2 与第 7.5 节所示：在所有已探测尺度上，$alpha$ 为 $O(1)$ 的修正均被排除——$lambda = 10 μ"m"$ 处约 $3 times 10^(-3)$（Eöt-Wash 扭秤），毫米至百公里尺度 $10^(-6)$，轨道与月球尺度 $10^(-9)$ 至 $10^(-15)$。唯一留下的开口在十微米以下，那里 Casimir 力占主导，需专门平台。

#figure(
  image("../figures/fig04_fifth_force.png", width: 86%),
  caption: [图 2：第五力约束全景。Yukawa 耦合随力程的最强联合约束；星号标记 eV 级 Kaluza-Klein 分裂声明所需的耦合强度，落在被排除区外 7-8 个数量级。]
)

== 论证：从证据到论点

两个论据以不同方式指向同一结论。论据 A 从正面给出量级判决：转换所需的场强不可达，且"不可达"的原因不是技术而是原理（真空稳定性）。论据 B 从侧面封锁替代路线：即便放弃电磁场而诉诸"第五力"，参数空间也已被现有实验排除。两者合起来构成对转换式统一的完整证伪——不是"尚未找到方法"，而是"该类别的方法在原理上不可行"。

= 论点二：几何式统一的开放窗口已知

*论点陈述*：Kaluza-Klein 型几何式统一既未确立、亦未排除，但其可检验内容已精确化——电子伏特窗口被轨道约束关闭，唯一开放窗口在纳电子伏特量级，且探测器硬件已就绪。

== 论据 A：参数化与 Aharonov-Bohm 分裂反解

额外紧致维贡献引力子模式塔，其最轻态对引力势产生 Yukawa 型修正

$ V(r) = - (G m_1 m_2)/(r) (1 + alpha e^(-r/lambda)), $ <eq-kk>

其中 $alpha$ 表征最轻额外模式相对标准引力的耦合、$lambda$ 为其 Compton 力程。引力 Aharonov-Bohm 方案把这一修正转化为谱学预言：绕引力体自由下落的量子系统获得能级分裂

$ Delta E = m_"sys" alpha Delta Phi(r, lambda), $ <eq-ab>

其中 $Delta Phi$ 为修正势沿轨道的峰-峰变化。反解式 @eq-ab：核系统 eV 级分裂需要 $alpha approx 0.4$，原子系统 meV 级分裂需要 $alpha approx 10^(-3)$——两者都被论据 B（第 3.2 节）的轨道约束排除四到八个数量级。因此允许窗口落在纳电子伏特量级。

== 论据 B：核钟硬件现状

该窗口的探测器已基本就绪，四个节点全部落地（表 2）：钍-229 同质异能态跃迁已在 VUV 透明晶体中被 $148.18 plus.minus 0.42 "nm"$ 激光直接激发，半衰期 $447 plus.minus 25 "s"$；固态宿主寿命超过六百秒；无自旋宿主晶体 Th(SO#sub[4])#sub[2] 消除主要磁偶极展宽通道，预期不稳定度 $4.6 times 10^(-23) / sqrt(tau)$；X 射线淬灭实现按需去布居，读出周期加速五十倍以上。

#set par(first-line-indent: 0em)
#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, left),
    [*节点*], [*内容*], [*文献*],
    [直接激发], [$148.18 plus.minus 0.42 "nm"$，半衰期 $447 plus.minus 25 "s"$], [Hiraki 等, Nat. Commun. 2024],
    [固态宿主], [$"CaF"_2$ 中寿命 641 s], [Girvin-Radzihovsky, 2025],
    [无自旋宿主], [Th(SO#sub[4])#sub[2]，不稳定度 $4.6 times 10^(-23) / sqrt(tau)$], [Morgan 等, 2025],
    [读出加速], [X 射线淬灭，周期加速 ≥50 倍], [Hiraki 等, Nat. Commun. 2024],
  ),
  caption: [表 2：钍-229 核钟四个关键节点的现状。]
)
#set par(first-line-indent: 2em)

== 论证

论据 A 给出窗口位置（neV），论据 B 给出窗口的探测器。二者合起来把几何式统一从"模糊希望"转化为"有确定仪器、确定能量窗口的测量计划"。这一结论对 Kaluza-Klein 传统是最诚实的现状描述：不是证伪，而是收窄到可执行。

= 论点三：代数式统一对本体论沉默

*论点陈述*：double copy 是已确立的代数事实，但共享代数结构不蕴含共享物理内容；其本体论地位不可由计算判决。

== 论据 A：三个代数事实

其一，四维 off-shell $N=8$ 超引力在场的三次阶实现为 $N=4$ 超杨-米尔斯理论的 double copy。其二，相干态规范背景上的振幅 double copy 到弯曲时空上的振幅，其度规由规范背景构造；自对偶扇区中该映射联系精确真空解。其三，广义相对论的 Ehlers 变换是电磁对偶的 double copy——这一事实与 Tesla 时代的转换式抱负存在直接历史共鸣：Tesla 梦寐以求的"电磁-引力关系"，其现代形态是*对称代数结构的平方*，而非场的转换。

== 论据 B：残余对称代数坍缩

double copy 得到的 Schwarzschild 解的剩余规范代数从无穷维结构坍缩为有限维等距群。这一结果构成对过度解读的刹车：*代数结构可以共享，物理本体可以完全不同*。若共享代数自动意味着统一本体，则引力侧应保留规范侧的全部对称结构；坍缩事实表明并非如此。

== 论证

两个论据共同界定"代数式统一"这一概念的确切范围：它作为数学事实成立（论据 A），作为本体论主张不可判定（论据 B）。这是对 double copy 计划能声称什么的最精确边界——不是弱点，而是诚实评估的特征。

= 核心定理：控制通道唯一性

== 定理陈述与证明

#set par(first-line-indent: 0em)
*定理 1（控制通道唯一性）。* 设 $(M, g)$ 为广义相对论时空，$g$ 由给定源与边界条件决定。设 $E$ 为满足以下条件的工程操作：
(A1) *源不变*：$E$ 不改变 $(M, g)$ 中的任何场源，包括 $T_("μν")$、电磁流与全部标准模型源项；
(A2) *度规不干预*：$E$ 不把 $g$ 替换为不由 (A1) 之源与相同边界条件决定的解 $g'$；
(A3) *通道封闭*：$E$ 不引入标准模型之外的任何相互作用通道。
则 $E$ 不改变 $(M, g)$ 中任何测试粒子的测地线运动。
#set par(first-line-indent: 2em)

*证明*。测地线方程仅含 Christoffel 符号，后者由 $g$ 决定。$g$ 由场方程从 (A1) 之源与边界条件决定。(A2)(A3) 保持方程及其解不变。故 Christoffel 符号不变，运动方程不变，其解不变。证毕。

定理的内容在于 (A1)-(A3) 的*完备性*：它们穷尽广义相对论加标准模型之内可用的全部控制通道。违反 (A1) 是应力能量工程，即能量工程的别名；违反 (A2) 是度规工程，需要奇异物质或修改引力；违反 (A3) 是新物理，受第 3 节约束。

== 三个推论

#set par(first-line-indent: 0em)
*推论 1（惯性工程）。* 惯性质量等于引力质量（弱等效原理），而广义相对论只通过 $T_("μν")$ 与物质耦合。故惯性工程没有独立于应力能量工程的自由度。

*推论 2（质量杠杆效力）。* 对任何质量分解 $m = m_"Higgs" + m_"QCD" + m_"vac" + dots$，每一成分作为工程杠杆的引力效力等于 $partial T_("μν") / partial("该成分")$。Higgs 进入质子质量项约 9%；QCD 承载约 91%；真空贡献不可良定义（见第 7.6 节）。

*推论 3（有效质量）。* 超材料负有效质量是色散关系的性质，不改变 $T_("μν")$，对引力无直接后果。
#set par(first-line-indent: 2em)

== 边界声明

定理对经典广义相对论与经典源成立。量子叠加源、涌现几何假设与经典-量子混合模型在适用范围之外——这些排除项正是判决矩阵的开放行，本文不声称定理适用于它们。这一声明的必要性由第 10 节讨论。

= 实验部分：六个可复现计算

本节给出支撑三个论点与定理的六个可复现计算。每个实验按*目的-方法-结果-判决*四要素给出；全部代码在配套仓库中，可用单一入口一键运行。

== 实验一：GIE 协议的三模型歧视

*目的*：验证"观测到引力诱导纠缠（GIE）即排除局域经典通道"这一判决逻辑。

*方法*：两质量各处于空间叠加 $|L angle + |R angle$，只经引力作用。四分支 $|L L angle, |L R angle, |R L angle, |R R angle$ 的相对相位取精确式

$ phi = (G m^2 t)/(ℏ) (1/(d+Delta x) + 1/(d-Delta x) - 2/d), $ <eq-gie>

在四维希尔伯特空间构造三模型：(a) 量子引力（对角幺正）；(b) Schrödinger-Newton 平均场（局域相位）；(c) LOCC 经典通道（可分混合）。计算负度与最优 CHSH 违背。另以截断 Fock 空间的连续变量版本（分支相干态 $|plus.minus alpha angle$）验证 qubit 抽象的忠实性。

*结果*：基准参数下 $phi = 0.217 "rad"$，量子模型负度 $N approx 0.078$、CHSH 违背 0.024；平均场与 LOCC 模型严格为零。现实芯片参数下 $phi = 10^(-6) ~ 10^(-5) "rad"$，3σ 认证所需测量次数从约 200 次膨胀到 $10^9 ~ 10^21$ 次。连续变量负度以正比于 $e^(-2 alpha^2)$ 的偏差收敛于 qubit 结果（$alpha = 2$ 时偏差约 $10^(-4)$）。

*判决*：GIE 是 LOCC 排除器而非"一切经典"排除器（牛顿势加经典非局域演化可产生同样纠缠）；三模型歧视逻辑被数值实现；实验成本被量化。

== 实验二：电磁场的引力效应

*目的*：给出转换式统一（论点一）的直接数值判决。

*方法*：线性化 GR 牛顿极限下 $nabla^2 Phi = (4 pi G)/(c^2)(T_(0 0)+Sigma_i T_(i i))$；对静态电磁场，有效源为其能量密度的两倍（压强贡献）。以 FFT 求解泊松方程（$64^3$ 网格，4 m 盒），源为 $10^7 "V/m"$、1 m³ 电容器。

*结果*：电容器附近最大引力场 $1.4 times 10^(-24) "m/s"^2$，比地球小 25 个数量级；反推所需场强 $1.1 times 10^19 "V/m"$，为 Schwinger 极限的 8.3 倍。

*判决*：转换式统一的实验室版本被关闭——且关闭的原因是原理（真空稳定性）而非技术。

== 实验三：frame-dragging 场与相位

*目的*：量化"旋转改变时空"这一 Tesla 直觉的唯一站得住的版本。

*方法*：Lense-Thirring 进动场 $bold(Omega)_("LT") = G/(c^2 r^3) [3 hat(r)(hat(r) dot bold(J)) - bold(J)]$；对地球、超导陀螺（$J ~ 10^4 "kg m"^2/"s"$）、实验室转子（$J ~ 10^2$）分别计算表面进动；并与 Gravity Probe B 实测对照。同时计算量子钟干涉仪的引力磁相位 $Delta phi = (m)/(ℏ) 2 pi G J/(c^2)(1/r_1 - 1/r_2)$。

*结果*：地球表面 $Omega_("LT") approx 1.7 times 10^(-14) "rad/s"$，GP-B 实测 $37 "mas/yr" = 5.7 times 10^(-15) "rad/s"$，同数量级；实验室转子比地球小十个数量级；量子钟相位距现有读出能力约 7 个数量级。

*判决*：旋转确实拖动时空，但实验室源离可测还差 7-10 个数量级——Tesla 直觉的正确版本是"装置概念成立、量级遥远"。

== 实验四：纠缠-几何对应（RT 极小面）

*目的*：给出"纠缠 → 几何"（判决矩阵第 18 行）的玩具层验证与边界。

*方法*：键维 $chi = 4$ 的等距树张量网络（Haar 随机等距），计算边界区间二阶 Rényi 熵 $S_2(A) = -ln "tr" rho_A^2$，与网络 min-cut 对照；另以 quimb 原生 MERA（$chi = 2$）独立实现互验。

*结果*：$S_2(A) approx "mincut"(A) dot ln chi$：半树（$|A| = 4$）与相邻两叶（$|A| = 2$）同属 mincut = 1 类；远距两叶给出约两倍熵（"断开的极小面"，玩具层的相变骨架）；两种独立实现一致；$O(1/chi^2)$ 有限键修正即"大 N 极限"的玩具对应。

*判决*：RT 机制在玩具层完整复现；对真实宇宙仍是 C 级假说，不可外推。

== 实验五：第五力约束全景

*目的*：给出论据 B（第 3.2 节）的定量边界。

*方法*：以四个基准实验（Eöt-Wash 扭秤 $10^(-11) "m/s"^2$、Panda 格点原子干涉 $6.2 "nm/s"^2$、MICROSCOPE $eta ~ 2.5 times 10^(-15)$、月球激光测距）的灵敏度反推 $alpha$ 约束随 $lambda$ 的变化。

*结果*：$lambda >= 10^(-4) "m"$ 全范围 $alpha ~ O(1)$ 被排除；$10^(-3) ~ 10^5 "m"$ 段最强约束约 $10^(-6)$；$10^8 "m"$ 以上达 $10^(-15)$；$lambda < 10^(-5) "m"$ 无直接约束（Casimir 主导区，开放窗口）。叠加 KK 需求（$alpha ~ 0.36$）落在被排除区外 7-8 个数量级。

*判决*：屏蔽第五力"已被大量排除"的定量边界确立；唯一开放窗口位于 Casimir 平台区间。

== 实验六：真空能量的正则化依赖

*目的*：给出"真空能量作为工程资源"（第 14 行）的判决基础。

*方法*：同一理论（自由标量场，$m = 1 "eV"$）在三种合法减法方案下计算真空能量密度：硬截断 $Lambda$、ζ 函数正则化、维数正则化 MS。

*结果*：截断给出 $+Lambda^4/(16 pi^2)$（对 $Lambda = 1 "TeV"$ 为 $+6.3 times 10^45 "eV"^4$）；ζ 函数（无质量极限）严格为零；维数正则给出 $m^4/(64 pi^2)[ln(m^2/mu^2)+c]$，符号随标度 $mu$ 翻转（$mu = 0.1 "eV"$ 时 $+9.7 times 10^(-3)$，$mu = 1 "MeV"$ 时 $-4.1 times 10^(-2)$）。

*判决*："真空能量"的数值在被理论定义之前不存在——第 14 行的判决是"命题不可定义"，强于"未证实"；方案无关可测的只有差值（Casimir 型）。

= 判决矩阵：十九行的综合

== 方法论

矩阵的每行携带四要素：证据等级、判别通道、判决对象、时间尺度。一行只有在说明"何种观测排除何种理论、在什么时间尺度上"之后才被接纳。这正是 2025 年 GIE 之争教给领域的方法论：观测只有在没有竞争理论能复现它时才判别理论。图 1 给出全矩阵，表 3 给出统计。

#figure(
  image("../figures/fig01_decision_matrix.png", width: 88%),
  caption: [图 1：判决矩阵。十九个箭头按判决分类：已证伪（红）、已确立（绿）、B 级（蓝）、C 级（紫）。每行携带判决通道、判决对象与时间尺度。]
)

== 统计与代表行

#set par(first-line-indent: 0em)
#figure(
  table(
    columns: (auto, auto, auto, auto),
    align: (left, left, left, left),
    [*序号*], [*箭头*], [*状态*], [*判别通道*],
    [3], [电磁场转化为引力], [已证伪], [Schwinger 计算（式 1）],
    [5], [$angle hat(T)_("μν") angle$ 作为量子几何源], [已证伪], [MEP + 后牛顿一致性],
    [9], [ICO 意味着量子时空], [已证伪], [QC-QC 定理],
    [14], [真空能量作为工程资源], [已证伪], [正则化方案依赖（实验六）],
    [1-2], [电磁与电弱统一], [已确立（实验）], [—],
    [17], [惯性工程 = $T_("μν")$ 工程], [本文分类陈述（定理 1）], [—],
    [4], [double copy 本体论], [B 级，不可判决], [—],
    [6-7], [叠加源 / GIE 见证非经典引力], [B 级], [QGEM；LOCC 排除（实验一）],
    [11], [量子弱等效原理], [B 级], [在轨 WEP；算符形式化],
    [19], [Planck 尺度 LIV / GUP], [B 级，无显著证据], [GRB/AGN、LLR、光机械],
    [8], [后牛顿 GIE（frame dragging）], [C 级，差 ~7 量级], [量子钟干涉（实验三）],
    [12], [KK 额外维度（AB 分裂）], [C 级；eV 关，neV 开], [轨道约束 + 核钟],
    [15], [geontropic 时空涨落], [C 级；仅强档可证伪], [GQuEST],
    [18], [纠缠 → 几何（真实宇宙）], [C 级], [全息/类比平台（实验四）],
  ),
  caption: [表 3：判决矩阵代表性子集（全 19 行见图 1）。]
)
#set par(first-line-indent: 2em)

统计：4 行已证伪，2 行已确立（实验事实），1 行为本文分类陈述，4 行为 A 级实验事实，9 行处于 B/C 级且全部携带判决对象与时间尺度。十六行由第 7 节计算锚定。

= 应用

本工作的产物是可复用的地图，其应用分五类。

== 对实验物理学：实验调度器

判决矩阵即调度器：每行的时间尺度直接给出实验优先级排序。近期（3-5 年）应优先推进 GQuEST 首轮数据（第 15 行）、reservoir-engineered GIE（第 6-7 行的成本已由实验一量化为 $10^9 ~ 10^21$ 次测量的差距）、核钟 $10^(-18)$ 稳定度（第 12 行窗口）。对每个实验，矩阵同时给出了它的判决对象——实验完成后"排除什么理论"是预先写好的，避免事后解释的随意性。

== 对科研管理与路线图：时间-成本地图

第 8 节的矩阵与第 7 节的成本数字共同构成时间-成本地图：例如第 6-7 行的判决成本是 $10^9 ~ 10^21$ 次测量，第 8 行的缺口是 7 个数量级，第 15 行的可证伪窗口只在强档。科研管理机构可据此判断投资优先级：neV 核钟窗口与 GQuEST 强档是近期回报最高的两个投资点。

== 对科学传播：拆解工具箱

第 2 节的分类与第 6 节的定理构成对"反重力"类传说的可复用拆解工具：任何提案先归类（转换式/几何式/代数式），再对号入座判决通道。传播者不再需要逐案查证，而可以给出统一的判决模板："该提案属于转换式统一，其判决通道是式 1，所需场强超出真空稳定极限八倍"。

== 对教育：三种含义作为教学内容

"统一场论"在教学中长期被作为单一概念讲授。第 2 节的三种定义给出了一个可教的课程单元：学生分别检验三种统一的证据、失败模态与判决实验，直接获得"科学主张如何被判决"的训练。

== 对 AI 辅助科研：可复现方法论文本

全部十六个脚本、五幅图与十九行矩阵构成一份"论证 + 代码"协同的方法论文本，可作为 AI 辅助科研中"证据锚定写作"的示范：每个定量声称都绑定一个可执行脚本，声称的更新自动同步到图与表。

= 讨论

== GIE 之争：方法论中心

2025 年的论战序列——原始论证（仅引力产生的纠缠意味着非经典中介）→ 挑战构造（经典引力 + 量子场论物质可复现效应）→ 反驳（纠缠位于物质扇区，使用不同物质种类时相关图归零）——教训是前提必须显式：GIE 是对局域经典通道的见证，而非对一切经典模型的见证。本文矩阵因此为第 6-7 行指派精确判决对象，并将争议本身作为"箭头纪律"的教科书案例（第 1.1 节）。

== 负能量的状态

第 14 行基于正则化依赖（实验六），但相邻的量子不等式问题需校准表述：不等式约束惯性观者的负能量，其实验地位存在争议——压缩光数据的荟萃分析发现所提议的不等式被违反。无论争议如何，负能量的宏观利用仍被排除；争议针对的是约束的地位，而非资源的可用性。

== 局限

三处局限须显式声明。其一，本分类是描述性的，不预言新现象。其二，定理是分类陈述，其假设即其内容；它不排除量子叠加源、涌现几何与混合模型——那些正是矩阵的开放行。其三，四问判据（第 1.1 节用于张祥前体系的诊断）是面向物理学界的实用诊断工具，不构成对伪科学划界理论的贡献。

= 结论

一个世纪的统一论叙事混淆了三个主张。分开之后得到的地图比领域此前拥有的任何地图都清晰：转换式统一对实验室源已被两行算术关闭；几何式统一被收窄到纳电子伏特窗口，仪器完备；代数式统一是已确立的数学，本体论不可判决。控制通道定理认定 $T_("μν")$ 是广义相对论加标准模型之内唯一的工程入口；判决矩阵把十九个活跃命题排期到具体实验；六个可复现计算为十六行提供数字锚点。

民间叙事背后的野心在此分析后以一种形式存活：问题不再是一种场能否转化为另一种场，而是什么变量（如果有的话）在源头上控制时空。三个存活候选——量子态、运动学代数、关系结构——每一个都有已排期的实验。如果时空技术将来存在，它将作用于这些候选之上，而非作用于一种力。地图就是交付物，而地图是可证伪的——这正是一份科学主张被允许拥有的全部。

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[参考文献]
#v(0.4em)
#set text(size: 9.5pt)
1. Tesla, N. 公开声明与文集（一手文献）。
2. 张祥前.《统一场论》7.2 版（民间文献，一手来源）。
3. Bose, S. 等. Spin entanglement witness for quantum gravity. *Phys. Rev. Lett.* 119, 240401 (2017).
4. Marchese, M. M., Plávala, M., Kleinmann, M. & Nimmrichter, S. Newton's laws of motion generating gravity-mediated entanglement. *Phys. Rev. A* 111, 042202 (2025).
5. Fedida, S. & Kent, A. Mixture equivalence principles and post-quantum theories of gravity. *Phys. Rev. D* 111, 126016 (2025).
6. Salzger, M. & Vilasini, V. Higher-order quantum processes respecting closed labs in a spacetime. arXiv:2605.08351 (2026).
7. Vermeulen, S. M. 等. Photon counting interferometry to detect geontropic spacetime fluctuations with GQuEST. *Phys. Rev. X* 15, 011034 (2025).
8. Derevianko, A., Elwell, R. & Hudson, E. R. Colloquium: Nuclear clocks. arXiv:2606.11048 (2026).
9. Hiraki, T. 等. Controlling $""^229$Th isomeric state population in a VUV transparent crystal. *Nat. Commun.* 15, 5536 (2024).
10. Morgan, H. W. T. 等. A spinless crystal for a high-performance solid-state $""^229$Th nuclear clock. arXiv:2503.11374 (2025).
11. Bonezzi, R., Casale, G. & Hohm, O. The double copy of maximal supersymmetry in D=4. arXiv:2501.02058 (2025).
12. Ilderton, A. & Lindved, W. Coherent states, background fields, and double copy. arXiv:2505.16852 (2025).
13. Holton, B. Residual symmetries and BRST cohomology of Schwarzschild in the Kerr-Schild double copy. arXiv:2509.24112 (2025).
14. Bobrick, A. & Martire, G. Introducing physical warp drives. *Class. Quantum Grav.* 38, 105009 (2021).
15. Le, A. T. Steering a warp drive without exotic matter. arXiv:2606.22531 (2026).
16. Barzegar, H., Buchert, T. & Vigneron, Q. General formalism, classification, and demystification of the current warp-drive spacetimes. arXiv:2602.16495 (2026).
17. Puthoff, H. E. Advanced space propulsion based on vacuum (spacetime metric) engineering. *JBIS* 63, 82 (2010).
18. Maclay, G. J. & Davis, E. W. Testing a quantum inequality with a meta-analysis of data from squeezed light. *Found. Phys.* 49, 797 (2019).
19. Ford, L. H. & Roman, T. A. Negative energy seen by accelerated observers. *Phys. Rev. D* 87, 085001 (2013).
20. Wilczek, F. Origins of mass. *Cent. Eur. J. Phys.* 10 (2012).
21. Yang, Y.-B. 等. Proton mass decomposition from the QCD energy momentum tensor. *Phys. Rev. Lett.* 121, 212001 (2018).
22. Liu, K.-F. Hadrons, superconductor vortices, and cosmological constant. *Phys. Lett. B* (2023).
23. Panda, C. D. 等. Measuring gravity by holding atoms. *Nature* 631, 515 (2024).
24. Ofengeim, D. D. & Piran, T. The 300 TeV photon from GRB 221009A. *Phys. Rev. D* 112, 083055 (2025).
25. Du, S.-S. 等. Hierarchical test of Lorentz invariance with GRB spectral-lag measurements. *Astrophys. J.* (2025).
26. Jalalzadeh, S. & Moradpour, H. Finite Hilbert space and maximum mass of Schwarzschild black holes from a GUP. *Phys. Lett. B* (2026).
27. Chiao, R. Y. 等. Gravitational Aharonov-Bohm effect. *Phys. Rev. D* 109, 064073 (2024).
28. Jusufi, K. 等. Signatures of modified gravity from the gravitational Aharonov-Bohm effect. *J. Cosmol. Astropart. Phys.* (2025).
29. Céleri, L. C., Soares-Pinto, D. O. & Turolla Vanzella, D. A. The apparatus strikes back. arXiv:2607.08819 (2026).
30. Wakakuwa, E. 等. Relativistic gravity-induced entanglement via frame dragging. arXiv:2606.31678 (2026).

#v(0.6em)
*作者贡献*　MuningAn 提出分类与定理、完成全部计算并撰写全文。
#v(0.3em)
*利益冲突*　作者声明无利益冲突。
#v(0.3em)
*数据可用性*　全部计算、模拟、图件、十九行判决矩阵与完整参考文献表见 github.com/everest-an/Antigravity。
