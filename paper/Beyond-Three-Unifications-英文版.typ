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
#show figure: set block(above: 1em, below: 1.2em)
#show table: set text(size: 8.5pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[Beyond Three Unifications: The Three Surviving Exits and a Falsifiable Candidate Principle]
  #v(0.5em)
  #text(size: 11.5pt)[MuningAn$""^1$ · PlanetarySystem$""^1$]
  #v(0.3em)
  #text(size: 9.5pt)[$""^1$ PlanetarySystem. Repository: github.com/everest-an/Antigravity]
]

#par(justify: true)[
*Abstract*　The companion paper "Three Unifications" established that within general relativity plus the Standard Model, every classical route to "anti-gravity" is quantitatively closed: transformational unification requires field strengths eight times the Schwinger limit, and the control-channel uniqueness theorem identifies stress-energy as the only engineering entry. This paper performs the exclusion argument to its conclusion and answers the question of what remains. Three surviving exits are examined one by one. (i) Macroscopic negative energy: closed; the quantum-inequality bounds are experimentally contested, but macroscopic utilization is excluded, and the exit reopens only if a dedicated experiment first falsifies the inequalities. (ii) The nanoelectronvolt window of geometrical unification: open, and this paper supplies the discriminating experiment, a Th-229 nuclear clock measuring the Yukawa-modulated gravitational redshift on an elliptical orbit, with signal $Delta E approx 2.8 alpha "eV"$ and an $alpha$-reach of $3 times 10^(-18)$ at $10^(-18)$ fractional stability, three orders beyond current orbital bounds. (iii) Quantum emergent gravity: this paper proposes the *coherent-source hypothesis* as a candidate principle. Gravity couples to the quantum state of matter, not to its expectation value; the gravitational phase of a superposed source constitutes the only control channel outside the theorem. Its quantitative form is given (Eq. 5), its magnitude computed (0.217 rad benchmark; $10^(-6) ~ 10^(-5)$ at laboratory scale), its compatibility with every existing constraint (fifth force, MICROSCOPE, Eöt-Wash, apparatus recoil) checked, and three falsifiable predictions stated. The hypothesis is recorded as row 20 of the decision matrix, grade B, with scheduled discriminating experiments. The paper strictly separates established physics, its own derivations, and conjecture.

*Keywords*　anti-gravity; quantum gravity; gravitationally induced entanglement; Kaluza-Klein; nuclear clock; falsifiability
]

#pagebreak()

= Introduction: from map to exclusion

The companion paper completed three tasks: it separated "unified field theory" into three claims (transformational, geometrical, algebraic); it proved the control-channel uniqueness theorem; and it organized nineteen live propositions into a decision matrix with discriminating experiments and timescales. This paper takes the next step: *exclusion*.

The logic of exclusion is to close every road that physics has already shut, and only then to propose a candidate principle inside the surviving window. Section 2 restates the exclusions and highlights the theorem's boundary. Sections 3-5 examine the three surviving exits. Section 6 states falsifiable predictions. Section 7 records the candidate principle as row 20 of the decision matrix and checks every existing constraint. Section 8 declares the layering.

= Exclusion: closed roads and the theorem's boundary

== Transformational unification: closed in principle

The verdict on transformational unification ("changing electromagnetic fields generate gravity") is delivered at the level of principle. Inverting the Poisson equation with the electromagnetic energy density as source,

$ E_"needed" = sqrt((2 rho_"needed") / epsilon_0), quad rho_"needed" = (g c^2) / (8 pi G L), $ <eq-schwinger>

gives $E_"needed" approx 1.1 times 10^19 "V/m"$ for Earth gravity at a 1 m scale, eight times the Schwinger limit ($1.3 times 10^18 "V/m"$), where the vacuum is unstable against pair production. The road is closed by principle, not by technology. Every proposal that uses classical electromagnetic fields as an anti-gravity source must first pass Eq. @eq-schwinger. Adjacent to it, the fifth-force parameter space (Yukawa correction $a_Y = alpha (G M)/(r^2) (1 + r/lambda) e^(-r/lambda)$) is excluded at order unity across $10^(-4) "m"$ to $10^9 "m"$ by Eöt-Wash, lattice atom interferometry, MICROSCOPE, and lunar laser ranging.

== The theorem, and why its boundary is the exit

The theorem (Section 6 of the companion paper): within general relativity plus the Standard Model, an engineering operation satisfying (A1) source invariance, (A2) metric non-intervention, and (A3) channel closure leaves every geodesic unchanged. Its content is the completeness of (A1)-(A3): violating (A1) is energy engineering (closed by Eq. @eq-schwinger); violating (A2) is metric engineering, requiring exotic matter or modified gravity (exits one and two); violating (A3) is new physics (fifth forces excluded; LIV/GUP tightly bounded).

*The theorem's boundary is now elevated to the paper's key proposition*: the theorem holds only for classical sources. Quantum superposed sources, emergent-geometry hypotheses, and hybrid classical-quantum models lie outside it. The theorem is therefore not the end of anti-gravity research but its *map boundary*: no road inside, exactly three openings outside. This paper examines those openings one by one.

- *Exit one*: macroscopic negative energy, violating (A2) through exotic matter.
- *Exit two*: extra dimensions, violating (A2) through modified geometry; the neV window.
- *Exit three*: quantum sources the theorem does not govern; the coherent-source hypothesis.

= Exit one: macroscopic negative energy (closed, with a precise reopening condition)

Quantum field theory allows local negative energy density, but Ford-Roman-type quantum inequalities bound it, for inertial observers, by an inverse relation between magnitude and duration. Two facts define this exit. First, the experimental status of the inequalities is contested: the Maclay-Davis meta-analysis of squeezed-light data finds violations of a proposed inequality. Second, regardless of that contestation, *macroscopic utilization of negative energy is excluded*: the sustained negative energy required by traversable wormholes, warp drives, and repulsive-gravity devices is incompatible with all existing precision gravity experiments.

The precise verdict on exit one is therefore: *closed, but for a precise reason*. It is not that negative energy does not exist; it is that macroscopic sustainment conflicts with all known experiments, and the only way to reopen the road is first to falsify the quantum inequalities in a dedicated experiment. The falsifiable prediction we record for that route, independent of our candidate principle, is: if the inequalities are macroscopically violable, then the mean energy density in a high-gain squeezed-vacuum cavity should deviate measurably from the bound.

= Exit two: the neV window of geometrical unification (open, and a discriminating experiment is given here)

== Window position and signal form

An extra compact dimension contributes a Yukawa correction $V(r) = -(G m_1 m_2/r)(1+alpha e^(-r/lambda))$, with $alpha$ the coupling of the lightest extra mode and $lambda$ its Compton range. A quantum system in free fall around a gravitating body acquires an energy-level splitting

$ Delta E = m_"sys" alpha Delta Phi(r, lambda), $ <eq-ab>

with $Delta Phi$ the peak-to-peak variation of the corrected potential. Inverting Eq. @eq-ab: electronvolt splittings for nuclear systems require $alpha approx 0.4$, excluded by seven to eight orders of magnitude; the allowed window is at the nanoelectronvolt scale.

== The discriminating experiment: orbital redshift modulation of a nuclear clock

- *Instrument*: the Th-229 nuclear clock (8.3557 eV transition; direct 148 nm excitation achieved; solid-state hosts with six-hundred-second lifetimes in place).
- *Platform*: low Earth orbit, eccentricity $e = 0.01$, altitude 400 km. The peak-to-peak gravitational-potential variation is $Delta Phi approx 2 g a e approx 1.18 times 10^6 "m"^2/"s"^2$, giving a classical fractional frequency modulation $Delta Phi/c^2 approx 1.31 times 10^(-11)$ at the orbital frequency $1.80 times 10^(-4) "Hz"$.
- *Signal*: the extra-dimension channel superimposes $Delta E = m_"Th" alpha Delta Phi approx 2.8 alpha "eV"$. At $10^(-18)$ fractional stability the energy resolution is about $8 times 10^(-18) "eV"$, reaching $alpha$ down to $3 times 10^(-18)$, ten orders beyond current orbital bounds.
- *Verdict criteria*: a residual modulation at the orbital frequency inconsistent with the classical-redshift model and consistent with the Yukawa phase opens the window; a null result pins $alpha < 10^(-17)$ and closes it at nuclear-clock precision.

The physics content is entirely established (Eq. @eq-ab plus orbital mechanics); the novelty is the executable experimental specification. The bottleneck is systematic modeling of the classical background, not sensitivity.

= Exit three: the coherent-source hypothesis (candidate principle)

== Statement

*Coherent-Source Hypothesis (CSH).* Gravity couples to the quantum state of matter, not to its expectation value. For a source mass in a spatial superposition $|psi angle = c_L|L angle + c_R|R angle$, the gravitational response is determined by the branch amplitudes individually, and the superposed source carries a superposed metric $Sigma_i c_i |g_i angle$; the classical metric emerges as an effective description only after decoherence.

The physical basis of the hypothesis is established: Fedida and Kent proved that Møller-Rosenfeld semiclassical gravity (sourced by $angle hat(T)_("μν") angle$) violates the weak mixture equivalence principle and is not the semiclassical limit of quantum gravity; Williams independently showed the expectation-value source to be post-Newtonianly inconsistent. The negative half, *the source is not the expectation value*, is forced by established results. The positive half, *the source is the state itself*, is the conjecture of this paper (Section 8).

== Quantitative derivation: the gravitational phase as the lever

Two masses $m$ separated by $d$, each in a spatial superposition of splitting $Delta x$. The Newtonian potentials of the four branches are $-G m^2/d$, $-G m^2/(d+Delta x)$, $-G m^2/(d-Delta x)$, $-G m^2/d$. The relative phase is, exactly,

$ phi = (G m^2 t)/(ℏ) (1/(d+Delta x) + 1/(d-Delta x) - 2/d). $ <eq-lever>

This phase is the quantitative form of the gravitational lever: a purely gravitational quantity, controlled by the geometric configuration of two superposed masses, introducing no new field and no new coupling. Controlling $phi$ is controlling the relative phase of the superposed metric, the only channel outside the theorem that violates none of (A1)-(A3). Its magnitude:

- Benchmark ($m = 10^(-14) "kg"$, $Delta x = 250 μ"m"$, $d = 450 μ"m"$, $t = 2.5 "s"$): $phi = 0.217 "rad"$, with negativity $N approx 0.078$ and CHSH violation 0.024 (numerically simulated).
- Laboratory-realistic parameters ($m = 10^(-15) "kg"$, $Delta x = 10 μ"m"$): $phi = 10^(-6) ~ 10^(-5) "rad"$.
- Energy cost: zero. The lever consumes no energy; it consumes *coherence*. Preparation cost is set by the apparatus-recoil bound (a free-floating 1 kg apparatus at 1 K caps the superposition of a $10^9$-atomic-mass-unit particle near 100 μm); certification cost is $10^9 ~ 10^21$ runs (3σ).

The decisive reading: *this lever is not a repulsive force*. It produces no anti-gravity acceleration; it produces a coherent control channel on the phase of the superposed metric. For the traditional meaning of anti-gravity (an upward force), exit three gives a negative answer. For this paper's meaning (control over gravitational degrees of freedom), it is the only surviving, zero-energy-cost channel.

== Compatibility check with existing constraints

- *Fifth force*: CSH introduces no new field; the Yukawa bounds of Section 2 do not apply.
- *MICROSCOPE / Eöt-Wash*: the classical limit of CSH (after decoherence) reduces to Newtonian gravity exactly; the weak equivalence principle is untouched.
- *Apparatus recoil*: preparation cost satisfies the Céleri bound (included above).
- *Schwinger check* (the discipline of Section 1 of the companion paper): the concept of "required field strength" does not apply; the cost is coherence and statistics, not energy density. The lever sidesteps the "near-Schwinger means useless" trap, at the price of a different bill: $10^9 ~ 10^21$ runs.

= Falsifiable predictions

- *P1 (direct)*: the QGEM protocol observes the entanglement phase of Eq. @eq-lever, with sign and magnitude matching the quantum-source model. Target: models where gravity couples to the state rather than the expectation value; excluded: all LOCC local classical channels (the exclusion logic is numerically implemented in the companion simulations). Timescale: 5-10 years.
- *P2 (indirect, nearer)*: single-mass matter-wave interferometry verifies the gravitational Schrödinger evolution with an external mass; under two reasonable assumptions Plávala's theorem guarantees this implies two-body GIE. Existing interferometers suffice. Timescale: 3-5 years.
- *P3 (structural)*: post-Newtonian GIE (frame dragging) observes the gravitomagnetic phase, about seven orders below current readout. Timescale: 10 years+.
- *P4 (window, exit two)*: the orbital nuclear-clock experiment of Section 4 pins or opens the neV window at $10^(-18)$ level.

Together the four predictions form the complete verdict package: P1-P3 adjudicate exit three, P4 adjudicates exit two. All obey the decision-matrix discipline: observation, target, timescale.

= Row 20 of the decision matrix, and the constraint panorama

#figure(
  table(
    columns: (0.5fr, 2.4fr, 1.4fr, 1.6fr, 2.2fr),
    align: (left, left, left, left, left),
    [*Row*], [*Proposition*], [*Grade*], [*Discriminating experiment*], [*Target excluded*],
    [20], [Coherent-source hypothesis: the superposed-source phase is the only control channel outside the theorem], [B (forced by negative results; self-consistent; indirect evidence)], [P1 QGEM first round; P2 single-mass matter waves], [Remaining hybrid models with expectation-value coupling],
    [20b], [Geometrical unification neV window (exit two)], [C (open window; experiment specified)], [P4 orbital nuclear-clock modulation], [Yukawa models with $alpha > 10^(-17)$],
  ),
  caption: [Table 1: Two new rows. Row 20 is the candidate principle of this paper; row 20b is the executable specification of exit two.]
)

The decision matrix now stands at twenty-one rows, every row carrying the four elements: grade, experiment, target, timescale.

= Limitations and layering

The paper strictly separates three classes of content:

- *Class 1 (established physics)*: Eq. @eq-schwinger and the fifth-force bounds (Section 2); the theorem and its boundary (Section 2.2); the status of quantum inequalities and their contestation (Section 3); the nuclear-clock hardware and Eq. @eq-ab (Section 4); the negative results of Fedida-Kent and Williams (Section 5.1); the Céleri apparatus-recoil bound.
- *Class 2 (derivations of this paper)*: the exact phase and magnitudes of Eq. @eq-lever; the three-model exclusion logic; the compatibility checks (Section 5.3); the verdict specifications P1-P4.
- *Class 3 (conjecture)*: the positive half of CSH ("the source is the state itself") and its engineering reading ("the superposed-metric phase is a control channel"). This part has no evidence independent of P1-P3, and this paper does not package it as established fact.

Two traps are explicitly avoided. First, the algebraic equivalence of the double copy does not imply physical conversion of fields; CSH appeals to no electromagnetic-gravitational mapping. Second, "general relativity has a loophole, so ordinary matter suffices" is false; CSH produces no repulsive curvature, its lever is a phase channel rather than a force channel, and the paper explicitly acknowledges that the traditional meaning of anti-gravity (a repulsive force) receives a negative answer in all three exits.

= Conclusion

After exclusion, the picture is this. Transformational unification with classical sources is closed in principle. The fifth-force parameter space is pinned. Macroscopic negative energy is excluded, reopenable only by first falsifying the quantum inequalities. Geometrical unification is confined to a neV window, and this paper supplies the experiment that pins or opens it. On the quantum-emergent-gravity front, the coherent-source hypothesis proposes the gravitational phase as the lever, the only zero-energy-cost channel outside the theorem, with quantified magnitude and scheduled discriminating experiments.

Answering the two meanings of "anti-gravity" separately: as a *repulsive force*, the answer is negative; none of the three exits yields a positive result. As *control over gravitational degrees of freedom*, the answer converges: the lever exists, its magnitude is known, and its adjudication is scheduled. The honesty of this answer lies in what it does to the question: it converts "is anti-gravity possible" from a folklore question into an experimental question with a timescale, and the experiments are already being scheduled.

#pagebreak()

#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. MuningAn. Three Unifications: A Falsifiable Map of the Quantum-Gravity Frontier (2026). Repository github.com/everest-an/Antigravity.
2. Fedida, S. & Kent, A. *Phys. Rev. D* 111, 126016 (2025).
3. Williams, H. Post-Newtonian constraints on semiclassical gravity. arXiv:2512.18617 (2025).
4. Bose, S. et al. *Phys. Rev. Lett.* 119, 240401 (2017).
5. Marchese, M. M. et al. *Phys. Rev. A* 111, 042202 (2025).
6. Plávala, M. *Phys. Rev. D* 113, 085004 (2026).
7. Céleri, L. C. et al. The apparatus strikes back. arXiv:2607.08819 (2026).
8. Maclay, G. J. & Davis, E. W. *Found. Phys.* 49, 797 (2019).
9. Ford, L. H. & Roman, T. A. *Phys. Rev. D* 87, 085001 (2013).
10. Derevianko, A. et al. Colloquium: Nuclear clocks. arXiv:2606.11048 (2026).
11. Hiraki, T. et al. *Nat. Commun.* 15, 5536 (2024).
12. Morgan, H. W. T. et al. arXiv:2503.11374 (2025).
13. Chiao, R. Y. et al. *Phys. Rev. D* 109, 064073 (2024).
14. Jusufi, K. et al. *J. Cosmol. Astropart. Phys.* (2025).
15. Bobrick, A. & Martire, G. *Class. Quantum Grav.* 38, 105009 (2021).
16. Barzegar, H. et al. arXiv:2602.16495 (2026).
17. Panda, C. D. et al. *Nature* 631, 515 (2024).
18. Salzger, M. & Vilasini, V. arXiv:2605.08351 (2026).

#v(0.6em)
*Author contributions*　MuningAn proposed the coherent-source hypothesis, performed all computations, and wrote the manuscript.
#v(0.3em)
*Competing interests*　The author declares no competing interests.
#v(0.3em)
*Data availability*　All computations and simulations are available at github.com/everest-an/Antigravity.
