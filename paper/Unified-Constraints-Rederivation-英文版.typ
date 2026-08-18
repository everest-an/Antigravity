#set page(paper: "a4", margin: (x: 2.2cm, y: 2.4cm), numbering: "1 / 1")
#set text(font: ("New Computer Modern", "Noto Serif SC"), size: 10.5pt)
#set par(justify: true, first-line-indent: 1.6em, leading: 0.8em)
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
  #text(size: 16pt, weight: "bold")[Unified Rederivation of Constraints: Twenty-One Gravitational Boundaries in a Single Framework]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · Paper E1 (code at github.com/everest-an/Antigravity)]
]

#par(justify: false, first-line-indent: 0em)[
*Abstract*　We rederive twenty-one experimental constraints on quantum-gravity frontiers within a single framework. The methodological discipline: *one boundary, one script*—each constraint is bound to an executable computation in the repository, so every boundary value is independently checkable. Constraints are organized by four evidence levels: falsified (four: the Schwinger-limit bound on electromagnetic-to-gravitational conversion, the mixed-state equivalence-principle exclusion, the QC-QC theorem for indefinite causal order, the regularization dependence of vacuum energy); established (three: electroweak unification, the identity of inertial engineering and stress-energy engineering); Level-A experimental facts (four); and live Level-B/C constraints (ten, including the GIE phase, the full fifth-force landscape, the frame-dragging gap, the KK window, the geontropic falsifiable interval, and LIV bounds). Three representative derivations are presented in the main text (Schwinger inversion, KK signal inversion, GIE phase), and three logic items (double-copy ontology, ICO, the control-channel theorem) are included in documented form. The product of this paper is methodological: a constraint table whose every row is independently checkable, and the computational infrastructure that sustains it.

*Keywords*　quantum gravity; constraints; reproducibility; adjudication matrix; fifth force; equivalence principle
]

#pagebreak()

= Method: One Boundary, One Script

Phenomenological constraints on quantum gravity are conventionally presented piecemeal: each constraint uses its own geometry, its own approximations, its own notation. The discipline of this paper is the reverse: *all twenty-one boundaries are rederived in a single framework (linearized gravity plus effective parametrization), each bound to an executable script.* Three benefits follow: (1) boundary values can be independently checked by any reader; (2) updating one input (e.g., a new nuclear-clock stability value) automatically propagates to all linked tables; (3) relative strengths of constraints become directly comparable, because their input assumptions are made explicit.

The constraint list is given in Table 1. Evidence levels follow the Level A-D system; the script column gives repository filenames.

#figure(
  table(
    columns: (0.4fr, 2.2fr, 1.3fr, 1.9fr, 1.4fr),
    align: (left, left, left, left, left),
    [*Row*], [*Proposition*], [*Level*], [*Boundary (order of magnitude)*], [*Script*],
    [1-2], [Electromagnetic/electroweak unification], [A], [EW convergence at ~100 GeV; GUT three-line near-miss], [experiments/10],
    [3], [EM $arrow.r$ gravitational conversion], [Falsified], [Requires $8 times E_"Schwinger"$], [simulations/02],
    [4], [Double-copy ontology], [B], [Logic item], [documented],
    [5], [$angle hat(T)_("μν") angle$ sources], [Falsified], [MEP violation (numerical reproduction)], [experiments/11],
    [6-7], [GIE witness], [B], [$phi = 0.217 "rad"$ (baseline)], [simulations/01,06],
    [8], [Post-Newtonian GIE], [C], [Gap of ~7 orders], [experiments/07, simulations/04],
    [9], [ICO $arrow.r$ quantum spacetime], [Falsified], [Logic item], [documented],
    [11], [Quantum WEP], [B], [Shot-noise floor far below observation], [experiments/03],
    [12], [KK extra dimensions], [C], [eV closed, neV open], [experiments/05],
    [13], [Fifth force], [Falsified for O(1)], [α-bound staircase over λ], [experiments/08],
    [14], [Vacuum engineering], [Falsified], [Regularization dependence (sign flip)], [experiments/09],
    [15], [Geontropic], [C], [Strong 0.03 s / weak $10^33$ s], [experiments/02],
    [16], [Graviton noise], [C], [μK temperature threshold], [experiments/12],
    [17], [Inertial engineering $eq$ $T_("μν")$ engineering], [Classification], [Logic item (theorem)], [documented],
    [18], [Entanglement $arrow.r$ geometry], [C], [$S_2 approx "mincut" dot ln chi$], [simulations/03,05,07],
    [19], [LIV/GUP], [B], [$E_("QG",1) > 1 times 10^19 "GeV"$ (single event)], [experiments/13],
    [20], [Coherent-source hypothesis], [B], [$phi$ leverage, magnitude known], [simulations/01,06],
    [20b], [KK neV window], [C], [α_min reachability table], [experiments/05,14],
  ),
  caption: [Table 1: The twenty-one constraints. All scripts runnable from a single entry point (test_all.py).]
)

= Representative Derivation 1: Schwinger Inversion

The verdict on electromagnetic-field gravitation is settled at the principle level. Inverting the Poisson equation with electromagnetic energy density as source (factor 2 accounts for pressure content),

$ E_"needed" = sqrt((2 rho_"needed") / epsilon_0), quad rho_"needed" = (g c^2) / (8 pi G L), $ <eq-schwinger>

for $g = 9.8 "m/s"^2$, $L = 1 "m"$ gives $E_"needed" approx 1.1 times 10^19 "V/m"$, about eight times the Schwinger limit $1.3 times 10^18 "V/m"$. At this value the vacuum becomes unstable to electron-positron pair production; the conversion program closes here—*not technically unreachable, but impossible in principle*.

= Representative Derivation 2: KK Signal Inversion

The lightest mode of an extra compact dimension gives a Yukawa correction $V = -(G m_1 m_2/r)(1+alpha e^(-r/lambda))$; a nuclear system in free fall around a gravitating body acquires a splitting

$ Delta E = m_"sys" alpha Delta Phi. $ <eq-ab>

For a thorium nucleus in low Earth orbit ($e = 0.01$): $Delta Phi approx 2 g a e approx 1.18 times 10^6 "m"^2/"s"^2$, hence $Delta E approx 2.8 alpha "eV"$. An eV-scale splitting would require $alpha approx 0.4$, excluded by orbital constraints by 7-8 orders of magnitude; a meV-scale splitting requires $alpha approx 10^(-3)$, likewise excluded. The surviving window lies at neV and below. The laboratory configuration (100 kg source) has signal coefficient $9.5 times 10^(-14) alpha "eV"$, the orbital configuration $2.8 alpha "eV"$—reachability tables for both configurations are given in the companion experimental-design document.

= Representative Derivation 3: GIE Phase

Two masses each in a spatial superposition; the four-branch relative phase takes the exact form

$ phi = (G m^2 t)/(ℏ) (1/(d+Delta x) + 1/(d-Delta x) - 2/d). $ <eq-gie>

Baseline parameters give $phi = 0.217 "rad"$ (negativity $N approx 0.078$, CHSH violation 0.024, numerically simulated); realistic chip parameters give $10^(-6) ~ 10^(-5) "rad"$, inflating the 3σ certification from ~200 runs to $10^9 ~ 10^21$ runs. A three-model simulation (quantum/mean-field/LOCC) implements the exclusion logic; a continuous-variable version verifies the fidelity of the qubit abstraction with deviation $e^(-2 alpha^2)$.

= The Three Logic Items

*Row 4 (double-copy ontology)*: The algebraic facts hold (off-shell N=8 = (N=4)²; coherent-state background maps; Ehlers = square of electromagnetic duality), but the residual gauge-algebra collapse shows that a shared algebra does not imply shared physical content—ontological status cannot be settled by computation. This is an inductive problem; no script can be written.

*Row 9 (ICO $arrow.r$ quantum spacetime)*: The Salzger-Vilasini theorem—QC-QC is exactly the set of all higher-order processes realizable in classical acyclic spacetimes. The quantum switch's "indefinite causal order" can be unfolded, at a fine-grained level, into acyclic structure in classical spacetime. Logical exclusion; no script can be written.

*Row 17 (inertial engineering $eq$ $T_("μν")$ engineering)*: A corollary of the control-channel uniqueness theorem (see the companion paper). A classification statement; the evidence is the theorem itself.

= Conclusion

Twenty-one boundaries have been rederived within a single framework, each bound to an executable script or a documented logic item. The contribution of this paper is not any single boundary—most exist in the literature—but *the organization of boundaries*: checkable, propagatable, comparable. When nuclear-clock stability, GQuEST sensitivity, or QGEM parameters are updated, the corresponding rows of Table 1 update by re-running scripts. The constraint table thereby becomes living domain infrastructure rather than a static review.

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. Fedida, S. & Kent, A. *Phys. Rev. D* 111, 126016 (2025).
2. Bose, S. et al. *Phys. Rev. Lett.* 119, 240401 (2017).
3. Marchese, M. M. et al. *Phys. Rev. A* 111, 042202 (2025).
4. Salzger, M. & Vilasini, V. arXiv:2605.08351 (2026).
5. Vermeulen, S. M. et al. *Phys. Rev. X* 15, 011034 (2025).
6. Panda, C. D. et al. *Nature* 631, 515 (2024).
7. Touboul, P. et al. *Phys. Rev. Lett.* 129, 121102 (2022).
8. Du, S.-S. et al. *Astrophys. J.* (2025).
9. Jusufi, K. et al. *J. Cosmol. Astropart. Phys.* (2025).
10. Maclay, G. J. & Davis, E. W. *Found. Phys.* 49, 797 (2019).
11. Holton, B. arXiv:2509.24112 (2025).
12. Céleri, L. C. et al. arXiv:2607.08819 (2026).

#v(0.4em)
*Code availability*　All scripts at github.com/everest-an/Antigravity (test_all.py for one-command regression).
