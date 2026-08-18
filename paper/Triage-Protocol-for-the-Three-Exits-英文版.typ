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
  #text(size: 16pt, weight: "bold")[Triage Protocol for the Three Exits: Testable Signatures of Strong Coupling, Non-Locality, and State Charge]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · Paper E6 (first version, protocol paper)]
]

#par(justify: false, first-line-indent: 0em)[
*Abstract*　The falsification clauses of the classification theorem (Paper T2) and the unified zero-background theorem (Paper E5) restrict the new physics behind an observed state-dependent signal to three exits: a strongly coupled sector (cutoff $Lambda <~ 43 "MeV"$), a non-local theory, and a state-charged gravitational sector. This paper gives the triage protocol that discriminates the three, with quantified thresholds. Step 1: shape fitting over an extended near-range scan ($0.02 ~ 0.5 "m"$)—the second scale of a double-exponential (ghost) spectrum carries shape information only at $r < lambda_2$; the standard scan (starting at $0.15 "m"$) is blind to a $lambda_2 = 0.05 "m"$, $beta = 0.1$ admixture ($Delta chi^2 approx 0$), while the extended scan gives $Delta chi^2 approx 10$ and a minimum detectable admixture $beta_"min" approx 0.10$. Step 2: multi-probe ratios ($8.36 "eV" / 76.7 "eV" / "keV" / "MeV"$ transitions)—the strong-coupling form factor $F(E) approx 1/(1+E/Lambda)$ makes the ratio deviate from the quadrupole scaling by $~E/Lambda$, a 2% effect for MeV probes. Step 3: an m-scan of spin projections—the selection rules of state charge produce non-overlapping patterns (constant / linear / quadratic). The three observables are mutually orthogonal; one experimental round completes all discriminations. The protocol includes a reverse self-check: if all three steps return to zero, the "signal" is a systematic error, not new physics. All numbers come from experiments/19 (synthetic data + fits + threshold scans); Fig. 9 gives the decision tree. This is a protocol paper: it does not predict that a signal will appear—it prescribes how to attribute one if it does.

*Keywords*　state-dependent coupling; triage protocol; strong coupling; non-locality; state charge; shape fitting; selection rules
]

#pagebreak()

= Introduction: After a Positive Signal

The classification theorem (T2) and the unified zero-background theorem (E5) prove that if any state-control experiment (nuclear-clock state-dependence search, GIE internal-state control, spin-resolved frame dragging) measures a state-dependent signal above readout sensitivity, then GR, standard KK, and every weakly coupled local EFT are simultaneously falsified, and the new physics belongs to one of three exits: *a strongly coupled sector, a non-local theory, or a state-charged gravitational sector*. This is an unprecedented adjudication position: the three exits are not rhetoric—they are logical conclusions.

But "one of three" is not enough—science needs to know *which one*. This paper provides the triage protocol: three mutually orthogonal observables, each discriminating one exit with a quantified threshold. It extends the adjudication-matrix methodology to the positive branch: the matrix handles "which arrow holds", the protocol handles "where a positive result points".

= Inputs to the Protocol (Two Premises)

#set par(first-line-indent: 0em)
- *Zero-background theorem (E5)*: in a local, Lorentz-invariant, weakly coupled EFT, the state-dependent coupling is suppressed by dimension-6 power counting by 10.7-28.3 orders of magnitude—any observable state-dependent signal falsifies all weakly coupled local EFTs.
- *Three exits (refinement of T2's fifth falsification clause)*: if the signal is real, the new physics must be: (1) a strongly coupled sector (observability requires $Lambda <~ 43 "MeV"$, coinciding with the EFT-invalid region); (2) a non-local theory (modified propagator analytic structure); (3) a state-charged sector (gravitational coupling carrying state quantum numbers).
#set par(first-line-indent: 1.6em)

The protocol's task: discriminate among the three exits in a way that is executable, quantifiable, and checkable.

= Exit 1: The Strongly Coupled Sector—the Energy-Scale Onset

The testable feature of a strongly coupled sector lies in the *energy dependence*, not the spatial shape: the shape-deviation scale $r_c = ℏ c/Lambda approx 4.6 "fm"$ is invisible at macroscopic $r$; but the form factor $F(E) approx 1/(1+E/Lambda)$ is sensitive to the probe transition energy, with deviation $delta F approx E/Lambda$:

#figure(
  table(
    columns: (1.6fr, 1.2fr, 1.2fr),
    align: (left, left, left),
    [*Probe*], [*Transition energy*], [*δF ≈ E/Λ*],
    [Th-229 isomer], [$8.36 "eV"$], [$1.9 times 10^(-7)$],
    [U-235 isomer], [$76.7 "eV"$], [$1.8 times 10^(-6)$],
    [keV-transition probe], [$10 "keV"$], [$2.3 times 10^(-4)$],
    [MeV-transition probe], [$1 "MeV"$], [$2.3 times 10^(-2)$],
  ),
  caption: [Table 1: The energy-scale onset of the strong-coupling exit. Multi-probe δα ratios, normalized to the quadrupole scaling, should show a residual ~E/Λ.]
)

*Discriminator*: multi-probe $delta alpha$ ratios. The local EFT predicts ratios strictly following the $angle O angle$ scaling; the strong-coupling exit predicts an extra factor $F(E)$—a percent-level deviation visible with MeV probes. This requires generalizing state-control tests from a single nuclear species to multi-species/multi-transition platforms (Th-229, U-235, and solid-state nuclear-clock lines), a natural experimental upgrade path.

= Exit 2: Non-Locality—Double-Exponential Discrimination and the Near-Range Extension

The propagator modification of non-locality appears in position space as a double-exponential (ghost) spectrum:

$ delta f(r) = 23 alpha (e^(-r/lambda_1) - beta e^(-r/lambda_2)) "Hz", $ <eq-ghost>

With the benchmark model $lambda_1 = 0.30 "m"$, $lambda_2 = 0.05 "m"$, $beta = 0.1$, at projected stability ($tau = 10^5 "s"$, $sigma_("δf") approx 2.9 times 10^(-10) "Hz"$), synthetic-data fitting (script 19) gives:

- Standard scan ($0.15 ~ 0.5 "m"$): $Delta chi^2 approx 0$—the second scale is invisible, because $r >= 0.15 "m" > 3 lambda_2$ leaves the ghost term below 5%;
- Extended near-range scan ($0.02 ~ 0.5 "m"$): $Delta chi^2 approx 10$, $beta_"min" approx 0.10$—the second scale is immediately discriminated.

*Protocol conclusion*: Step 1's shape fit must include the extended near-range segment (sampling at $r < lambda_2$). This is also a hardware recommendation: the translation stage of the nuclear-clock design should extend its near-range scan from $0.15 "m"$ down to $0.02 "m"$ (a modification of stage travel and shielding, entirely feasible at the order-of-magnitude level). $Delta chi^2 > 4$ adjudicates non-locality; $beta_"min"$ improves as $sqrt(tau)$.

= Exit 3: State Charge—Selection Rules and the m-Scan

In a state-charged sector the gravitational coupling carries state quantum numbers; its direct signature is selection rules: the pattern of $delta alpha$ over the nuclear spin projection $m$. The Th-229 ground state $I = 5/2$ provides three $|m|$ values:

#figure(
  table(
    columns: (1.6fr, 1.2fr, 1.2fr, 1.2fr),
    align: (left, left, left, left),
    [*Pattern*], [*|m| = 5/2*], [*|m| = 3/2*], [*|m| = 1/2*],
    [Universal (constant)], [1.00], [1.00], [1.00],
    [Spin charge ($prop m$)], [1.00], [0.60], [0.20],
    [Quadrupole charge ($prop m^2$)], [1.00], [0.36], [0.04],
  ),
  caption: [Table 2: Selection-rule patterns of the state-charge exit (normalized to |m| = 5/2). The three curves do not overlap—a single m-scan discriminates.]
)

*Discriminator*: the $delta alpha(m)$ pattern from microwave projection selection plus source-flip measurement. The three curves are non-overlapping; one m-scan adjudicates the charge type. The orthogonal check is the transition-rate anomaly (state charge mixing in an E1 component alters the isomer-lifetime angular-distribution signature).

= The Triage Protocol and Its Discrimination Table

#figure(
  table(
    columns: (0.8fr, 2.0fr, 1.6fr, 1.6fr),
    align: (left, left, left, left),
    [*Step*], [*Observable*], [*Threshold*], [*Exit*],
    [1], [Shape fit (extended near-range 0.02-0.5 m): single vs double exponential], [$Delta chi^2 > 4$], [Non-locality],
    [2], [Multi-probe ratios: deviation from the quadrupole scaling], [$delta F ~ E/Lambda$ (2% at MeV)], [Strong coupling],
    [3], [m-scan pattern: linear/quadratic], [deviation from constant], [State charge],
    [—], [All three steps return to zero], [—], [Systematic error (protocol self-check)],
  ),
  caption: [Table 3: The triage protocol. The three steps are mutually orthogonal observables; one experimental round completes all.]
)

= Reverse Risk: When the Signal Is a Systematic Error

The protocol must answer its own converse: if the "positive signal" is actually a systematic error (say, source-position-correlated magnetic fields, or residuals of crystal thermal gradients), what do the three steps give? *All return to zero*: the shape is purely exponential, the ratios are constant, the pattern is constant. Three zeros trigger the systematics recheck—the protocol's self-check clause, closing the loop with the adjudication matrix's "condition A (all known systematics excluded)". The protocol is thus safe in both directions: a real signal must be attributed; a fake signal must be exposed.

= Conclusion

This paper converts the three exits of the falsification clauses into a three-step executable triage protocol, each step with a quantified threshold backed by synthetic data: the extended near-range shape fit discriminates non-locality ($beta_"min" approx 0.10$ at $tau = 10^5 "s"$), multi-probe ratios discriminate strong coupling (2% at MeV), and the m-scan discriminates state charge (non-overlapping patterns). The protocol's broader significance: it demonstrates the methodology of the *positive branch*—the adjudication matrix prescribes not only how to falsify, but also the attribution path after falsification. Together with T2 and E5, the three steps close the loop from "which arrows hold" to "what lies beyond".

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. MuningAn. A Classification Theorem for Gravitational Control Channels (Paper T2, 2026).
2. MuningAn. Quantum States as Control Variables in Gravity Tests: A Unified Zero-Background Theorem (Paper E5, 2026).
3. MuningAn. Nuclear-Clock Experiment Design (v2.0, 2026)—translation-stage near-range scan parameters.
4. Zhang, C. et al. *Nature* (2024) (direct Th-229 excitation).
5. Derevianko, A., Elwell, R. & Hudson, E. R. arXiv:2606.11048 (2026).
6. Donoghue, J. F. *Phys. Rev. D* 50, 3874 (1994).
7. Will, C. M. *Living Rev. Rel.* 17, 4 (2014) (multi-probe equivalence-principle review).

#v(0.4em)
*Code availability*　experiments/19 (synthetic data + double-exponential discrimination + threshold scans) and Fig. 9 at github.com/everest-an/Antigravity.
