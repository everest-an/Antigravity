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
  #text(size: 12pt)[A dual-configuration experimental design (laboratory + orbital) · Route B: verify first, engineer later]
  #v(0.4em)
  #text(size: 11pt)[MuningAn · PlanetarySystem · 2026-08 · Version 2.0 (corrected dual-configuration edition)]
]

#par(justify: true)[
*Abstract*　This design uses the Th-229 nuclear clock to test whether gravity possesses controllable additional degrees of freedom, strictly framed as "searching for the Yukawa correction of compact extra dimensions"—never as "measuring anti-gravity". Two configurations are specified. *Laboratory*: a 100 kg movable tungsten source gives a signal coefficient of $9.5 times 10^(-14) alpha "eV"$ ($Delta f = 23 alpha "Hz"$)—thirteen orders below the orbital coefficient, yet at the projected spinless-host stability ($4.6 times 10^(-23)/sqrt(tau)$) it reaches $alpha_"min" approx 7 times 10^(-12)$ at $tau = 10^6 "s"$ ($lambda ~ 10^7 "m"$), five to six orders deeper than Eöt-Wash at laboratory scales. The survival window is $alpha in [10^(-12), 10^(-6)]$ (the lower segment being the newly covered region; $[10^(-6), 10^(-5)]$ is already excluded by Eöt-Wash). *Orbital*: the Earth as source gives $2.8 alpha "eV"$, reaching $alpha_"min" ~ 10^(-25)$ at the same projected stability ($tau = 10^6 "s"$), subject to a flight opportunity. The two-phase flow: Phase 1 establishes the first laboratory-mass nuclear-clock gravitational-redshift measurement and the full error budget; Phase 2 fits the Yukawa residual. A signal is accepted only under three conditions (systematics excluded; parameters inside the unexcluded window; linear scaling with source mass). An advanced phase applies microwave control of the nuclear internal state to test whether the coupling is state-dependent—the prerequisite principle test on the road to gravitational engineering. A null result carries independent constraint value; the noise budget, publication paths, and limitations are stated explicitly.

*Version note*: v1.0 misapplied the orbital coefficient ($2.8 alpha "eV"$) to a laboratory source, overestimating the laboratory signal by about seven orders of magnitude; all laboratory numbers are corrected in v2.0.

*Keywords*　Th-229; nuclear clock; Kaluza-Klein; fifth force; gravitational Aharonov-Bohm; precision metrology
]

#pagebreak()

= Scientific positioning and expression discipline

*Main goal*: use the extreme frequency stability of the Th-229 nuclear clock to measure the nuclear-transition frequency shift induced by gravitational-potential variations, searching for the Yukawa-type gravitational correction from the lightest Kaluza-Klein mode.

*Secondary goals*: (1) update the experimental constraint on the coupling $alpha$-range $lambda$ parameter plane; (2) test whether the gravitational coupling can be modulated by internal quantum degrees of freedom of the nucleus (a prerequisite for gravitational engineering).

*Expression discipline (mandatory in papers and group communication)*: this experiment does not directly demonstrate anti-gravity. A nonzero, modulable $alpha$ would mean that gravity possesses new degrees of freedom accessible to engineering, providing the physical basis for later manipulation research. Always say "tests of additional gravitational degrees of freedom", never "anti-gravity device".

= Physics and window position

== Signal form

The lightest graviton mode of an extra compact dimension contributes a Yukawa correction

$ V(r) = - (G m_1 m_2)/(r) (1 + alpha e^(-r/lambda)), $ <eq-kk>

with $alpha$ the coupling relative to standard gravity and $lambda$ the Compton range. A nuclear system in the field of a source mass acquires a splitting

$ Delta E = m_"sys" alpha Delta Phi(r, lambda), $ <eq-ab>

where $Delta Phi$ is the gravitational-potential variation produced by moving the source, and $m_"sys" approx 3.8 times 10^(-25) "kg"$ is the effective thorium-nucleus mass.

== The v1.0 $arrow.r$ v2.0 correction

The numerical value of $Delta Phi$ in Eq. @eq-ab depends on the source. *Key correction relative to v1.0*: the earlier version applied the orbital figure ($Delta Phi approx 1.18 times 10^6 "m"^2/"s"^2$, Earth as source) to a laboratory source. A 100 kg tungsten block moved from $r_1 = 0.15 "m"$ to $r_2 = 1.5 "m"$ actually produces

$ Delta Phi = G M (1/r_1 - 1/r_2) approx 4.0 times 10^(-8) "m"^2/"s"^2, $ <eq-labphi>

so the laboratory signal coefficient is

$ (Delta E)/(alpha) = m_"Th" Delta Phi approx 9.5 times 10^(-14) "eV", quad (Delta f)/(alpha) = (Delta E)/(h alpha) approx 23 "Hz". $ <eq-labsig>

The v1.0 claim "a $Delta E in [0.1, 10] "neV"$ laboratory signal" would have required $alpha = 330 ~ 3.3 times 10^4$, excluded by Eöt-Wash at laboratory scales by seven to nine orders of magnitude—landing exactly in the already-excluded parameter region that the expression discipline forbids. All laboratory numbers in v2.0 follow Eqs. @eq-labphi and @eq-labsig.

== Laboratory configuration

$ Delta E(alpha) = 9.5 times 10^(-14) alpha "eV"$, equivalently $Delta f = 23 alpha "Hz"$.

- *Newly covered region*: $alpha in [10^(-12), 10^(-6)]$—below $10^(-6)$ is uncovered by Eöt-Wash; this is the experiment's true target.
- *Excluded region*: $alpha > 10^(-6)$ (Eöt-Wash at $lambda ~ 10^(-2) ~ 10^(-1) "m"$).
- *Sensitivity*: at the projected stability $4.6 times 10^(-23)/sqrt(tau)$: $alpha_"min" approx 7 times 10^(-11)$ at $tau = 10^4 "s"$, and $approx 7 times 10^(-12)$ at $tau = 10^6 "s"$ (both at $lambda ~ 10^7 "m"$).
- *Frequency scale*: the corresponding shifts are $Delta f in [10^(-10), 10^(-5)] "Hz"$—sub-nanohertz to microhertz, all below the resolution of the current kHz-linewidth platforms. *The experiment is feasible only after a spinless host reaches the projected stability.*

== Orbital configuration (retained from v1.0)

With the Earth as source (low Earth orbit, altitude 400 km, $e = 0.01$), $Delta Phi approx 2 g a e approx 1.18 times 10^6 "m"^2/"s"^2$, hence

$ Delta E approx 2.8 alpha "eV", $ <eq-signal>

with the classical fractional baseline modulation

$ (Delta nu)/(nu) = (Delta Phi)/(c^2) approx 1.31 times 10^(-11) $ <eq-baseline>

at the orbital frequency $f_"orb" approx 1.80 times 10^(-4) "Hz"$. Inverting Eq. @eq-ab against history: eV-scale splittings would require $alpha approx 0.4$ (excluded by 7-8 orders); meV-scale requires $alpha approx 10^(-3)$ (equally excluded). The allowed orbital window sits at neV and below: the current orbital bound $alpha ~ 10^(-15)$ corresponds to $Delta E ~ 3 "feV"$, inside the projected clock reach. The orbital configuration is thirteen orders deeper than the laboratory one (signal coefficients $2.8 "eV"$ vs $9.5 times 10^(-14) "eV"$ per $alpha$), but requires a flight opportunity.

= Experimental design: two phases plus an advanced stage

== Phase 1: baseline calibration (mandatory, laboratory)

1. Move the tungsten block far away ($r > 2 "m"$) and record the reference frequency $f_0$.
2. Move the block through a set of fixed distances $r_i$, measure $Delta f(r_i)$, and compare with the general-relativistic prediction $Delta f_"GR" = f_0 Delta Phi(r_i)/c^2$.
3. Fit and remove thermal drift, light shift, Stark shift, and magnetic-field drift; build the complete error budget.

*Quantitative content of Phase 1*: the classical redshift of the laboratory source is $Delta Phi/c^2 approx 4.4 times 10^(-25)$ (full $0.15 ~ 1.5 "m"$ scan). At the projected stability this gives SNR $approx 1$ at $tau = 10^4 "s"$ and $approx 10$ at $tau = 10^6 "s"$—*the first nuclear-clock measurement of a laboratory-mass gravitational redshift* (Panda et al. measured the force version with atom interferometry; this is the frequency version), independently publishable. If the host crystal does not reach the projected stability, Phase 1 cannot run and the design as a whole is deferred.

== Phase 2: Yukawa-deviation search

1. Scan $r in [0.15, 1.5] "m"$ (emphasis on the near range $0.15 ~ 0.3 "m"$ for the Yukawa shape), measuring $Delta f_"obs"(r_i)$.
2. Residuals: $delta f(r_i) = Delta f_"obs"(r_i) - Delta f_"GR"(r_i)$.
3. Fit the residuals to $delta f(r) = 23 alpha e^(-r/lambda) "Hz"$ (including the $lambda$-dependent shape factor) and extract $alpha, lambda$.

== Orbital phases (retained from v1.0)

- *Orbital Phase 1*: place the clock in a known potential difference (ground: 1 m height, $g Delta h/c^2 approx 1.09 times 10^(-16)$; orbit: the full modulation of Eq. @eq-baseline) and reproduce the general-relativistic prediction. The orbital baseline is four orders less demanding than the ground/laboratory baseline and can serve early systematics commissioning.
- *Orbital Phase 2*: on orbit, fit $A_"tot" = A_"GR" + A_"KK"$ at the orbital frequency; the residual is $A_"KK" = 2.8 alpha "eV"$.

== Advanced stage: active-control demonstration

- *Operation*: apply microwave/magnetic fields to control the nuclear spin/isomer internal state and observe whether the fitted coupling varies with the control parameters.
- *Theoretical positioning (mandatory)*: in standard Kaluza-Klein the coupling $alpha$ is a constant, independent of the nuclear internal state; a measured state dependence would falsify not only general relativity but standard Kaluza-Klein, pointing to a new, state-dependent gravitational coupling channel. The correct statement of this stage is "search for state-dependent gravitational coupling", not "tuning $alpha$". This discipline is what separates the design from folk proposals.

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
    [Projected stability], [$4.6 times 10^(-23)/sqrt(tau)$ (Th(SO#sub[4])#sub[2])], [theory, 2025],
    [Readout], [X-ray quenching, cycle speedup ≥50x], [Nat. Commun. 2024],
  ),
  caption: [Table 1: Th-229 nuclear clock instrument parameters.]
)

== Dual-configuration parameters (Table 2)

#figure(
  table(
    columns: (1.4fr, 1.8fr, 1.8fr),
    align: (left, left, left),
    [*Parameter*], [*Laboratory*], [*Orbital*],
    [Source], [100 kg tungsten, $r in [0.15, 1.5]$ m], [Earth, LEO 400 km, $e = 0.01$],
    [$Delta Phi$], [$4.0 times 10^(-8)$ m²/s²], [$1.18 times 10^6$ m²/s²],
    [Signal coefficient], [$9.5 times 10^(-14) alpha$ eV ($23 alpha$ Hz)], [$2.8 alpha$ eV],
    [Classical baseline], [$4.4 times 10^(-25)$], [$1.31 times 10^(-11)$],
    [$alpha_"min"$ (projected, $tau = 10^6$ s, $lambda ~ 10^7$ m)], [$approx 7 times 10^(-12)$], [$approx 2.7 times 10^(-25)$],
    [Constraint improvement over existing], [5-6 orders (Eöt-Wash)], [~14 orders (LLR/MICROSCOPE)],
  ),
  caption: [Table 2: Dual configuration comparison. All $alpha_"min"$ values use the projected stability $4.6 times 10^(-23)/sqrt(tau)$. The orbital coefficient is $2.9 times 10^13$ times larger than the laboratory one.]
)

== Reachability versus existing bounds (Table 3)

#figure(
  table(
    columns: (1.2fr, 1.6fr, 1.6fr, 1.6fr),
    align: (left, left, left, left),
    [*Range $lambda$*], [*Lab $alpha_"min"$ ($tau = 10^6$ s)*], [*Orbital $alpha_"min"$ ($tau = 10^6$ s)*], [*Existing bound (universal channel)*],
    [$10^6$ m], [$3.5 times 10^(-9)$], [$1.2 times 10^(-22)$], [$~10^(-9)$ (ranging)],
    [$10^7$ m], [$8.0 times 10^(-12)$], [$2.7 times 10^(-25)$], [$~10^(-9)$],
    [$10^8$ m], [$4.3 times 10^(-12)$], [$1.5 times 10^(-25)$], [$~3 times 10^(-11)$ (LLR)],
    [$10^9$ m], [$4.1 times 10^(-12)$], [$1.4 times 10^(-25)$], [$~10^(-11)$],
  ),
  caption: [Table 3: Reachability with the projected stability ($delta E = 8.36 "eV" times 4.6 times 10^(-26)$ at $tau = 10^6$ s, 1σ convention; the 5σ convention multiplies by $5 sqrt(2) approx 7.07$). The laboratory configuration deepens existing bounds by 1-2 orders in the $lambda in [10^7, 10^10] "m"$ window; the orbital configuration by ~14 orders.]
)

= Systematic-error budget

*Laboratory noise budget*:

1. *Intrinsic instability*: $4.6 times 10^(-23)/sqrt(tau)$; $approx 4.6 times 10^(-25)$ at $tau = 10^4$ s, $approx 4.6 times 10^(-26)$ at $tau = 10^6$ s.
2. *Static magnetic field*: residual $< 1 "nT"$; spinless host removes first-order Zeeman.
3. *Crystal thermal gradient*: temperature stability better than $1 "mK"$.
4. *Source vibration*: vibration-isolated platform; translation-stage positioning better than $0.1 "mm"$ (corresponding to $delta Phi/Phi ~ 10^(-3)$, modeled as a systematic in the fit).
5. *Static electric field*: grounded shield shell, eliminating Stark shifts.
6. *X-ray quenching cycle*: duty-cycle effects require cycle phase locking.

*Orbital budget (retained from v1.0)*:

#figure(
  table(
    columns: (1.5fr, 1.3fr, 2.6fr, 1.6fr),
    align: (left, left, left, left),
    [*Source*], [*Scale (present)*], [*Control*], [*Target*],
    [Orbit determination], [cm-level $arrow.r$ $delta Phi/c^2 ~ 10^(-15)$], [SLR/GNSS precise orbit determination + reprocessing], [mm-level $arrow.r$ $10^(-16)$],
    [Gravity-field model], [J2+ multipoles $~10^(-10)$], [high-order multipoles + time-variable models], [$10^(-18)$ residuals],
    [Tides / atmosphere], [time-variable, $~10^(-12)$], [common-mode subtraction + dual clocks], [≤ $10^(-17)$],
    [Crystal-field quadrupole], [kHz-scale (current dominant)], [spinless host + quadrupole suppression], [mHz-scale],
    [Temperature drift], [parametric (to be calibrated)], [mK temperature control + in-situ calibration], [group-calibrated],
    [Zeeman], [first-order sensitive], [magic-angle / spinless host], [first-order eliminated],
    [X-ray quenching cycle], [duty-cycle effects], [cycle phase locking], [≤ $10^(-18)$],
    [Space-ground link], [$~10^(-16)$], [frequency-comb / two-way microwave link], [$10^(-18)$],
  ),
  caption: [Table 4: Orbital systematic-error budget. Entries marked "parametric" require calibration by the host group.]
)

Reading: in both configurations the main systematic battlefield is not sensitivity but *the exact modeling of the classical baseline*. In the laboratory configuration the Yukawa shape is spectrally separated (near-range $0.15 ~ 0.3 "m"$ scan); in the orbital configuration the Phase-2 signal shares the orbital frequency with the classical modulation and must be separated by modeling precision—which is why Phase 1 exists.

= Verdict formulas

- *Null verdict (most likely)*: residuals consistent with zero. Product: a new exclusion boundary on the $alpha(lambda)$ plane ($alpha < 7 times 10^(-12)$ at $tau = 10^6$ s, $lambda ~ 10^7$ m), pushing the Eöt-Wash boundary down by 5-6 orders of magnitude. A null result is a high-quality result in itself.
- *Signal verdict*: residuals significantly nonzero with exponential decay $prop e^(-r/lambda)$. Three conditions must hold simultaneously: condition A (all known systematics excluded); condition B (fit parameters inside the unexcluded window $alpha in [10^(-12), 10^(-6)]$); condition C (signal scales linearly with the source mass $M$). All three together constitute a candidate evidence.
- *State-dependence verdict (advanced, core innovation)*: with source, distance, and mass held fixed, microwave pulses change the nuclear internal state; test whether the fitted $alpha$ changes reproducibly. A reproducible change proves the gravitational coupling can be modulated by internal quantum degrees of freedom—the precursor evidence that the engineering window opens. *Note*: even an observed tunable $alpha$ does not constitute an anti-gravity prototype; it only proves the existence of a controllable channel. Standard KK has constant $alpha$; state dependence, if measured, falsifies GR and standard KK simultaneously, pointing to a new state-dependent coupling channel.

= Milestones

#figure(
  table(
    columns: (0.9fr, 2.2fr, 1.6fr, 1.8fr),
    align: (left, left, left, left),
    [*Milestone*], [*Content*], [*Prerequisite*], [*Output*],
    [M1], [Parameter space, reachability, error budget (this document)], [none], [theory paper (submittable now)],
    [M2], [Laboratory-mass nuclear-clock redshift (Phase 1, $4.4 times 10^(-25)$)], [spinless host at projected stability], [GR test + error budget],
    [M3], [Yukawa residual search (Phase 2) + orbital baseline/KK search], [M2 + (for orbital) flight opportunity], [$alpha < 7 times 10^(-12)$ or a signal],
    [M4], [Active-control demonstration], [M3 positive signal], [state-dependence verdict],
  ),
  caption: [Table 5: Milestones. M1 is achievable now; M2-M4 depend on host-material and flight-opportunity progress.]
)

= Collaboration interface

- *Theory collaborator provides*: signal predictions (Eqs. 1-6), the dual-configuration reachability tables (Tables 2-3), the error budgets, the verdict formulas, and the executable package (reachability scan, signal simulator, MICROSCOPE comparison; scripts 14/15/16 in the companion repository; user manual in `docs/`).
- *Host group provides*: the clock platform, in-situ calibration of environmental shifts, and a laboratory or orbital potential-difference platform.
- *Candidate groups*: Huazhong University of Science and Technology gravity center, University of Science and Technology of China precision-measurement institutes, SIOM, and the European Th-229 clock groups (contact plan in `docs/实验组对接清单.md`).
- *Cost model*: the theory collaborator carries zero hardware cost; the laboratory baseline can run on existing clock platforms.
- *Script convention note*: repository scripts give 1σ values ($alpha_"min" approx 4.0 times 10^(-12)$ laboratory, $1.4 times 10^(-25)$ orbital, both at $tau = 10^6$ s, $lambda arrow.r infinity$); the 5σ convention multiplies by $5 sqrt(2) approx 7.07$. Table 3 quotes the $lambda$-dependent 1σ values.

= Compatibility with existing constraints

Every parameter of this design lies in the unexcluded window. The laboratory target ($alpha in [10^(-12), 10^(-6)]$, $lambda ~ 10^(-2) ~ 10 "m"$) sits below the Eöt-Wash exclusion ($alpha > 10^(-6)$); the orbital target ($lambda > 10^6 "m"$) sits in the open region below the MICROSCOPE composition-channel and LLR universal-channel bounds. The KK graviton couples universally to $T_("μν")$ and therefore preserves the equivalence principle: EP experiments are structurally blind to it, which is precisely why the clock measurement (a universal-channel test) provides independent new sensitivity (see script 15 for the channel decomposition). The design introduces no new interaction hypothesis (standard KK is an existing framework) and exactly one conjecture, explicitly labeled: the state-dependent coupling of Section 5.4 is a *hypothesis to be tested*, not a premise of the design.

= Limitations (mandatory for review defense)

1. This experiment tests only *a specific class of KK models (lightest-mode Yukawa correction)*; it cannot exclude all higher-dimensional theories.
2. Even an observed tunable $alpha$ remains far from macroscopic gravitational manipulation; this experiment performs only a principle-level feasibility test.
3. This experiment does not cover emergent-gravity or quantum-superposition-source models; those require GIE entanglement experiments (see appendix).
4. All sensitivity numbers depend on the *projected* stability of the spinless host. If actual performance falls short, $alpha_"min"$ degrades proportionally to $4.6 times 10^(-23)/sqrt(tau)$; the paper must present "projected vs measured" side-by-side.

= Conclusion

This design answers the highest-value question at the lowest cost: *does spacetime possess controllable additional degrees of freedom?* The dual configuration guarantees an independent output at every step: Phase 1 alone is the first laboratory-mass nuclear-clock gravitational-redshift test; the null result of the deviation search is a 5-6-order constraint improvement on the $alpha(lambda)$ plane; the orbital configuration, given a flight opportunity, reaches $10^(-25)$; a positive signal opens the first door to gravitational engineering. The academic safety of the design rests on three pillars: goal-statement discipline (test properties, claim no engineering), null-result value (a constraint is a result), and parameter compliance (everything inside the unexcluded window).

= Appendix: GIE backup experiment (Route B fallback)

If nuclear-clock collaboration proves too costly, the GIE design is prepared in parallel:

- *Target*: gravity-mediated entanglement (adjudication-matrix rows 6-7).
- *Observables*: negativity $N$, CHSH violation; the three-model discrimination simulation is complete (quantum model $N approx 0.078$; mean-field/LOCC strictly zero).
- *Unique upgrade*: add internal-state control to test whether the entanglement coupling is modulated by the quantum state.
- *Difficulty*: nanogram-scale spatial superpositions; the hardest noise environment; no final measurement worldwide yet.
- *Ready assets*: continuous-variable verification (qubit-abstraction fidelity $~e^(-2 alpha^2)$) and the N(3σ) cost estimate are both in the repository, usable directly as collaboration-proposal attachments.

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
11. Kapner, D. J. et al. *Phys. Rev. Lett.* 98, 021101 (2007) (Eöt-Wash).
