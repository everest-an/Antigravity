# From Anti-Gravity Myths to a Falsifiable Map of Spacetime Engineering

## English Submission Blueprint (Perspective / Framework Paper skeleton)

> 本文档为投稿用英文骨架：摘要 + 四节主干 + 数据锚点。
> 目标形态：Nature-family Perspective（经编辑 pitching）或 PRD/CQG/Foundations 框架论文。
> 中文全稿（90 节 + 附件）为支撑材料；本骨架是其压缩与形式化版本。

---

## Abstract

The folklore of Tesla's "anti-gravity" and the modern research frontier of quantum gravity
are usually treated as belonging to different worlds. We argue they are connected by a single
question: *what variable, if any, can be engineered to control spacetime?*

We make three contributions.

First, we classify unification claims into three logically distinct types —
**transformational** (field A converts into field B), **geometrical** (A and B are projections
of a higher-dimensional geometry), and **algebraic** (A and B share a deeper kinematic
algebra) — and show that the modern double-copy program realizes the third type, while
Tesla-era and folk theories attempt the first, which has no experimental basis.

Second, we prove a **control-channel uniqueness theorem**: within general relativity plus the
Standard Model, any engineering operation that keeps all sources, the metric structure, and
the interaction channels unchanged leaves all geodesic motion unchanged. Consequently
"inertia engineering" has no degrees of freedom independent of stress-energy engineering;
the efficacy of any proposed mass lever (Higgs vev, QCD scale, vacuum state) equals its
partial derivative with respect to the stress-energy tensor.

Third, we organize the quantum-gravity frontier into a **decision matrix**: 19 falsifiable
claims ("arrows"), each carrying an evidence grade, a discriminating experiment, a target
theory it would exclude, and a timescale. We provide reproducible order-of-magnitude
calculations and simulations anchoring 16 of these rows to the 2024–2026 literature
(QGEM protocols, GQuEST, frame-dragging interferometry, nuclear clocks, LIV/GUP bounds,
holographic tensor networks).

The resulting map shows that "anti-gravity" is an ill-posed engineering target, but that the
underlying ambition — engineering the source of geometry rather than geometry itself —
survives as a precise, testable research program, whose first steps are already scheduled
in existing and proposed experiments.

---

## 1. Three kinds of unification

- **Transformational unification** (A → B as a physical conversion): the Tesla/Zhang-style
  claim "changing EM fields generate gravity". Status: no experimental basis;
  the required field strengths exceed the Schwinger limit by an order of magnitude
  (simulation S02), and the claim is falsified as an engineering proposition.
- **Geometrical unification** (A, B ⊂ higher geometry): Kaluza–Klein. Mathematically real;
  the physical extra dimension remains unverified; its gravitational Aharonov-Bohm
  signatures are excluded at the eV scale by orbital fifth-force bounds and remain open
  only at the neV scale probed by the Th-229 nuclear clock (experiments E05, E08).
- **Algebraic unification** (shared kinematic algebra): the double copy. Established as an
  algebraic fact (off-shell N=8 supergravity as (N=4 SYM)²; coherent-state backgrounds
  double-copying to curved spacetimes; the Ehlers transformation as the double copy of
  electromagnetic duality). Its ontological import is undecidable by computation alone —
  a point we document explicitly (Appendix of the full text).

The classification matters because the three types fail differently: the first fails
quantitatively, the second remains observationally open, the third is real but silent on
ontology.

## 2. The control-channel uniqueness theorem

Let (M, g) be a GR spacetime with g determined by given sources and boundary conditions.
Let E be an engineering operation satisfying:
(A1) all field sources are unchanged;
(A2) the metric is not replaced by a solution not determined by those sources and boundary
conditions;
(A3) no beyond-Standard-Model channel is introduced.
Then E leaves all test-particle geodesic motion unchanged.

The theorem is a classification statement: (A1)–(A3) exhaust the control channels available
inside GR+SM. Violating A1 is stress-energy engineering (the only game in town);
violating A2 is metric engineering (requires exotic matter or modified gravity);
violating A3 is new physics (fifth forces — bounded by our fifth-force landscape computation;
LIV/GUP — bounded by GRB/AGN/LLR data at 10¹⁵–10¹⁶ GeV scales).

Corollary (mass-lever efficacy): for any decomposition of mass
m = m_Higgs + m_QCD + m_vac + …, the gravitational efficacy of each component as an
engineering lever equals ∂T_μν/∂(that component). The Higgs enters ~9% of the proton mass
term; QCD carries ~91%; "vacuum engineering" is not even well-defined, since the vacuum
contribution to T_μν depends on the regularization scheme (cutoff: +Λ⁴; zeta: 0;
MS: ±m⁴ ln(m²/μ²) — computation E09).

The theorem is deliberately bounded: it holds for classical GR with classical sources.
Quantum superposed sources, emergent-geometry hypotheses, and hybrid classical-quantum
models lie outside it — and are precisely the open rows of the decision matrix.

## 3. The decision matrix

19 rows; final statuses: 4 falsified, 2 established, 4 grade-A, 9 grade-B/C with explicit
discriminating channels and timescales. Representative rows:

| # | Arrow | Status | Discriminating channel |
|---|---|---|---|
| 3 | EM fields convert into gravity | falsified | Schwinger-limit computation |
| 5 | ⟨T̂μν⟩ as the quantum source of geometry | falsified | MEP (Fedida–Kent) + post-Newtonian consistency |
| 6/7 | Superposed mass sources superposed geometry / GIE witnesses nonclassical gravity | B | QGEM; LOCC exclusion logic verified by simulation S01/S06 |
| 9 | ICO implies quantum spacetime | falsified | QC-QC theorem (Salzger–Vilasini) |
| 12 | KK extra dimensions (AB splitting) | C; eV closed, neV open | orbital fifth-force bounds + Th-229 nuclear clock |
| 13 | Screened fifth forces | largely excluded; bounds tabulated | E08 landscape |
| 15 | Geontropic spacetime fluctuations | C; falsifiable only at the strong scale | GQuEST (0.03 s vs 10³³ s) |
| 17 | Inertia engineering ≠ T_μν engineering | established | Theorem of §2 |
| 19 | Planck-scale Lorentz violation / GUP | highly constrained, no significant evidence | GRB/AGN, LLR, optomechanics, nuclear clocks |

The methodological content: each row is required to carry a **discriminating experiment,
a target theory it would exclude, and a timescale** — the matrix is designed to be
independently recomputable (16 of 19 rows are anchored by the scripts in the repository).

## 4. Computable anchors (key numbers, all reproducible)

- QGEM entanglement phase: φ = 0.217 rad (Bose benchmark) vs 10⁻⁶–10⁻⁵ rad (realistic
  chip parameters) → 3σ certification requires ~10² vs 10⁹–10²¹ runs.
- Apparatus recoil bound ("the apparatus strikes back"): a free-floating 1 kg apparatus
  at 1 K caps the superposition of a 10⁹ u particle at ~100 μm — of the same order as
  MAQRO's target.
- Frame dragging: lab rotors produce Lense-Thirring precession ~10 orders below Earth's;
  the Gravity Probe B measurement is reproduced to order of magnitude.
- Gravitational Aharonov-Bohm: the predicted sideband modulation equals the classical
  redshift variation to all orders — the experiment discriminates interpretations, not GR.
- Entanglement→geometry: an isometric tree network reproduces S₂(A) ≈ mincut(A)·lnχ,
  including the disconnected-minimal-surface transition; two independent implementations
  (hand-rolled and quimb-native) agree.
- Qubit abstraction of QGEM is faithful: CV negativity converges to the qubit value with
  error ~e^(−2α²) (α = 2: ~10⁻⁴).

## 5. Outlook

If the frontier progresses as the matrix anticipates, the first half-decade will close rows
15 (GQuEST), 12 (nuclear clock in gravity gradients), and sharpen 6/7 (QGEM first rounds).
The open question the matrix ultimately encodes is not "can we build anti-gravity" but
"what is the source variable of spacetime" — with three live candidates (the quantum state,
the kinematic algebra, the relational structure) already placed in a common framework.

The map, not the machine, is the deliverable. And the map is falsifiable — which is all
that a scientific claim is allowed to be.

---

## Submission metadata (to be completed)

- Suggested venues: Nature Physics Perspective (pitch to editors); PRD/CQG/Foundations
  (framework paper); SHPSM (conceptual part only).
- Length targets: Perspective 8–12 pages; framework paper 30–50 pages.
- Required before submission: priority searches (three-unification classification;
  lever-efficacy statement); author affiliation; AI-assistance disclosure per journal policy.
