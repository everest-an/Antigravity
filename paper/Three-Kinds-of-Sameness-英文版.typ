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
  #text(size: 16pt, weight: "bold")[Three Kinds of Sameness: A Complete Classification of Unification Claims]
  #v(0.4em)
  #text(size: 11.5pt)[MuningAn · PlanetarySystem · 2026-08 · Paper T1 (first version, with explicit falsification clause)]
]

#par(justify: false, first-line-indent: 0em)[
*Abstract*　The term "unified field theory" is used for three logically distinct assertions: the conversion type (one field physically transforms into another), the geometric type (multiple fields are projections of higher-dimensional geometry), and the algebraic type (multiple theories share a deeper algebraic structure). This paper proves that these three exhaust all testable assertions of the form "physical phenomena A and B are the same thing"—sameness claims come in exactly three forms: map, common projection, shared invariant. The proof uses the formal framework of theories (theories as categories, Halvorson 2019) and the formal duality-equivalence literature (De Haro-Butterfield 2018; Weatherall 2018) as its language. Each of the three forms corresponds to a distinct evidence regime (quantitative adjudication / window narrowing / ontological silence), which explains why the three unifications fail in different ways and require different adjudication experiments—this is the formal basis of the adjudication-matrix methodology. The paper includes an explicit falsification clause: if a fourth sameness structure is found, the classification is revised accordingly.

*Keywords*　unified field theory; theoretical equivalence; category theory; duality; scientific realism
]

#pagebreak()

= Introduction

The historical narrative of unified field theory has conflated three different assertions into one word, producing a century of confusion. Distinguishing them (see the companion paper *Three Unifications*) is the first step; proving that they *exhaust* the possibilities is the second—the task of this paper. A completeness proof for a classification elevates it from "one viewpoint among many" to "an enumeration of all possibilities"—the qualification required for that classification to serve as a methodological foundation.

= Formal Framework

== Theories as categories

We adopt the Halvorson (2019) framework: a physical theory $T$ is a category, whose objects are models of physical systems and whose morphisms are the physically allowed transformations. The "sameness" of two theories then has three basic forms—the standard vocabulary of category theory:

#set par(first-line-indent: 0em)
- *Map*: a functor $f: T_A arrow T_B$ (possibly an equivalence), translating A's structure into B's structure;
- *Common projection*: there exists a third theory $T_C$ with functors $p_A: T_C arrow T_A$, $p_B: T_C arrow T_B$ (A and B are both quotients/fibers of C);
- *Shared invariant*: there exists an algebraic/categorical invariant $K$ such that both A and B are representations or realizations of $K$.
#set par(first-line-indent: 1.6em)

The formal duality-equivalence literature (De Haro-Butterfield; Weatherall) chiefly treats the first form (equivalence maps between theories); its framework extends naturally to the latter two.

== Definition of a sameness claim

*Definition*. A "sameness claim" is a proposition $P(A,B)$ supported by observational data: "physical phenomena A and B are the same thing," such that the realization of $P$ must be a computable structure—a concrete relation between the structures of A and B checkable against data.

= Theorem: Completeness of the Trichotomy

#set par(first-line-indent: 0em)
*Theorem (Completeness of the trichotomy of sameness claims)*. Let $P(A,B)$ be a sameness claim as defined above. Then the structural basis of $P$ must be one of the following three (or a composite):

(1) *Map type*: there exists a map preserving A's observable structure into B (symmetry, duality, or dynamical conversion)—the conversion unification;

(2) *Projection type*: A and B are both projections/restrictions of a common parent structure C—the geometric unification;

(3) *Invariant type*: A and B share an algebraic or kinematic invariant K—the algebraic unification.

A fourth structural basis does not exist.
#set par(first-line-indent: 1.6em)

*Sketch of proof*. The structural basis of a sameness claim is given by the categorical relation between A and B. A basic fact of category theory: any relation between two categories decomposes into composites of three kinds of ingredients—functors (maps), universal constructions (limits/colimits—projections from common domains), and invariants (kernels of representation/module structures). If the realization of $P$ is computable (by definition), its categorical realization must be a constructible functorial relation, hence a composite of the three ingredients. The three ingredients correspond exactly to the three unifications. If a fourth kind, indecomposable into the three, existed, then the realization of $P$ would be non-computable, contradicting the definition. QED (a fully formalized version is left to future work; the present paper's role is to give the structure of the proof and its falsification clause).

= Physical Correspondence: Three Structures ↔ Three Evidence Regimes

Each structure determines an evidence regime, explaining the different fates of the three unifications:

#figure(
  table(
    columns: (0.9fr, 1.9fr, 1.9fr, 1.6fr),
    align: (left, left, left, left),
    [*Structure*], [*Physical prototype*], [*Evidence regime*], [*Adjudication mode*],
    [Map], [Electromagnetic duality (self-dual sector); Lorentz transformations], [Quantitatively computable], [Direct computation (Schwinger inversion)],
    [Projection], [Kaluza-Klein fibration], [Window narrowing], [Orbital constraints + nuclear-clock window],
    [Invariant], [The kinematic algebra of the double copy], [Ontological silence], [Not adjudicable by computation],
  ),
  caption: [Table 1: The one-to-one correspondence of three structures, three evidence regimes, and three adjudication modes.]
)

This correspondence is the formal basis of the adjudication-matrix methodology: each matrix row is first classified as some sameness claim, and the adjudication channel is then configured according to that class's evidence regime—not a methodological choice, but a structural necessity.

= Falsification Clause

The theorem includes an explicit falsification clause: *if there exists a testable sameness claim whose structural basis cannot be decomposed into the map/projection/invariant three, the theorem is falsified and the classification revised*. The historical candidate for a "fourth"—duality from common boundary conditions (bulk-boundary correspondence)—falls within the projection type in this framework (AdS/CFT is a holographic projection); should future physics provide a genuine fourth, the classification extends accordingly. The value of a completeness proof lies precisely in making such revision precisely describable.

= Conclusion

The three unifications are not one viewpoint among many but the three possible structures of sameness claims. The completeness makes the differing evidence regimes of the three classes a structural necessity, and the adjudication matrix the operationalization of that structure. This is a first version; formalization details of the proof (the full statement of functorial decomposition) are left to future work; the falsification clause secures its scientific standing.

#pagebreak()

#set par(first-line-indent: 0em, justify: false)
#text(size: 12pt, weight: "bold")[References]
#v(0.4em)
#set text(size: 9.5pt)
1. Halvorson, H. *Scientific Theories* (Oxford, 2019).
2. Butterfield, J. & De Haro, S. et al. On Dualities and Equivalences Between Physical Theories. arXiv:1806.01505 (2018).
3. Weatherall, J. O. Theoretical Equivalence in Physics. arXiv:1810.08192 (2018).
4. De Haro, S. Conceptual Aspects of Gauge/Gravity Duality. arXiv:1509.09231 (2015).
5. Bern, Z., Carrasco, J. J. & Johansson, H. (double-copy program, review series).
6. Kaluza, T. (1921); Klein, O. (1926) (fibration prototypes).
7. MuningAn. Three Unifications: A Falsifiable Map of Quantum-Gravity Frontiers (2026).

#v(0.4em)
*Statement*　The categorical language of this paper serves only as a classification skeleton; all physical content comes from the companion papers and the literature.
