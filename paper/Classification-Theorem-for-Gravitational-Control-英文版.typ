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
  #text(size: 16pt, weight: "bold")[A Classification Theorem for Gravitational Control Channels: The Effective-Field-Theory Framework]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · Paper T2 (first version, with explicit falsification clause)]
]

#par(justify: false, first-line-indent: 0em)[
*Abstract*　We prove, within the effective field theory (EFT) of general relativity plus the Standard Model, a classification theorem for gravitational control channels: every low-energy, Lorentz-invariant metric-matter coupling that acts on test-particle motion falls into exactly one of three classes organized by symmetry and dimension—the source channel (minimal coupling through Tμν and higher-dimension operators, i.e., energy/pressure/current engineering), the geometric channel (curvature couplings, suppressed by 1/M_Pl or constrained by observation), and the new-sector channel (fields beyond the Standard Model, constrained by fifth-force and Lorentz-invariance tests). Corollary: gravitational engineering within GR+SM is equivalent to stress-energy engineering; any "antigravity" device must pass through one of the three channels, and each channel is quantitatively bounded. The proof rests on four pillars: the positive energy theorem (no net repulsive gravity from isolated systems under the dominant energy condition), EFT dimensional analysis (curvature terms unreachable), PPN and gravitational-wave observations (suppression of geometric-channel coefficients), and quantum inequalities (quantum bound on the source channel). The theorem's relation to the warp-drive no-go literature is one of containment; differences are stated explicitly. Corollary 4 gives the EFT upper bound on state-dependent coupling: the dependence of the Yukawa coupling on the nuclear internal state is suppressed by about 16 orders of magnitude ($delta alpha approx 5.4 times 10^(-22)$ for $alpha = 10^(-6)$, $Lambda = 10 "TeV"$, $lambda = 1 "m"$), more than 10 orders below the nuclear-clock reachability—the clock's state-dependence search is therefore a zero-background falsification test (script 17, Fig. 7).

*Keywords*　effective field theory; no-go theorems; positive energy theorem; energy conditions; gravitational engineering
]

#pagebreak()

= Introduction

The literature on "gravitational engineering" has long been polarized: on one side, metric constructions of warp drives and wormholes (violating energy conditions); on the other, folk proposals of "electromagnetic antigravity" (violating order-of-magnitude accounting). Missing between the two is a unified classification statement: *within known physics, how many channels exist for controlling gravity, and what closes each one*. This paper provides the statement and its proof.

Existing scattered results provide the proof's material: the positive energy theorem closes the possibility of repulsive gravity from ordinary matter; the warp-drive no-go series proves specific metric classes cannot bypass the source channel; fifth-force tests close short-range modifications. The novelty here is their integration into a single theorem stated in engineering language.

= Framework: the EFT of GR+SM

Metric-matter couplings are organized by dimension at low energies. All Lorentz-invariant interactions are composed of: the metric $g_("μν")$ and its curvature invariants; the Standard Model fields and their gauge charges; and all allowed Lorentz contractions between them. Expanding in $M_"Pl" = (ℏ c/G)^(1/2)$:

$ S = S_("EH") + S_("SM") + S_("min") + S_("curv") + S_("new"), $ <eq-eft>

where $S_("min")$ is minimal coupling of matter to the metric (encoded by $T_("μν")$), $S_("curv")$ collects curvature couplings ($R^2$, Gauss-Bonnet, Weyl-squared, etc., with coefficients of order $c_i/M_"Pl"^2$), and $S_("new")$ is the new sector (any field beyond the SM and its couplings to metric and matter). This decomposition is complete: any local, Lorentz-invariant metric-matter coupling belongs to one of the three.

= Statement of the Theorem

#set par(first-line-indent: 0em)
*Theorem (Classification of Gravitational Control Channels)*. Let $E$ be an engineering operation acting on test-particle motion, whose physical implementation is described by the low-energy EFT of GR+SM (locality, Lorentz invariance, unitarity). Then the effect of $E$ is transmitted via one of the following three channels (or a combination):

(C1) *Source channel*: $E$ changes some matter's $T_("μν")$ (including pressure, currents, shear)—i.e., energy engineering;

(C2) *Geometric channel*: $E$ activates curvature couplings in $S_("curv")$—suppressed by $1/M_"Pl"^2$ or constrained by PPN/gravitational-wave observations, unreachable in the laboratory;

(C3) *New-sector channel*: $E$ activates a new field in $S_("new")$—its couplings constrained by fifth-force/Eöt-Wash/Casimir/LIV tests, with surviving windows delimited by adjudication-matrix rows 13, 19, 20b.

*Corollary 1*: Gravitational engineering within GR+SM is equivalent to stress-energy engineering.
*Corollary 2*: The efficacy of any mass-decomposition component as an engineering lever equals $partial T_("μν") / partial("that component")$.
*Corollary 3*: Effective-mass (dispersion-relation) engineering does not change $T_("μν")$ and is gravitationally inert.
*Corollary 4 (EFT upper bound on state-dependent coupling)*: If a new-sector mediator couples to the nuclear internal state (ground vs isomer), its minimal EFT realization (dimension-6, coefficient $c/Lambda^2$; derived in the next section) gives a state-dependent Yukawa coupling difference

$ delta alpha = sqrt(alpha) (c Q_"nuc" M_"Pl")/(Lambda^2 lambda^2 m_"nuc") approx 5.4 times 10^(-22) (sqrt(alpha)/10^(-3)) (10 "TeV"/Lambda)^2 (1 "m"/lambda)^2, $

with $Q_"nuc" approx 9.4 "b"$ the Th-229 intrinsic quadrupole moment. For any $alpha$ in the allowed window and any $Lambda ≥ 1 "GeV"$, $delta alpha$ lies 3-13 orders below the nuclear-clock reachability (5σ $~ 3 times 10^(-11)$). The clock's state-dependence search is therefore a zero-background falsification test: any observation of $delta alpha > 10^(-11)$ simultaneously falsifies GR, standard KK, and every weakly coupled local EFT.
#set par(first-line-indent: 1.6em)

= Proof (Four Pillars)

== Pillar 1: The classical bound on the source channel (positive energy theorem)

The positive energy theorem (Schoen-Yau; Witten; 2026 extension to arbitrary ends) asserts: an isolated system satisfying the dominant energy condition has nonnegative ADM mass. Engineering corollary: no configuration of ordinary matter (satisfying the dominant energy condition) can produce net repulsive gravity at infinity—an "antigravity source" does not exist within the classical source channel. The quantum side of the source channel is bounded by quantum inequalities: the magnitude of negative energy density is inversely proportional to its duration; macroscopic maintenance is excluded (the disputed status of the inequalities does not affect this exclusion, see companion literature).

== Pillar 2: Unreachability of the geometric channel (EFT dimensional analysis)

Curvature couplings in $S_("curv")$ carry coefficients of order $c_i/M_"Pl"^2$: any configuration making a curvature term compete with $T_("μν")$ requires curvature of order $R ~ c_i^(-1) M_"Pl"^2$, i.e., Planck-scale geometry. Below that scale the curvature channel's effect on geodesics is far smaller than the source channel's. Higher-curvature theories are themselves pathological (loss of weak hyperbolicity), further supporting "the geometric channel cannot be engineered." Observationally: the PPN parameter ensemble and the GW170817 speed-of-light constraint already suppress low-order curvature corrections below $10^(-4)$.

== Pillar 3: Existing bounds on the new-sector channel

Couplings of new fields are subject to three classes of tests: (i) fifth force (Eöt-Wash excludes $alpha > 10^(-6)$ on scales $10^(-5) ~ 10^(-1) "m"$, MICROSCOPE and LLR cover orbital scales); (ii) Lorentz invariance (GRB single-event bound $E_("QG",1) > 10^19 "GeV"$, robust ensemble bound $> 10^15 "GeV"$); (iii) Casimir platforms (the $lambda < 10^(-5) "m"$ window). The union of the three constitutes the complete boundary of the new-sector channel—the content of adjudication-matrix rows 13 and 19.

== Pillar 4: Completeness

The decomposition of Eq. @eq-eft is complete for local, Lorentz-invariant, unitary EFTs (the standard EFT proposition: all allowed interactions are generated by symmetry). The three pillars close the usable parameter regions of the three channels respectively; hence the three channels together exhaust all control channels within GR+SM. QED.

= Derivation of Corollary 4 (the EFT bound on state-dependent coupling)

A KK-type mediator couples to matter universally, with $sqrt(alpha) m/M_"Pl"$ per vertex (universality is the equivalence-principle content; two vertices restore the Yukawa strength $alpha$). The nuclear internal state is distinguished by the quadrupole moment $Q_("ij")$; the leading operator distinguishing ground and isomer states is dimension-6:

$ O = c Q_("ij") partial_i partial_j phi / Lambda^2, quad c ~ O(1), $ <eq-sdop>

with $phi$ the KK scalar mode and $Lambda$ the EFT cutoff. In the static limit $partial^2 phi arrow.r m_"KK"^2 phi = phi/lambda^2$. The ratio of the state-dependent potential to the universal Yukawa potential is

$ (delta alpha)/(alpha) = (c Q_"nuc" M_"Pl")/(sqrt(alpha) Lambda^2 lambda^2 m_"nuc"). $ <eq-sdratio>

Three remarks. (i) $delta alpha$ grows as $sqrt(alpha)$—the state-dependent channel is relatively stronger for smaller $alpha$, but its absolute size remains far below reachability throughout the window (see the tables of script 17). (ii) Observability requires the cutoff to drop to about 43 MeV (at the window edge $alpha = 10^(-6)$; about 1 MeV at the reachability edge $alpha = 10^(-12)$)—that is, below the hadronic/QCD scale, where the local EFT description itself breaks down. (iii) New physics with a MeV cutoff at macroscopic $lambda$ was long excluded by fifth-force tests. Together: *the state-dependent signal is observable if and only if the local EFT description fails*. The advanced stage of the nuclear-clock design (microwave control of the nuclear internal state) is therefore a zero-background falsification test with a quantified threshold, whose target covers GR, standard KK, and all weakly coupled local EFTs; all numbers come from experiments/17, and Fig. 7 visualizes the zero-background criterion.

= Relation to the No-Go Literature (Statement of Differences)

The warp-drive no-go results (Bobrick-Martire; Le; Barzegar-Buchert-Vigneron) are special cases of the (C1)-(C3) classification within specific metric classes: each result proves that a particular metric-engineering proposal cannot bypass the source channel. The new necessity proofs for exotic matter (Maier 2026; Cataldo 2026) directly strengthen the source-channel boundary. The generalizations of this theorem are: (i) coverage of arbitrary engineering operations rather than specific metric classes; (ii) statement in engineering language (control variables, lever efficacy); (iii) row-by-row correspondence of the three channel boundaries with the adjudication matrix.

= Falsification Clause and Boundary

*Falsification clause*: The theorem fails in five cases, and failure is discovery: (1) the dominant energy condition is experimentally violated (source channel reopens); (2) some curvature coupling is observed with coefficient far above the $1/M_"Pl"^2$ suppression (geometric channel reopens); (3) fifth-force/LIV tests find significant signals (new-sector channel opens); (4) the nuclear-clock state-dependence search measures $delta alpha > 10^(-11)$ (Corollary 4's zero-background criterion is violated—covering strongly coupled, non-local, and state-charged gravitational sectors); (5) quantum superposition sources or emergent-geometry mechanisms (not covered by the theorem; corresponding to adjudication-matrix rows 6-7, 18, 20). Each of the five cases has scheduled adjudication experiments—the theorem's falsifiability is thereby made explicit.

*Boundary*: The theorem is a classification statement, not a discovery statement; it does not predict new phenomena, it states precisely why old intuitions fail and where the surviving alternative exits are located.

= Conclusion

Within the EFT of GR+SM, gravitational control channels are classified as source, geometric, and new-sector; each class carries a quantitative boundary, and each boundary has an executable script. The theorem converts "is antigravity possible" from a folklore question into an engineering question with explicit parameter regions; its falsification clause lists five reopening conditions, each mapped to a scheduled experiment—among them the nuclear-clock state-dependence search (Corollary 4), a zero-background falsification test for the entire class of local EFTs.

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. Schoen, R. & Yau, S.-T. *Commun. Math. Phys.* 65, 45 (1979); 79, 231 (1981).
2. Witten, E. *Commun. Math. Phys.* 80, 381 (1981).
3. Tsang, T.-Y. Positive mass theorem for initial data sets with arbitrary ends. arXiv:2604.26978 (2026).
4. Donoghue, J. F. *Phys. Rev. D* 50, 3874 (1994).
5. Burgess, C. P. *Living Rev. Rel.* 7, 5 (2004).
6. Will, C. M. *Living Rev. Rel.* 17, 4 (2014).
7. Ford, L. H. & Roman, T. A. *Phys. Rev. D* 87, 085001 (2013).
8. Maier, R. A No-Go Theorem for Topological Bridges with Matter-Vacuum Coupling. arXiv:2605.14027 (2026).
9. Cataldo, M. Can wormhole spacetimes in Unimodular Gravity be supported by ordinary matter? arXiv:2603.14718 (2026).
10. Bobrick, A. & Martire, G. *Class. Quantum Grav.* 38, 105009 (2021).
11. Barzegar, H., Buchert, T. & Vigneron, Q. arXiv:2602.16495 (2026).
12. Kapner, D. J. et al. *Phys. Rev. Lett.* 98, 021101 (2007).
13. Du, S.-S. et al. *Astrophys. J.* (2025).
14. Weak hyperbolicity of higher-curvature EFTs (arXiv query q4, 2025).

#v(0.4em)
*Code availability*　All scripts for the three channel boundaries at github.com/everest-an/Antigravity.
