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
#set figure(placement: top)
#show figure: set block(above: 1em, below: 1.2em)
#show table: set text(size: 8.5pt)

#align(center)[
  #text(size: 16pt, weight: "bold")[The GIE 2025 Debate, Logically Reconstructed: What Each Side Actually Proved]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · Paper E3 (Comment format)]
]

#par(justify: false, first-line-indent: 0em)[
*Abstract*　The 2025 debate over gravity-induced entanglement (GIE)—the original argument, the classical-quantum hybrid counterexample, and the matter-sector rebuttal—is commonly summarized as "who was right and who was wrong." This note argues that the summary omits the most valuable content: the three sides proved *logically different propositions*. Using a table and three-model simulations, we separate the three sides' claims into six precise propositions, marking each one's logical content and its unresolved part. Conclusion: the debate's net product is not a verdict but a set of precise statements about "which observation excludes which theory"—precisely how the adjudication-matrix methodology occurs in real scientific practice.

*Keywords*　gravity-induced entanglement; LOCC; quantum gravity; scientific methodology
]

= Three Sides, Six Propositions

#figure(
  table(
    columns: (1.2fr, 2.4fr, 2.4fr),
    align: (left, left, left),
    [*Side*], [*Claim (logical content)*], [*Status*],
    [Original argument (BMV logic)], [P1: If two masses entangled only via gravitational interaction, the mediator is nonclassical (under the locality assumption)], [Holds (premise-dependent)],
    [Original argument], [P2: The observation is realizable on the tabletop], [Open (cost quantified: $10^9 ~ 10^21$ runs)],
    [Counterexample (Aziz-Howl)], [P3: A "classical gravity + quantum matter" framework exists that reproduces the entanglement], [Holds (within its own framework)],
    [Counterexample], [P4: Therefore GIE cannot prove quantization of gravity], [Does not hold (an overreach beyond P3's logical content)],
    [Rebuttal (Marletto et al. + 2026 dissection)], [P5: P3's entanglement sits in the matter sector (correlator vanishes for distinct matter types)], [Holds (model-independent restatement)],
    [Rebuttal], [P6: The standard BMV inference is fully preserved], [Holds (for LOCC-class channels)],
  ),
  caption: [Table 1: Separation of the six propositions. Key: P4 is an overreach from P3; P6 holds for LOCC-class channels, not for all classical models.]
)

= Logical Reconstruction

*The correct content of the original argument (P1)*: under the local-mediator assumption, entanglement generation excludes local classical channels. This is a standard theorem of quantum information; it is not in dispute.

*The correct content of the counterexample (P3)*: a specific classical-quantum hybrid theory can produce the observable. Its value lies in making P1's *premise* explicit—P1's range of validity depends on the precise form of the "local mediator" assumption.

*The counterexample's overreach (P4)*: from "there exists a hybrid model that reproduces" to "therefore quantization cannot be proved" ignores two points: the model's matter sector is itself quantum (the P5 dissection); and Newtonian gravity plus classical nonlocal evolution likewise produces entanglement (Marchese et al. 2025), showing that P1's exclusion target was LOCC all along, not "everything classical."

*The correct content of the rebuttal (P5, P6)*: the entanglement channel sits in the matter sector; the standard inference is fully preserved for LOCC-class channels.

= Net Product: A Set of Precise Statements

The debate's net product is not a verdict but the establishment of the following statements:

#set par(first-line-indent: 0em)
- GIE is a *LOCC excluder*: observing entanglement excludes local classical channels, not all classical models.
- Adjudication targets must be made precise: different exclusion strengths correspond to different model classes (LOCC / semiclassical / hybrid).
- Premises must be made explicit: the local-mediator assumption is an input to P1, not an output.
- The engineering boundary of the proposition consists of the run-cost magnitude ($10^9 ~ 10^21$) and the apparatus-recoil constraint (~100 μm).
#set par(first-line-indent: 1.6em)

These four are exactly the content of adjudication-matrix rows 6-7. The methodological conclusion: *when three sides of a debate are all partially right, the scientific product is the precise separation of propositions, not a verdict*—a complete occurrence of the arrow discipline in real practice.

= Appendix: Three-Model Simulation Summary

Numerical simulation of the four-dimensional Hilbert space implements the exclusion logic: the quantum model gives negativity $N approx 0.078$ and CHSH violation 0.024; mean-field and LOCC models give exactly zero; the continuous-variable verification converges with deviation $e^(-2 alpha^2)$. The simulation favors no side—it precisely renders P1's range of validity.

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. Bose, S. et al. *Phys. Rev. Lett.* 119, 240401 (2017).
2. Aziz, A. & Howl, R. *Nature* (2025) (with the accompanying critical literature).
3. Marletto, C., Oppenheim, J., Vedral, V. & Wilson, A. arXiv:2511.07348 (2025).
4. Tibau Vidal, N. & Varna Iyer, A. arXiv:2607.03429 (2026).
5. Marchese, M. M. et al. *Phys. Rev. A* 111, 042202 (2025).
6. Céleri, L. C. et al. arXiv:2607.08819 (2026).
