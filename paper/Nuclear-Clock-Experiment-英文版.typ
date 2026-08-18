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
  #text(size: 16pt, weight: "bold")[Testing Additional Gravitational Degrees of Freedom with the Th-229 Nuclear Clock]
  #v(0.4em)
  #text(size: 12pt)[An experimental design (Route B: verify first, engineer later)]
  #v(0.4em)
  #text(size: 11pt)[MuningAn · PlanetarySystem · 2026-08 · Version 1.0 (for experimental collaborations)]
]

#par(justify: true)[
*Abstract*　The goal of this design is not an "anti-gravity prototype" but a test of whether gravity possesses controllable additional degrees of freedom. The Th-229 nuclear clock is the core instrument, measuring the gravitational modulation of the isomer transition frequency on an elliptical orbit. Classical general relativity fixes the baseline (a fractional modulation of $1.3 times 10^(-11)$); a Kaluza-Klein extra dimension superimposes $Delta E approx 2.8 alpha "eV"$, where $alpha$ is the coupling of the lightest extra mode. At the target fractional stability of $10^(-18)$, the experiment reaches $alpha$ down to $3 times 10^(-18)$ for ranges $lambda > 10^7 "m"$, about three orders beyond current orbital bounds. The design proceeds in two phases: Phase 1 establishes the classical baseline and eliminates systematics; Phase 2 searches for the deviation and pins or opens the window. An advanced phase actively controls the nuclear spin state to test whether the coupling is state-dependent. This document provides the parameter tables, expected signal magnitudes, systematic-error budget, and verdict formulas. A null result carries publication value by itself: $alpha < 10^(-17)$ is a PRL-grade constraint.

*Keywords*　Th-229; nuclear clock; Kaluza-Klein; gravitational Aharonov-Bohm; equivalence principle; precision metrology
]

#pagebreak()

= Scientific positioning and goals

*Positioning*: this experiment belongs to the established frontier of "testing the fundamental properties of gravity and exploring their controllability"; it is not the development of an "anti-gravity device". Expression discipline: in review and defense settings, use "tests of additional gravitational degrees of freedom", never "anti-gravity" as the experimental goal.

*Goals, layered*:

- *Goal 1 (mandatory)*: the first nuclear-transition measurement of the gravitational redshift / gravitational Aharonov-Bohm effect, establishing the classical baseline.
- *Goal 2 (mandatory)*: a constraint or a signal on $alpha$ in the neV window, pinning or opening the Kaluza-Klein parameter space.
- *Goal 3 (optional, advanced)*: active control of the nuclear spin state, testing whether the gravitational coupling is state-dependent. A positive result would simultaneously falsify general relativity and standard Kaluza-Klein, pointing to a new coupling channel.

*Null-result value*: a null result for Goal 2 yields $alpha < 10^(-17)$-level constraints, two orders beyond current orbital bounds, independently publishable at PRL / Nature Physics level.

= Physics and window position

== Signal form

The lightest graviton mode of an extra compact dimension contributes a Yukawa correction

$ V(r) = - (G m_1 m_2)/(r) (1 + alpha e^(-r/lambda)), $ <eq-kk>

with $alpha$ the coupling relative to standard gravity and $lambda$ the Compton range. A quantum system in free fall around a gravitating body acquires a splitting

$ Delta E = m_"sys" alpha Delta Phi(r, lambda), $ <eq-ab>

with $Delta Phi$ the peak-to-peak potential variation. For the thorium nucleus ($m_"Th" approx 3.8 times 10^(-25) "kg"$) on a low Earth orbit (altitude 400 km, eccentricity 0.01), $Delta Phi approx 2 g a e approx 1.18 times 10^6 "m"^2/"s"^2$ (classical part), hence

$ Delta E approx 2.8 alpha "eV". $ <eq-signal>

== Window position

Inverting Eq. @eq-ab against history: electronvolt splittings for nuclear systems require $alpha approx 0.4$, excluded by seven to eight orders of magnitude; millielectronvolt splittings require $alpha approx 10^(-3)$, equally excluded. The allowed window therefore sits at neV and below. Eq. @eq-signal shows that the current orbital bound $alpha ~ 10^(-15)$ corresponds to $Delta E ~ 3 "feV"$, precisely inside the reach of the target nuclear-clock sensitivity. That is the window position: *not "signal or no signal", but "who fills the three orders of magnitude between the existing bound and the clock sensitivity first"*.

== Classical baseline

The classical gravitational-redshift modulation is the peak-to-peak orbital potential variation:

$ (Delta nu)/(nu) = (Delta Phi)/(c^2) approx 1.31 times 10^(-11), $ <eq-baseline>

at the orbital frequency $f_"orb" approx 1.80 times 10^(-4) "Hz"$. Numerically this baseline equals the classical redshift variation (the reading of the gravitational Aharonov-Bohm effect); it serves three purposes: a systematics target, a general-relativity test with a nuclear clock, and the reference for Phase-2 signal subtraction.

= Experimental design: two phases plus an advanced stage

== Phase 1: classical baseline

- *Instrument*: solid-state Th-229 nuclear clock (148.18 nm direct excitation achieved; CaF₂ host with $447 plus.minus 25 "s"$ half-life; X-ray quenching readout accelerating cycles by ≥50x).
- *Operation*: place the clock in a known gravitational-potential difference (ground: 1 m height, $g Delta h/c^2 approx 1.09 times 10^(-16)$; orbit: the full modulation of Eq. @eq-baseline), and measure the isomer frequency shift, reproducing the general-relativistic prediction.
- *Verdict*: the ground baseline requires fractional stability better than $10^(-16)$ (the spinless-host route, Th(SO#sub[4])#sub[2], projects $4.6 times 10^(-23)/sqrt(tau)$); the orbital baseline is four orders less demanding and can serve early systematics commissioning.

== Phase 2: the Kaluza-Klein deviation search

- *Operation*: on orbit, fit the total modulation amplitude $A_"tot" = A_"GR" + A_"KK"$ at the orbital frequency, with $A_"GR"$ modeled exactly by Eq. @eq-baseline; the residual is $A_"KK" = 2.8 alpha "eV"$.
- *Null verdict*: $|A_"KK"| < 3 sigma_"clock"$ gives the constraint curve $alpha < alpha_"min"(lambda)$ (Table 3, Section 5).
- *Signal verdict*: a nonzero residual that is (i) neV-scale, (ii) phase-consistent with the Yukawa correction, and (iii) independent of the classical model (cross-checked across different altitudes or eccentricities).

== Advanced stage: active-control demonstration

- *Operation*: apply microwave/magnetic fields to control the nuclear spin polarization and observe whether the coupling varies with the control parameters.
- *Theoretical positioning (mandatory)*: in standard Kaluza-Klein the coupling $alpha$ is a constant and does *not* depend on the nuclear spin state; a measured state dependence would falsify not only general relativity but standard Kaluza-Klein, pointing to a new, state-dependent gravitational coupling channel. The correct statement of this stage is therefore "search for state-dependent gravitational coupling", not "tuning $alpha$". This discipline is what separates the design from folk proposals.

= Core parameter tables

== Instrument parameters (Table 1)

#figure(
  table(
    columns: (1.2fr, 2.2fr, 1.4fr),
    align: (left, left, left),
    [*Parameter*], [*Value*], [*Source/status*],
    [Transition energy], [8.355733554021(8) eV], [2024 precision measurement],
    [Wavelength / half-life], [148.18 $plus.minus$ 0.42 nm; $447 plus.minus 25$ s (CaF₂)], [Nat. Commun. 2024],
    [Solid-state lifetime], [641 s (CaF₂)], [2025 review],
    [Current linewidth], [kHz-scale (crystal broadening)], [present],
    [Target stability], [$4.6 times 10^(-23)/sqrt(tau)$ (Th(SO#sub[4])#sub[2])], [theory, 2025],
    [Readout], [X-ray quenching, cycle speedup ≥50x], [Nat. Commun. 2024],
  ),
  caption: [Table 1: Th-229 nuclear clock instrument parameters.]
)

== Platform parameters (Table 2)

#figure(
  table(
    columns: (1.2fr, 2.2fr, 1.4fr),
    align: (left, left, left),
    [*Parameter*], [*Value*], [*Note*],
    [Orbit], [400 km altitude, $e = 0.01$], [LEO, $a = 6771$ km],
    [Orbital frequency], [$1.80 times 10^(-4)$ Hz], [the modulation frequency],
    [Classical $Delta Phi$], [$1.18 times 10^6$ m²/s²], [peak-to-peak, $2 g a e$],
    [Classical $Delta nu/nu$], [$1.31 times 10^(-11)$], [Eq. (4)],
    [Nucleus mass], [$3.8 times 10^(-25)$ kg], [$m_"Th"$],
    [Signal coefficient], [$Delta E = 2.8 alpha$ eV], [Eq. (3)],
  ),
  caption: [Table 2: Orbital platform and signal coefficient.]
)

== Reachability (Table 3)

#figure(
  table(
    columns: (1.1fr, 1.6fr, 1.6fr, 1.6fr),
    align: (left, left, left, left),
    [*Range $lambda$*], [*Suppression $e^(-a/lambda)$*], [*$alpha_"min"$ ($10^(-18)$ target)*], [*Existing bound*],
    [$10^6$ m], [$1.1 times 10^(-3)$], [$2.7 times 10^(-15)$], [$~10^(-15)$ (MICROSCOPE)],
    [$3 times 10^6$ m], [$0.10$], [$2.9 times 10^(-17)$], [$~10^(-15)$],
    [$10^7$ m], [$0.51$], [$5.9 times 10^(-18)$], [$~10^(-15)$],
    [$10^9$ m], [$0.99$], [$3.0 times 10^(-18)$], [$~10^(-11)$ (LLR)],
  ),
  caption: [Table 3: Reachability versus existing bounds. $alpha_"min" = (delta E)/(m_"Th" Delta Phi) times e^(a/lambda)$, with $delta E = 8.36 "eV" times 10^(-18)$. The experiment deepens existing bounds by 2-8 orders of magnitude in the $lambda > 10^6 "m"$ window.]
)

= Systematic-error budget

#figure(
  table(
    columns: (1.5fr, 1.3fr, 2.6fr, 1.6fr),
    align: (left, left, left, left),
    [*Source*], [*Scale (present)*], [*Control*], [*Target*],
    [Orbit determination], [cm-level → $delta Phi/c^2 ~ 10^(-15)$], [SLR/GNSS precise orbit determination + reprocessing], [mm-level → $10^(-16)$],
    [Gravity-field model], [J2+ multipoles $~10^(-10)$], [high-order multipoles + time-variable models], [$10^(-18)$ residuals],
    [Tides / atmosphere], [time-variable, $~10^(-12)$], [common-mode subtraction + dual clocks], [≤ $10^(-17)$],
    [Crystal-field quadrupole], [kHz-scale (current dominant)], [spinless host + quadrupole suppression], [mHz-scale],
    [Temperature drift], [parametric (to be calibrated)], [mK temperature control + in-situ calibration], [group-calibrated],
    [Zeeman], [first-order sensitive], [magic-angle / spinless host], [first-order eliminated],
    [X-ray quenching cycle], [duty-cycle effects], [cycle phase locking], [≤ $10^(-18)$],
    [Space-ground link], [$~10^(-16)$], [frequency-comb / two-way microwave link], [$10^(-18)$],
  ),
  caption: [Table 4: Systematic-error budget. Entries marked "parametric" require calibration by the host group; the table gives control methods and target magnitudes, not promises.]
)

Reading: the main systematic battlefield is not sensitivity but *the exact modeling of the classical baseline*: the Phase-2 signal shares the orbital frequency with the classical modulation and must be separated by modeling precision, not by spectral discrimination. This is structurally identical to the gravitational Aharonov-Bohm interpretation, and it is the reason Phase 1 exists.

= Verdict formulas

- *Null verdict*: $|A_"KK"| < 3 sigma$ implies $alpha < alpha_"min"(lambda)$, with $alpha_"min"$ from Table 3; publication form is the constraint curve $alpha(lambda)$.
- *Signal verdict*: a nonzero residual satisfying (i) neV magnitude, (ii) Yukawa phase behavior, (iii) cross-validation across orbit configurations.
- *State-dependence verdict (advanced)*: coupling varying with nuclear spin polarization falsifies GR and standard KK and points to a new channel; invariance excludes state-dependent coupling down to the experimental sensitivity.

= Milestones

#figure(
  table(
    columns: (0.9fr, 2.2fr, 1.6fr, 1.8fr),
    align: (left, left, left, left),
    [*Milestone*], [*Content*], [*Prerequisite*], [*Output*],
    [M1], [Parameter space, reachability, error budget (this document)], [none], [theory paper (submittable now)],
    [M2], [Ground nuclear-clock redshift test (1 m, $1.09 times 10^(-16)$)], [spinless host at $10^(-16)$], [GR test + systematics commissioning],
    [M3], [Orbital baseline + KK search], [M2 + flight opportunity], [$alpha < 10^(-17)$ or a signal],
    [M4], [Active-control demonstration], [M3 positive signal], [state-dependence verdict],
  ),
  caption: [Table 5: Milestones. M1 is achievable now; M2-M4 depend on host-material and flight-opportunity progress.]
)

= Collaboration interface

- *Theory collaborator provides*: signal predictions (Eqs. 1-4), the reachability table (Table 3), the error budget (Table 4), the verdict formulas (Section 7), parameter-scan code, and the three-model discrimination simulations (all in the companion repository).
- *Host group provides*: the clock platform, in-situ calibration of environmental shifts, and an orbital or ground-based potential-difference platform.
- *Candidate groups*: Huazhong University of Science and Technology gravity center, University of Science and Technology of China precision-measurement institutes, SIOM, and the European Th-229 clock groups.
- *Cost model*: the theory collaborator carries zero hardware cost; the ground baseline can run on existing clock platforms.

= Compatibility with existing constraints

Every parameter of this design lies in the unexcluded window: the target region ($lambda > 10^6 "m"$, $alpha > 10^(-18)$) sits in the open region below the MICROSCOPE ($alpha ~ 10^(-15)$) and LLR bounds; the experiment introduces no new interaction hypothesis (standard KK is an existing framework); it conflicts with neither Eöt-Wash nor short-range fifth-force bounds. The design introduces exactly one conjecture, and it is explicitly labeled (Section 3.3: state-dependent coupling is a *hypothesis to be tested*, not a premise of the design).

= Conclusion

This design answers the highest-value question at the lowest cost: *does spacetime possess controllable additional degrees of freedom*? The two-phase structure guarantees an independent output at every step: the baseline alone is the first nuclear-clock gravitational redshift test; the null result of the deviation search is a two-order constraint improvement; a positive signal opens the first door to gravitational engineering. The academic safety of the design rests on three pillars: goal-statement discipline (test properties, claim no engineering), null-result value (a constraint is a result), and parameter compliance (everything inside the unexcluded window).

#pagebreak()

#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. MuningAn. Three Unifications: A Falsifiable Map of the Quantum-Gravity Frontier (2026).
2. MuningAn. Beyond Three Unifications: The Three Surviving Exits and a Falsifiable Candidate Principle (2026).
3. Derevianko, A., Elwell, R. & Hudson, E. R. Colloquium: Nuclear clocks. arXiv:2606.11048 (2026).
4. Hiraki, T. et al. *Nat. Commun.* 15, 5536 (2024).
5. Morgan, H. W. T. et al. arXiv:2503.11374 (2025).
6. Girvin, S. M. & Radzihovsky, L. arXiv:2511.13017 (2025).
7. Chiao, R. Y. et al. *Phys. Rev. D* 109, 064073 (2024).
8. Jusufi, K. et al. *J. Cosmol. Astropart. Phys.* (2025).
9. Panda, C. D. et al. *Nature* 631, 515 (2024).
10. Touboul, P. et al. *Phys. Rev. Lett.* 129, 121102 (2022) (MICROSCOPE).
