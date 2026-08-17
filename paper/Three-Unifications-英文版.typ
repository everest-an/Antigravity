#set page(paper: "a4", margin: (x: 2.2cm, y: 2.4cm), numbering: "1 / 1")
#set text(font: ("New Computer Modern", "Noto Serif SC"), size: 10.5pt, lang: "en")
#set par(justify: true, leading: 0.75em)
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
#show table: set text(size: 8.5pt)
#show figure: set block(above: 1em, below: 1.2em)

#align(center)[
  #text(size: 17pt, weight: "bold")[Three Unifications: A Falsifiable Map of the Quantum-Gravity Frontier]
  #v(0.5em)
  #text(size: 11.5pt)[MuningAn$""^1$ · PlanetarySystem$""^1$]
  #v(0.3em)
  #text(size: 9.5pt)[$""^1$ PlanetarySystem. Correspondence: MuningAn. Repository: github.com/everest-an/Antigravity]
]

#par(justify: true)[
*Abstract*　"Unified field theory" conflates three logically distinct claims, and the conflation has produced a century of confusion. This paper separates the claims, assigns each its evidential regime, and delivers reproducible quantitative verdicts. *Claim 1*: transformational unification (one field physically converts into another) is falsified for laboratory electromagnetic sources; Earth-scale gravity would require field strengths about eight times the Schwinger limit, at which the vacuum is already unstable. *Claim 2*: geometrical unification (known forces are projections of higher-dimensional geometry) remains open but confined; its gravitational Aharonov-Bohm signatures are excluded at the electronvolt scale by orbital bounds, leaving a nanoelectronvolt window now reachable by the Th-229 nuclear clock. *Claim 3*: algebraic unification (gauge theory and gravity share a deeper kinematic algebra) is an established mathematical fact that is silent on ontology. On this basis we prove a *control-channel uniqueness theorem*: within general relativity plus the Standard Model, any engineering operation that preserves all sources, the metric structure, and the interaction channels leaves every geodesic unchanged, so that inertia engineering has no degrees of freedom independent of stress-energy engineering. We organize the nineteen live propositions of the field into a *decision matrix*, every row carrying a discriminating experiment, a target it would exclude, and a timescale; sixteen rows are anchored by six reproducible computations (Section 7). The deliverable is a descriptive map rather than a new theory: it locates where a century of folk proposals failed, and it names the three surviving candidates for the source variable of spacetime, each with a scheduled experiment.
]
#par(justify: true)[
*Keywords*　unified field theory; double copy; quantum gravity; gravitationally induced entanglement; equivalence principle; falsifiability; nuclear clock
]

#pagebreak()

= Introduction

== Background: a century of conflation

The phrase "unified field theory" has been used for at least three different intellectual projects. The first seeks physical conversion: a process that turns one field into another, as in the folk claim that changing electromagnetic fields generate gravity. The second seeks geometrical embedding: a higher-dimensional geometry whose projections include the known forces, the route opened by Kaluza and Klein. The third seeks algebraic identity: a kinematic structure from which the amplitudes of two theories both descend, the route now realized by the double copy program. The three projects have different evidence bases, fail in different ways, and require different experiments to adjudicate. A blanket dismissal of unified field theory is therefore as uninformative as a blanket endorsement.

Folk physics provides instructive test cases. Tesla did publicly claim a completed "Dynamic Theory of Gravity" in 1937, but no credible primary evidence shows that he published the full theory, and none shows that it contained a gravity door or a mechanism by which rotating electromagnetic fields reverse gravity. Zhang Xiangqian's Unified Field Theory provides a second dissectable specimen: its derivation chain opens with two standard-physics steps (the Lorentz transformation of electromagnetic fields, and its time derivative), and then performs an additional interpretive step, reading the acceleration term as a gravitational field. The first two steps are standard; the final identification has no dynamical content. Both failures share one pattern: *the arrow is asserted, not derived*. That diagnosis is the methodological starting point of this paper.

== Claims, contributions, and structure

The paper is organized around three claims, each supported by explicit evidence:

- *Claim 1* (Section 3): transformational unification is quantitatively falsified. Evidence: the Schwinger-limit inversion (Eq. 1); the fifth-force constraint landscape (Eq. 2, Figure 2).
- *Claim 2* (Section 4): the open window of geometrical unification is known. Evidence: the Kaluza-Klein parametrization and the inversion of the Aharonov-Bohm splitting (Eqs. 3, 4); the state of the nuclear-clock hardware.
- *Claim 3* (Section 5): algebraic unification is silent on ontology. Evidence: three algebraic facts of the double copy; the residual-symmetry collapse.

Above the claims, Section 6 states the control-channel uniqueness theorem with three corollaries. Section 7 presents the six reproducible computations that anchor the paper. Section 8 synthesizes everything into the nineteen-row decision matrix. Section 9 discusses applications, Section 10 limitations and controversies, and Section 11 concludes.

= Theoretical framework: three unifications, three failure modes

== Definitions

*Definition 1 (transformational unification).* Transformational unification asserts a physical map from a field $A$ to a field $B$ such that engineering $A$ produces $B$ as a matter of dynamics, without introducing further structure.

*Definition 2 (geometrical unification).* Geometrical unification asserts an embedding of $A$ and $B$ as components of a single geometric object, both recovered by projection, with no claim that $A$ produces $B$.

*Definition 3 (algebraic unification).* Algebraic unification asserts a shared algebraic or kinematic structure from which the amplitudes of two theories are obtained by a fixed rule, again with no conversion involved.

== Three failure modes

The three claims fail in different modes, and the failure modes, not the claims, are the organizing principle of the paper. Transformational unification fails quantitatively: it is a dynamical claim, and its numbers can be computed. Geometrical unification fails, when it fails, by confinement: its signatures are driven into an ever-narrower window by successive experiments. Algebraic unification does not fail as mathematics; it lacks an ontological verdict, and no finite computation can supply one. Table 1 summarizes.

#figure(
  table(
    columns: (0.8fr, 2.6fr, 1.6fr, 2.2fr),
    align: (left, left, left, left),
    [*Type*], [*Proposition*], [*Failure mode*], [*Discriminating channel*],
    [Transformational], [$A$ converts into $B$ (Tesla/Zhang route)], [Quantitative], [Schwinger inversion + fifth-force landscape],
    [Geometrical], [$A$, $B$ are projections of higher geometry (Kaluza-Klein)], [Confinement of window], [Orbital bounds + nuclear clock neV window],
    [Algebraic], [$A$, $B$ share a deeper kinematic algebra (double copy)], [Ontological silence], [Undecidable by computation],
  ),
  caption: [Table 1: The three unifications, their failure modes, and their discriminating channels.]
)

== Relation to existing literature

Three bodies of work are closest, and the differences must be stated. First, the classification itself: a systematic preprint search returned no prior proposal pairing unification types with the double copy; the nearest discussions are the unification-versus-reduction debates in the philosophy of physics, which this classification does not engage. Second, the warp-drive no-go literature: Bobrick and Martire showed that any warp drive is a shell of matter requiring propulsion; Le showed that steering requires radiation and mass loss; Barzegar, Buchert, and Vigneron classified warp-drive spacetimes and proved new no-go theorems. These are special cases of the assumptions of Theorem 1; ours generalizes the logic to arbitrary engineering operations. Third, the term "metric engineering" itself, used by Puthoff in an exploratory register; our verdict is specific.

= Claim 1: transformational unification is quantitatively falsified

*Claim statement.* For laboratory electromagnetic sources, the transformational claim that changing electromagnetic fields generate gravity is quantitatively impossible: the required field strengths exceed the vacuum-stability limit, so the claim is falsified as an engineering proposition.

== Evidence A: the Schwinger-limit inversion

The relevant physics is not in dispute: the electromagnetic stress-energy tensor enters Einstein's equations with its full content, energy density and pressure. The only question is magnitude. A capacitor with a field of $10^7 "V/m"$ and volume one cubic meter sources a gravitational acceleration of order $10^(-25) "m/s"^2$, twenty-five orders of magnitude below Earth gravity. Reversing the question is more informative. Inverting the Poisson equation with the electromagnetic energy density as source (the factor two records the pressure content) gives the required field for a target acceleration $g$ over a scale $L$:

$ E_"needed" = sqrt((2 rho_"needed") / epsilon_0), quad rho_"needed" = (g c^2) / (8 pi G L). $ <eq-schwinger>

For $g = 9.8 "m/s"^2$ and $L = 1 "m"$ the required field is $1.1 times 10^19 "V/m"$, about eight times the Schwinger limit $E_S = m_e^2 c^3/(e ℏ) approx 1.3 times 10^18 "V/m"$, at which the vacuum is unstable against pair production. At that point the program has changed meaning: *one is manufacturing matter, not engineering gravity*. Eq. @eq-schwinger closes the transformational program for laboratory sources without reference to any speculative physics.

== Evidence B: the fifth-force landscape

The same arithmetic bounds the adjacent fifth-force window. A Yukawa modification of Newtonian gravity,

$ a_Y (r) = alpha (G M)/(r^2) (1 + r/lambda) e^(-r/lambda), $ <eq-yukawa>

with coupling $alpha$ relative to $G$ and range $lambda$, is excluded at order unity across all probed scales: about $3 times 10^(-3)$ at $lambda = 10 μ"m"$ (Eöt-Wash torsion), $10^(-6)$ from millimeters to a hundred kilometers, and $10^(-9)$ to $10^(-15)$ at orbital scales. The only remaining opening lies below ten micrometers, where Casimir physics dominates. The full landscape is Figure 2.

#figure(
  image("../figures/en_fig04_fifth_force.png", width: 86%),
  caption: [Figure 2: The fifth-force constraint landscape. The strongest combined constraint on the Yukawa coupling across range; the star marks the coupling required by electronvolt-scale Kaluza-Klein splitting claims, excluded by seven to eight orders of magnitude.]
)

== Argument: from evidence to claim

The two pieces of evidence close the claim from two sides. Evidence A gives the positive verdict: the required field is unreachable, and the reason is principle (vacuum stability), not technology. Evidence B blocks the escape route: even abandoning electromagnetism in favor of a fifth force, the parameter space is already excluded. Together they constitute a complete falsification: not "no method found", but "methods of this class are impossible in principle".

= Claim 2: the open window of geometrical unification is known

*Claim statement.* Kaluza-Klein-type geometrical unification is neither established nor excluded, but its testable content is now precise: the electronvolt window is closed by orbital bounds, the only open window is nanoelectronvolt-scale, and the detector hardware is in place.

== Evidence A: parametrization and the splitting inversion

An extra compact dimension contributes a tower of graviton modes whose lightest state produces a Yukawa correction,

$ V(r) = - (G m_1 m_2)/(r) (1 + alpha e^(-r/lambda)), $ <eq-kk>

where $alpha$ encodes the coupling of the lightest extra mode and $lambda$ its Compton range. The gravitational Aharonov-Bohm proposals convert this into a spectroscopic prediction: a quantum system in free fall around a gravitating body acquires an energy-level splitting

$ Delta E = m_"sys" alpha Delta Phi(r, lambda), $ <eq-ab>

with $Delta Phi$ the peak-to-peak variation of the corrected potential over the orbit. Inverting Eq. @eq-ab: electronvolt-scale splittings for nuclear systems require $alpha approx 0.4$; millielectronvolt splittings for atomic systems require $alpha approx 10^(-3)$. Both are excluded by four to eight orders of magnitude by the orbital bounds of Section 3.2. The allowed window therefore sits at the nanoelectronvolt scale.

== Evidence B: the state of the nuclear-clock hardware

The instrument for that window is essentially complete (Table 2). The Th-229 isomer transition has been directly laser-excited at $148.18 plus.minus 0.42 "nm"$ with a $447 plus.minus 25 "s"$ half-life in a VUV-transparent crystal; solid-state hosts with lifetimes exceeding six hundred seconds exist; a spinless host crystal, Th(SO#sub[4])#sub[2], removes the dominant broadening channel with projected instability $4.6 times 10^(-23) / sqrt(tau)$; X-ray quenching accelerates the readout cycle by a factor exceeding fifty.

#figure(
  table(
    columns: (0.9fr, 3fr, 1.8fr),
    align: (left, left, left),
    [*Node*], [*Status*], [*Reference*],
    [Direct excitation], [$148.18 plus.minus 0.42 "nm"$, half-life $447 plus.minus 25 "s"$], [Hiraki et al., Nat. Commun. 2024],
    [Solid-state host], [641 s lifetime in $"CaF"_2$], [Girvin & Radzihovsky, 2025],
    [Spinless host], [Th(SO#sub[4])#sub[2], instability $4.6 times 10^(-23) / sqrt(tau)$], [Morgan et al., 2025],
    [Readout], [X-ray quenching, cycle speedup ≥ 50x], [Hiraki et al., Nat. Commun. 2024],
  ),
  caption: [Table 2: The four key nodes of the Th-229 nuclear clock.]
)

== Argument

Evidence A locates the window (neV); Evidence B supplies its instrument. Together they convert geometrical unification from a vague hope into a measurement program with a known instrument and a known energy window. This is the most honest status statement available for the Kaluza-Klein tradition: not falsification, but confinement to an executable window.

= Claim 3: algebraic unification is silent on ontology

*Claim statement.* The double copy is an established algebraic fact, but shared algebraic structure does not imply shared physical content; its ontological status is undecidable by computation.

== Evidence A: three algebraic facts

Off-shell $N=8$ supergravity in four dimensions is realized as the double copy of $N=4$ super Yang-Mills at cubic order. Amplitudes on coherent-state gauge backgrounds double-copy to amplitudes on curved spacetimes whose metric is built from the gauge background; in the self-dual sector the map relates exact vacuum solutions. The Ehlers transformation of general relativity is the double copy of electromagnetic duality. The last fact carries a direct historical resonance with the transformational ambitions of the Tesla era: the "electromagnetic-gravitational relation" Tesla sought exists, but its modern form is a *square of symmetry algebras*, not a conversion of fields.

== Evidence B: the residual-symmetry collapse

The residual gauge algebra of the double-copied Schwarzschild solution collapses from an infinite-dimensional structure to the finite isometry group. This is the brake against overreading: *algebraic structure can be shared while physical content differs entirely*. If a shared algebra automatically implied a unified ontology, the gravitational side would retain the full symmetry structure of the gauge side; the collapse shows otherwise.

== Argument

The two pieces of evidence jointly delimit the concept: algebraic unification is established as mathematics (Evidence A) and undecidable as ontology (Evidence B). This is the most precise boundary available on what the double copy program can claim.

= The control-channel uniqueness theorem

== Statement and proof

*Theorem 1 (control-channel uniqueness).* Let $(M, g)$ be a general-relativistic spacetime with $g$ determined by given sources and boundary conditions. Let $E$ be an engineering operation satisfying:
(A1) *Source invariance:* $E$ changes no field source in $(M, g)$, including $T_("μν")$, electromagnetic currents, and all Standard Model source terms;
(A2) *Metric non-intervention:* $E$ does not replace $g$ by a solution $g'$ not determined by the sources of (A1) and the same boundary conditions;
(A3) *Channel closure:* $E$ introduces no interaction channel beyond the Standard Model.
Then $E$ leaves the geodesic motion of every test particle in $(M, g)$ unchanged.

*Proof.* The geodesic equation contains only the Christoffel symbols, which are determined by $g$. The metric $g$ is determined by the field equations from the sources of (A1) and the boundary conditions. Assumptions (A2) and (A3) preserve the equations and their solution. Hence the Christoffel symbols are unchanged, the equations of motion are unchanged, and their solutions are unchanged. QED.

The content of the theorem is the completeness of (A1)-(A3): they exhaust the control channels available inside general relativity plus the Standard Model. Violating (A1) is stress-energy engineering, which is energy engineering by another name. Violating (A2) is metric engineering, requiring exotic matter or modified gravity. Violating (A3) is new physics, bounded by the searches of Section 3.

== Three corollaries

*Corollary 1 (inertia engineering).* Inertial mass equals gravitational mass (the weak equivalence principle), and general relativity couples to matter only through $T_("μν")$. Hence inertia engineering has no degrees of freedom independent of stress-energy engineering.

*Corollary 2 (mass-lever efficacy).* For any decomposition of mass, $m = m_"Higgs" + m_"QCD" + m_"vac" + dots$, the gravitational efficacy of each component as an engineering lever equals $partial T_("μν") / partial("that component")$. The Higgs enters about nine percent of the proton mass term; QCD carries about ninety-one percent; and the vacuum contribution is not well-defined, since it depends on the regularization scheme (Section 7.6).

*Corollary 3 (effective mass).* Negative effective mass in metamaterials is a property of dispersion relations and does not change $T_("μν")$; it has no direct gravitational consequence.

== Boundary statement

The theorem holds for classical general relativity with classical sources. Quantum superposed sources, emergent-geometry hypotheses, and hybrid classical-quantum models lie outside it. Those exclusions are precisely the open rows of the decision matrix; we do not claim the theorem applies to them. The necessity of this statement is discussed in Section 10.

= Experiments: six reproducible computations

This section presents the six computations that anchor the three claims and the theorem. Each experiment is organized as purpose-method-result-verdict. All code lives in the companion repository and runs through a single entry point.

== Experiment 1: three-model discrimination of the GIE protocol

*Purpose.* To verify numerically the exclusion logic of gravitationally induced entanglement (GIE).

*Method.* Two masses, each in a spatial superposition, interacting only through gravity. The relative phases of the four branches are computed exactly,

$ phi = (G m^2 t)/(ℏ) (1/(d+Delta x) + 1/(d-Delta x) - 2/d), $ <eq-gie>

and three models are constructed in a four-dimensional Hilbert space: (a) quantum gravity (diagonal unitary); (b) Schrödinger-Newton mean field (local phases); (c) a LOCC classical channel (separable mixture). Negativity and the optimal CHSH violation are computed. A continuous-variable version with truncated Fock space (branch coherent states $|plus.minus alpha angle$) verifies the fidelity of the qubit abstraction.

*Results.* For benchmark parameters $phi = 0.217 "rad"$: quantum negativity $N approx 0.078$ and CHSH violation 0.024; mean-field and LOCC models are identically zero. For realistic chip parameters $phi = 10^(-6) ~ 10^(-5) "rad"$, and the 3σ certification grows from about 200 runs to a $10^9 ~ 10^21$ run campaign. The continuous-variable negativity converges to the qubit value with deviation proportional to $e^(-2 alpha^2)$ (about $10^(-4)$ at $alpha = 2$).

*Verdict.* GIE is a LOCC exclusion witness, not an exclusion of every classical model (Newtonian gravity with classical evolution generates the same entanglement). The three-model discrimination logic is implemented numerically, and the experimental cost is quantified.

== Experiment 2: the gravitational effect of electromagnetic fields

*Purpose.* To deliver the direct numerical verdict for Claim 1.

*Method.* In the Newtonian limit of linearized GR, $nabla^2 Phi = (4 pi G)/(c^2)(T_(0 0) + Sigma_i T_(i i))$; for a static electromagnetic field the effective source is twice its energy density (pressure contribution). The Poisson equation is solved by FFT on a $64^3$ grid in a 4 m box, sourced by a $10^7 "V/m"$, 1 m³ capacitor.

*Results.* Maximum gravitational acceleration near the capacitor: $1.4 times 10^(-24) "m/s"^2$, twenty-five orders below Earth gravity. The inverted requirement is $1.1 times 10^19 "V/m"$, 8.3 times the Schwinger limit.

*Verdict.* The laboratory version of transformational unification is closed, and the closure is principled (vacuum stability), not technological.

== Experiment 3: the frame-dragging field and phase

*Purpose.* To quantify the only defensible version of Tesla's intuition that rotation changes gravity.

*Method.* The Lense-Thirring precession field $bold(Omega)_"LT" = G/(c^2 r^3) [3 hat(r)(hat(r) dot bold(J)) - bold(J)]$ is evaluated for Earth, a superconducting gyroscope ($J ~ 10^4 "kg m"^2/"s"$), and a laboratory rotor ($J ~ 10^2$), and compared with Gravity Probe B. The gravitomagnetic phase of a quantum clock interferometer, $Delta phi = m/(ℏ) 2 pi G J/(c^2) (1/r_1 - 1/r_2)$, is computed for the same sources.

*Results.* Earth's surface precession is $1.7 times 10^(-14) "rad/s"$; Gravity Probe B measured $37 "mas/yr" = 5.7 times 10^(-15) "rad/s"$, the same order. Laboratory rotors fall ten orders below Earth; the quantum clock phase falls about seven orders below current readout.

*Verdict.* Rotation really does drag spacetime, but laboratory sources remain seven to ten orders of magnitude away from detection: the correct version of Tesla's intuition is "the device concept is valid, the magnitude is remote".

== Experiment 4: the entanglement-geometry correspondence

*Purpose.* To demonstrate the toy-level validation and the boundary of the entanglement-to-geometry program (matrix row 18).

*Method.* An isometric tree tensor network of bond dimension $chi = 4$ (Haar-random isometries) is contracted; boundary interval Rényi-2 entropies $S_2(A) = -ln "tr" rho_A^2$ are compared with the network min-cut. A quimb-native MERA implementation ($chi = 2$) provides an independent check.

*Results.* $S_2(A) approx "mincut"(A) dot ln chi$: the half-tree ($|A| = 4$) and adjacent pairs ($|A| = 2$) share the mincut = 1 class; distant pairs give about twice the entropy (the disconnected minimal surface, a toy-level phase-transition skeleton). The two independent implementations agree; the $O(1/chi^2)$ finite-bond corrections are the toy analogue of the large-N limit.

*Verdict.* The RT mechanism is fully reproduced at the toy level; for the real universe the claim remains grade-C and must not be extrapolated.

== Experiment 5: the fifth-force constraint landscape

*Purpose.* To provide the quantitative boundary for Evidence B of Claim 1.

*Method.* The sensitivity of four benchmark experiments (Eöt-Wash torsion $10^(-11) "m/s"^2$; Panda lattice atom interferometry $6.2 "nm/s"^2$; MICROSCOPE $eta ~ 2.5 times 10^(-15)$; lunar laser ranging) is inverted into $alpha$-bounds as a function of $lambda$.

*Results.* $alpha ~ O(1)$ is excluded for all $lambda >= 10^(-4) "m"$; the strongest bound is about $10^(-6)$ between millimeters and a hundred kilometers and reaches $10^(-15)$ above $10^8 "m"$; below $10^(-5) "m"$ there is no direct constraint (Casimir-dominated open window). The KK requirement ($alpha ~ 0.36$) sits seven to eight orders inside the excluded region.

*Verdict.* The quantitative boundary of "screened fifth forces are largely excluded" is established; the only opening is the Casimir-platform regime.

== Experiment 6: regularization dependence of vacuum energy

*Purpose.* To provide the basis for the verdict on vacuum energy as an engineering resource (matrix row 14).

*Method.* The vacuum energy density of a free scalar field ($m = 1 "eV"$) is computed under three legitimate subtraction schemes: a hard cutoff $Lambda$, zeta-function regularization, and dimensional regularization (MS).

*Results.* The cutoff gives $+Lambda^4/(16 pi^2)$ ($+6.3 times 10^45 "eV"^4$ at $Lambda = 1 "TeV"$); zeta regularization gives exactly zero in the massless limit; dimensional regularization gives $m^4/(64 pi^2)[ln(m^2/mu^2) + c]$, whose sign flips with $mu$ ($+9.7 times 10^(-3)$ at $mu = 0.1 "eV"$, $-4.1 times 10^(-2)$ at $mu = 1 "MeV"$).

*Verdict.* The number called "vacuum energy" does not exist before the theory defines it: row 14 is not merely unverified, it is ill-defined. Only differences of vacuum energy (the Casimir type) are scheme-independent and measurable.

= The decision matrix: nineteen rows

== Methodology

Every row of the matrix carries four elements: evidence grade, discriminating channel, target theory, and timescale. A row is admitted only if it states what observation would exclude which theory, and on what timescale. This is the discipline the 2025 GIE debate taught the field: an observation discriminates between theories only if no competing theory reproduces it. Figure 1 gives the full matrix; Table 3 gives the statistics.

#figure(
  image("../figures/en_fig01_decision_matrix.png", width: 88%),
  caption: [Figure 1: The decision matrix. Nineteen arrows classified by verdict: falsified (red), established (green), grade-B (blue), grade-C (purple). Every row carries a discriminating channel, a target it would exclude, and a timescale.]
)

== Statistics and representative rows

#figure(
  table(
    columns: (0.8fr, 2.6fr, 1.6fr, 2.2fr),
    align: (left, left, left, left),
    [*No.*], [*Arrow*], [*Status*], [*Discriminating channel*],
    [3], [EM fields convert into gravity], [Falsified], [Schwinger computation (Eq. 1)],
    [5], [$angle hat(T)_("μν") angle$ as quantum source of geometry], [Falsified], [MEP + post-Newtonian consistency],
    [9], [ICO implies quantum spacetime], [Falsified], [QC-QC theorem],
    [14], [Vacuum energy as engineering resource], [Falsified], [Regularization dependence (Exp. 6)],
    [1-2], [Electromagnetic and electroweak unification], [Established (experiment)], [—],
    [17], [Inertia engineering = $T_("μν")$ engineering], [Classification statement (Thm. 1)], [—],
    [4], [Double copy ontology], [Grade B, undecidable], [—],
    [6-7], [Superposed sources; GIE witness], [Grade B], [QGEM; LOCC exclusion (Exp. 1)],
    [11], [Quantum weak equivalence principle], [Grade B], [In-orbit WEP; operator formalism],
    [19], [Planck-scale LIV / GUP], [Grade B, no significant evidence], [GRB/AGN, LLR, optomechanics],
    [8], [Post-Newtonian GIE (frame dragging)], [Grade C, ~7 orders below readout], [Quantum clock interferometry (Exp. 3)],
    [12], [KK extra dimensions (AB splitting)], [Grade C; eV closed, neV open], [Orbital bounds + nuclear clock],
    [15], [Geontropic spacetime fluctuations], [Grade C; strong scale only], [GQuEST],
    [18], [Entanglement → geometry (real universe)], [Grade C], [Holographic/analog platforms (Exp. 4)],
  ),
  caption: [Table 3: Representative subset of the decision matrix (full 19 rows in Figure 1).]
)

Statistics: four rows falsified, two established experimental facts, one classification statement of this paper, four grade-A experimental facts, and nine live B/C-grade rows, every one carrying a discriminating channel, a target, and a timescale. Sixteen rows are anchored by the computations of Section 7.

= Applications

The deliverable is a reusable map, with five classes of application.

== For experimental physics: an experiment scheduler

The matrix is a scheduler: the timescale of each row directly yields the experimental priority order. Near term (3-5 years): GQuEST first data (row 15); reservoir-engineered GIE (the cost of rows 6-7 was quantified in Experiment 1 as a $10^9 ~ 10^21$ run gap); nuclear clock stability at $10^(-18)$ (the row-12 window). For every experiment the matrix pre-writes its verdict target, so that "what theory is excluded" is fixed in advance rather than improvised after the data.

== For research management: a time-cost map

Section 8 combined with Section 7 constitutes a time-cost map: row 6-7 costs $10^9 ~ 10^21$ runs, row 8 is seven orders below readout, row 15 is falsifiable only at the strong scale. Funding decisions can be made against these numbers: the neV nuclear-clock window and the strong geontropic scale are the two highest near-term returns.

== For science communication: a debunking toolkit

Section 2 plus Theorem 1 form a reusable toolkit against anti-gravity folklore. Any proposal is first classified (transformational, geometrical, or algebraic), then matched to its discriminating channel. The communicator no longer needs case-by-case research: the verdict template reads "this proposal is transformational unification; its channel is Eq. 1; the required field exceeds the vacuum-stability limit by a factor of eight".

== For education: three meanings as a teaching unit

"Unified field theory" has long been taught as a single concept. The three definitions of Section 2 provide a teachable unit: students test the evidence, failure mode, and discriminating experiment of each unification in turn, gaining direct training in how scientific claims are adjudicated.

== For AI-assisted research: an evidence-anchored writing exemplar

All sixteen scripts, five figures, and nineteen matrix rows form a specimen of argument-plus-code scholarship: every quantitative claim is bound to an executable script, and updates to a claim propagate automatically to figures and tables. This is a working template for evidence-anchored writing with AI assistance.

= Discussion

== The GIE debate as methodological centerpiece

The 2025 exchange, original argument, then classical-plus-matter counter-construction, then matter-sector rebuttal, teaches that premises must be stated. GIE witnesses against local classical channels, not against every classical model: Newtonian gravity with classical time evolution generates the same entanglement. Our matrix therefore assigns to rows 6-7 precisely the target they exclude, and uses the debate itself as the textbook case of arrow discipline (Section 1.1).

== The status of negative energy

Row 14 rests on regularization dependence (Experiment 6), but the adjacent quantum-inequality question requires a calibrated statement. The inequalities constrain negative energy for inertial observers, and their experimental status is contested: a meta-analysis of squeezed-light data finds violations of a proposed inequality. Macroscopic utilization of negative energy remains excluded regardless; the contestation concerns the status of the bounds, not the availability of the resource.

== Limitations

Three limitations are stated explicitly. First, the classification is descriptive: it predicts no new phenomenon. Second, the theorem is a classification statement whose assumptions are its content; it does not exclude quantum superposed sources, emergent geometry, or hybrid models, which are the open rows of the matrix. Third, the four-question diagnostic used against folk theories in Section 1.1 is a working tool for the physics community, not a contribution to the theory of demarcation.

= Conclusion

A century of unification talk has conflated three claims. Separated, they yield a cleaner map than the field has previously had: transformational unification is closed for laboratory sources by two lines of arithmetic; geometrical unification is confined to a nanoelectronvolt window with a completed instrument; algebraic unification is established mathematics with an undecidable ontology. The control-channel theorem identifies $T_("μν")$ as the only engineering entry point within general relativity plus the Standard Model. The decision matrix schedules the nineteen live propositions against concrete experiments, and six reproducible computations anchor sixteen of the rows.

The ambition behind the folklore survives this analysis in exactly one form. The question is no longer whether one field can be converted into another. It is what variable, if any, controls spacetime at its source, and the three surviving candidates, the quantum state, the kinematic algebra, and the relational structure, each have a scheduled experiment. If a technology of spacetime ever exists, it will operate on those candidates, not on a force. The map is the deliverable, and the map is falsifiable, which is all that a scientific claim is allowed to be.

#pagebreak()

#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. Tesla, N. Prepared statements and collected writings (primary sources).
2. Zhang, X. Unified Field Theory, v7.2 (folk corpus, primary source).
3. Bose, S. et al. Spin entanglement witness for quantum gravity. *Phys. Rev. Lett.* 119, 240401 (2017).
4. Marchese, M. M., Plávala, M., Kleinmann, M. & Nimmrichter, S. Newton's laws of motion generating gravity-mediated entanglement. *Phys. Rev. A* 111, 042202 (2025).
5. Fedida, S. & Kent, A. Mixture equivalence principles and post-quantum theories of gravity. *Phys. Rev. D* 111, 126016 (2025).
6. Salzger, M. & Vilasini, V. Higher-order quantum processes respecting closed labs in a spacetime. arXiv:2605.08351 (2026).
7. Vermeulen, S. M. et al. Photon counting interferometry to detect geontropic spacetime fluctuations with GQuEST. *Phys. Rev. X* 15, 011034 (2025).
8. Derevianko, A., Elwell, R. & Hudson, E. R. Colloquium: Nuclear clocks. arXiv:2606.11048 (2026).
9. Hiraki, T. et al. Controlling $""^229$Th isomeric state population in a VUV transparent crystal. *Nat. Commun.* 15, 5536 (2024).
10. Morgan, H. W. T. et al. A spinless crystal for a high-performance solid-state $""^229$Th nuclear clock. arXiv:2503.11374 (2025).
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
21. Yang, Y.-B. et al. Proton mass decomposition from the QCD energy momentum tensor. *Phys. Rev. Lett.* 121, 212001 (2018).
22. Liu, K.-F. Hadrons, superconductor vortices, and cosmological constant. *Phys. Lett. B* (2023).
23. Panda, C. D. et al. Measuring gravity by holding atoms. *Nature* 631, 515 (2024).
24. Ofengeim, D. D. & Piran, T. The 300 TeV photon from GRB 221009A. *Phys. Rev. D* 112, 083055 (2025).
25. Du, S.-S. et al. Hierarchical test of Lorentz invariance with GRB spectral-lag measurements. *Astrophys. J.* (2025).
26. Jalalzadeh, S. & Moradpour, H. Finite Hilbert space and maximum mass of Schwarzschild black holes from a GUP. *Phys. Lett. B* (2026).
27. Chiao, R. Y. et al. Gravitational Aharonov-Bohm effect. *Phys. Rev. D* 109, 064073 (2024).
28. Jusufi, K. et al. Signatures of modified gravity from the gravitational Aharonov-Bohm effect. *J. Cosmol. Astropart. Phys.* (2025).
29. Céleri, L. C., Soares-Pinto, D. O. & Turolla Vanzella, D. A. The apparatus strikes back. arXiv:2607.08819 (2026).
30. Wakakuwa, E. et al. Relativistic gravity-induced entanglement via frame dragging. arXiv:2606.31678 (2026).

#v(0.6em)
*Author contributions*　MuningAn conceived the classification and the theorem, performed all computations, and wrote the manuscript.
#v(0.3em)
*Competing interests*　The author declares no competing interests.
#v(0.3em)
*Data availability*　All computations, simulations, figures, the full nineteen-row matrix, and the complete reference list are available at github.com/everest-an/Antigravity.
