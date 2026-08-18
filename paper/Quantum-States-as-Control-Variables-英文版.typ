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
  #text(size: 16pt, weight: "bold")[Quantum States as Control Variables in Gravity Tests: A Unified Zero-Background Theorem]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · Paper E5 (first version, with explicit falsification clause)]
]

#par(justify: false, first-line-indent: 0em)[
*Abstract*　Gravity tests have traditionally treated quantum states as "cleaner detectors"; this paper shows that quantum states can do more—they can serve as *control variables*. We unify three scheduled state-control tests (the nuclear-clock state-dependence search, GIE internal-state control, and spin-resolved frame dragging) under one theorem: in a local, Lorentz-invariant, weakly coupled effective field theory (EFT), the dependence of the gravitational/Yukawa coupling on the probe's internal state is suppressed by dimension-6 power counting—$delta alpha/alpha = angle O_"eff" angle M_"Pl"/(sqrt(alpha) Lambda^2 m_"probe")$ for a massive mediator, and $delta G/G = angle O angle M_"Pl"^2/(Lambda^2 d^2 M_"src" m_"probe")$ for the massless graviton. The EFT upper bounds of the three cases lie 10.7, 13.1, and 28.3 orders of magnitude below their respective readout sensitivities: *state-control tests are zero-background within the entire class of weakly coupled local EFTs*. Any observable state-dependent signal therefore simultaneously falsifies general relativity, standard KK, and every weakly coupled local EFT, pointing to strongly coupled, non-local, or state-charged gravitational sectors. The theorem carries an explicit falsification clause and a "state-control column" for the adjudication matrix. All numbers come from experiments/18; Fig. 8 visualizes the gaps.

*Keywords*　quantum states; gravity tests; effective field theory; zero background; state-dependent coupling; adjudication matrix
]

#pagebreak()

= Introduction: From "Which Detector" to "Which State"

The experimental history of gravity testing is a history of detectors: torsion balances, atom interferometers, nuclear clocks. Each step reduces systematic errors, but the detector always plays a passive role—it measures gravitational effects in a given geometry. This paper proposes a different use: *the quantum state itself as a control variable*. The probe's internal state (nuclear isomer state, electronic internal state, spin orientation) becomes a switchable experimental knob; the presence or absence of a state-dependent signal is itself the object of adjudication.

This idea exists in the literature in scattered form: the advanced stage of the nuclear-clock design proposes microwave control of the nuclear internal state; the upgraded GIE proposal asks whether the entanglement coupling is modulated by the quantum state. This paper unifies them into one framework and gives a unified zero-background theorem.

= General Framework: Four Ingredients and Three State-Control Channels

A gravity test consists of four ingredients: source (mass distribution), probe (quantum system), observable (phase/frequency/entanglement), and state (control over the probe's internal state). Traditional experiments optimize the first three; state-control experiments make the fourth an independent variable. There are three state-control channels:

#set par(first-line-indent: 0em)
- *Internal-state channel*: two internal states of a single system (ground/isomer states of the nuclear clock)—the distinguishing operator is the nuclear quadrupole moment $Q_("ij")$;
- *Superposition channel*: mass superposition and entanglement as a resource (GIE)—the internal-state-control version uses the electronic internal state (dipole/spin) as the distinguisher;
- *Spin-orbit channel*: spin orientation as the knob (frame-dragging readout)—the distinguisher is the spin $S$.
#set par(first-line-indent: 1.6em)

The common structure of the three channels: the matrix element $angle O angle$ of the state-distinguishing operator $O$ sets the theoretical ceiling on the state-dependent coupling.

= Theorem: The Universal EFT Bound on State-Dependent Coupling

#set par(first-line-indent: 0em)
*Theorem (Zero-background property of state control)*. In a local, Lorentz-invariant, weakly coupled EFT (cutoff $Lambda$), let the probe (mass $m_"probe"$) have internal states distinguished by the operator $O$, with Wilson coefficient $c ~ O(1)$.

(1) *Massive mediator* (strength $alpha$ relative to gravity, range $lambda$): the leading state-distinguishing realization is the dimension-6 operator $c O_("ij") partial_i partial_j phi/Lambda^2$; in the static limit,

$ (delta alpha)/(alpha) = (c angle O_("eff") angle M_"Pl")/(sqrt(alpha) Lambda^2 m_"probe"), quad angle O_("eff") angle = angle O angle/lambda^2. $ <eq-massive>

(2) *Massless graviton* (source mass $M_"src"$, distance $d$): the ratio of the state-dependent potential to the gravitational potential is

$ (delta G)/(G) = (c angle O angle M_"Pl"^2)/(Lambda^2 d^2 M_"src" m_"probe"). $ <eq-massless>

*Corollary (zero background)*: Both upper bounds lie more than 10 orders of magnitude below the readout sensitivities of all scheduled state-control experiments (Table 1, Section 4). Hence *state-control tests expect zero background within the class of weakly coupled local EFTs*; any observable state-dependent signal constitutes a simultaneous falsification of GR, standard KK, and all weakly coupled local EFTs.
#set par(first-line-indent: 1.6em)

Eq. @eq-massive generalizes Corollary 4 of the companion classification theorem (Paper T2): Corollary 4 is the special case $O = Q_("ij")$, $m_"probe" = m_"Th"$; Eq. @eq-massless covers the state dependence of the graviton itself (the state-resolved version of the equivalence principle).

= Three Cases

#figure(
  table(
    columns: (1.1fr, 1.2fr, 1.4fr, 1.2fr, 1.2fr, 1.1fr),
    align: (left, left, left, left, left, left),
    [*Test*], [*Distinguishing operator*], [*EFT upper bound*], [*Readout sensitivity*], [*Zero-background gap*], [*Script/Fig.*],
    [Nuclear-clock state dependence], [$Q ~ 9.4 "b"$], [$delta alpha = 5.4 times 10^(-22)$], [$3 times 10^(-11)$ (5σ)], [10.7 orders], [17, Fig. 7],
    [GIE internal-state control], [$e dot a_"B"$ (conservative)], [$delta G/G = 7.4 times 10^(-16)$], [$10^(-2)$ (phase)], [13.1 orders], [18, Fig. 8],
    [Frame dragging], [$S ~ 1$], [$delta G/G = 4.9 times 10^(-31)$], [$10^(-2)$ (phase)], [28.3 orders], [18, Fig. 8],
  ),
  caption: [Table 1: The three cases. All at $Lambda = 10 "TeV"$, $c = 1$; GIE at $m = 10^(-14) "kg"$, $d = 450 μ"m"$; nuclear clock at $alpha = 10^(-6)$, $lambda = 1 "m"$. The bounds tighten as $Lambda^2$; the gaps only grow.]
)

The ordering of the gaps (nuclear clock < GIE < frame dragging) reflects differences in probe mass and distance, not in methodology—the common point of the three is that *all gaps are enormous*. The conclusion is robust to the choice of distinguishing operator (for GIE, taking the NV spin magnetic moment instead of the atomic dipole raises the gap to 31 orders; see script 18).

= The State-Control Column of the Adjudication Matrix

The methodological discipline of the adjudication matrix is one discriminating channel per row. The state-control framework adds a column: whenever a probe possesses an internal-state distinction, that row automatically acquires a zero-background state-control test. Concretely:

#set par(first-line-indent: 0em)
- Row 12 (KK extra dimensions): the nuclear-clock state-dependence search (Corollary 4);
- Rows 6-7 (GIE): the internal-state-control upgrade;
- Row 8 (frame dragging): spin-resolved readout.
#set par(first-line-indent: 1.6em)

The three columns share one zero-background theorem—the state-control framework's payback to the matrix methodology: the falsifiability of a test is upgraded from "search within a window" to "zero-background falsification".

= Falsification Clause

The theorem's falsification clause agrees with the fifth clause of Paper T2 and is refined here: *if any state-control experiment measures a state-dependent signal above the Table 1 readout sensitivity, then GR, standard KK, and every weakly coupled local EFT are simultaneously falsified*, and the new physics must belong to one of three classes: a strongly coupled sector (cutoff at the $≤ 43 "MeV"$ scale, see script 17), a non-local theory, or a state-charged gravitational sector (gravitational coupling carrying state quantum numbers). The testable signatures of the three—the energy structure of strong coupling, propagator modifications of non-locality, and the selection rules of state charge—constitute the search list for follow-up work.

= Conclusion

The quantum state is the fourth variable of gravity testing. This paper gives its unified framework and zero-background theorem: three channels (internal-state / superposition / spin-orbit) share one dimension-6 power counting, and the zero-background gaps of the three scheduled experiments range from 10.7 to 28.3 orders of magnitude. State-control tests are thus "zero-background falsification" experiments: with no signal they confirm the self-consistency of the EFT picture; with a signal they open, in one stroke, three exits—strong coupling, non-locality, or state charge. This is the upgrade from "measuring gravity" to "measuring the state dependence of gravity".

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. MuningAn. A Classification Theorem for Gravitational Control Channels (Paper T2, 2026)—Corollary 4 and its derivation.
2. MuningAn. Nuclear-Clock Experiment Design (v2.0, 2026)—advanced stage and GIE backup appendix.
3. Bose, S. et al. *Phys. Rev. Lett.* 119, 240401 (2017).
4. Vermeulen, S. M. et al. *Phys. Rev. X* 15, 011034 (2025).
5. Zhang, C. et al. *Nature* (2024) (direct Th-229 excitation).
6. Derevianko, A., Elwell, R. & Hudson, E. R. Colloquium: Nuclear clocks. arXiv:2606.11048 (2026).
7. Jusufi, K. et al. *J. Cosmol. Astropart. Phys.* (2025).
8. Kapner, D. J. et al. *Phys. Rev. Lett.* 98, 021101 (2007).
9. Touboul, P. et al. *Phys. Rev. Lett.* 129, 121102 (2022) (MICROSCOPE).
10. Donoghue, J. F. *Phys. Rev. D* 50, 3874 (1994) (the EFT power-counting benchmark).

#v(0.4em)
*Code availability*　experiments/17 (Corollary 4), 18 (the unified zero-background theorem), and Figs. 7-8 at github.com/everest-an/Antigravity.
