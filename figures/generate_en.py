# -*- coding: utf-8 -*-
"""
figures/generate_en.py —— 生成英文标注版全部 5 幅投稿图
输出：figures/en_fig01..05_*.png（英文标签，无中文字符）
"""
import math
import sys
from pathlib import Path
FIG = Path(__file__).resolve().parent
SIM = FIG.parent / "simulations"


sys.path.insert(0, str(FIG))
sys.path.insert(0, str(SIM))
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import numpy as np

plt.rcParams["axes.unicode_minus"] = False
plt.rcParams["figure.dpi"] = 150
plt.rcParams["savefig.bbox"] = "tight"

GRAY = "#666666"
COLORS = {"false": "#c0392b", "true": "#27ae60", "B": "#2980b9", "C": "#8e44ad"}

# ---------------- fig01: decision matrix ----------------
ROWS = [
    (3,  "EM fields convert into gravity", "false", "Schwinger-limit computation"),
    (5,  "⟨T̂μν⟩ as quantum source of geometry", "false", "MEP + PN consistency"),
    (9,  "ICO implies quantum spacetime", "false", "QC-QC theorem"),
    (14, "Vacuum energy as a resource", "false", "regularization dependence"),
    (1,  "Electricity and magnetism unified", "true", "Maxwell / relativity"),
    (2,  "Electroweak unification", "true", "BEH mechanism"),
    (17, "Inertia engineering = Tμν engineering", "true", "control-channel theorem"),
    (4,  "Double copy ontology", "B", "undecidable by computation"),
    (6,  "Superposed mass → superposed geometry", "B", "QGEM / phase readout"),
    (7,  "GIE witnesses nonclassical gravity", "B", "LOCC exclusion"),
    (19, "LIV / GUP (Planck-scale breaking)", "B", "GRB / LLR / nuclear clock"),
    (8,  "Post-Newtonian GIE (frame dragging)", "C", "~7 orders below readout"),
    (10, "Quantum causal structure", "C", "10 yr+"),
    (11, "Quantum weak equivalence principle", "B", "systematics-dominated"),
    (12, "KK extra dimensions", "C", "neV window"),
    (13, "Screened fifth forces", "false", "bounds tabulated"),
    (15, "Geontropic spacetime fluctuations", "C", "strong scale only"),
    (16, "Graviton quantum noise", "C", "bolometric, 10 yr+"),
    (18, "Entanglement → geometry (real universe)", "C", "no near-term channel"),
]
XPOS = {"false": 1, "true": 2, "B": 3, "C": 4}
XTICK = {1: "Falsified", 2: "Established\n(grade A)", 3: "Grade B\n(correspondence)", 4: "Grade C\n(candidate)"}
rows_sorted = sorted(ROWS, key=lambda r: (XPOS[r[2]], r[0]))
fig, ax = plt.subplots(figsize=(11, 9.5))
for i, (num, name, cat, note) in enumerate(rows_sorted):
    y = len(rows_sorted) - i
    ax.scatter(XPOS[cat], y, s=170, color=COLORS[cat], zorder=3, edgecolors="white", linewidths=1.2)
    ax.text(0.55, y, f"{num:>2}", ha="right", va="center", fontsize=9, color=GRAY, fontweight="bold")
    ax.text(0.7, y, name, ha="left", va="center", fontsize=10.5)
    ax.text(4.55, y, note, ha="left", va="center", fontsize=8.5, color=GRAY)
ax.set_xlim(0.2, 6.6)
ax.set_ylim(0.5, len(rows_sorted) + 0.5)
ax.set_xticks(list(XTICK.keys()))
ax.set_xticklabels([XTICK[k] for k in XTICK], fontsize=9)
ax.set_yticks([])
ax.spines[["top", "right", "left"]].set_visible(False)
ax.grid(axis="y", alpha=0.25, zorder=0)
for key, lab in [("false", "falsified"), ("true", "established"), ("B", "grade B"), ("C", "grade C")]:
    ax.scatter([], [], s=110, color=COLORS[key], label=lab)
ax.legend(loc="lower right", fontsize=9, frameon=False, ncol=4, bbox_to_anchor=(1.0, -0.14))
ax.set_title("Decision matrix: 19 arrows on unification and anti-gravity (2026-08)", fontsize=13, pad=12)
ax.text(0.62, -0.05, "Each row carries a discriminating channel, a target it would exclude, and a timescale.",
        transform=ax.transAxes, fontsize=8.5, color=GRAY)
fig.savefig(str(FIG / "en_fig01_decision_matrix.png"))
plt.close(fig)

# ---------------- fig02: reality stack ----------------
LAYERS = [
    (7, "?", "unknown fundamental structure", "#e8e8e8"),
    (6, "quantum relations / information", "entanglement structure, QRF, causality", "#f5e6f0"),
    (5, "symmetry / connection / kinematic algebra", "gauge groups, double copy", "#e6ecf5"),
    (4, "state-valued sources T̂, charges", "stress-energy, gauge charges  <-  unique entry", "#eaf4ea"),
    (3, "gμν, Aμ, quantum fields", "metric, gauge potentials  <-  effective layer", "#f7f3e6"),
    (2, "motion / clock phase Δφ=ΔS/ħ", "geodesics, proper time", "#fdf0e6"),
    (1, "observables", "clicks, photons, positions, frequencies", "#f0f0f0"),
]
fig, ax = plt.subplots(figsize=(10, 8.5))
ax.set_xlim(0, 12)
ax.set_ylim(0.5, len(LAYERS) + 1.6)
ax.axis("off")
from matplotlib.patches import FancyBboxPatch
for i, (lv, name, desc, color) in enumerate(LAYERS):
    y = len(LAYERS) - i
    box = FancyBboxPatch((1.6, y - 0.38), 7.4, 0.76, boxstyle="round,pad=0.04", fc=color, ec="#444", lw=1.1)
    ax.add_patch(box)
    ax.text(1.8, y + 0.13, f"Layer {lv}", fontsize=10, fontweight="bold", color="#333")
    ax.text(3.2, y + 0.13, name, fontsize=12, fontweight="bold")
    ax.text(3.2, y - 0.17, desc, fontsize=9.5, color=GRAY)
ax.text(0.15, len(LAYERS) + 0.85, "control stack\n(change)", fontsize=10, color="#c0392b", ha="center", va="top", fontweight="bold")
ax.annotate("", xy=(1.55, 1.1), xytext=(0.6, len(LAYERS) - 0.2), arrowprops=dict(arrowstyle="-|>", color="#c0392b", lw=1.4))
ax.text(0.35, 2.2, "energy\nengineering", fontsize=9, color="#c0392b", ha="center", va="center")
ax.text(11.85, len(LAYERS) + 0.85, "measurement stack\n(probe)", fontsize=10, color="#2980b9", ha="center", va="top", fontweight="bold")
ax.annotate("", xy=(9.05, 1.1), xytext=(11.2, len(LAYERS) - 0.2), arrowprops=dict(arrowstyle="-|>", color="#2980b9", lw=1.4))
ax.text(11.55, 2.2, "phase\nreadout", fontsize=9, color="#2980b9", ha="center", va="center")
ax.text(9.75, 3.0, "Tμν unique entry\n(control-channel theorem)", fontsize=9.5, color="#27ae60", ha="center", fontweight="bold")
ax.text(6, 0.25, "Humanity leads on the measurement stack and is nearly blank on the control stack — "
                 "the meaning of 'gravity is the wrong engineering variable'.", ha="center", fontsize=9, color=GRAY)
fig.savefig(str(FIG / "en_fig02_reality_stack.png"))
plt.close(fig)

# ---------------- fig03: RT mincut (from simulations) ----------------
import importlib.util
def load(script, name):
    spec = importlib.util.spec_from_file_location(name, script)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod
sim05 = load(str(SIM / "05_tensor_network_rt.py"), "sim05")
sim07 = load(str(SIM / "07_mera_rt.py"), "sim07")
INTERVALS = [("single {0}", [0]), ("adjacent pair {0,1}", [0, 1]), ("distant pair {0,4}", [0, 4]),
             ("half tree {0..3}", [0, 1, 2, 3]), ("three across {0,1,4}", [0, 1, 4])]
rng05 = np.random.default_rng(42); rng07 = np.random.default_rng(7)
acc05 = {k: 0.0 for k, _ in INTERVALS}; acc07 = {k: 0.0 for k, _ in INTERVALS}
for _ in range(30):
    psi = sim05.random_tree_state(rng05)
    for k, A in INTERVALS:
        acc05[k] += sim05.renyi2(psi, A) / 30
for _ in range(40):
    full = sim07.mera_boundary_state(rng07)
    for k, A in INTERVALS:
        acc07[k] += sim07.renyi2(full, A) / 40
fig, ax = plt.subplots(figsize=(7.5, 6))
xs = np.array([sim05.mincut_of(A) * math.log(4) for _, A in INTERVALS])
ys5 = np.array([acc05[k] for k, _ in INTERVALS])
ys7 = np.array([acc07[k] * (math.log(4) / math.log(2)) for k, _ in INTERVALS])
x07 = np.array([sim07.mincut_of(A) * math.log(4) for _, A in INTERVALS])
ax.scatter(xs, ys5, s=70, color="#2980b9", label="Sim 05 (hand-rolled tree, χ=4)", zorder=3)
ax.scatter(x07, ys7, s=70, marker="s", facecolors="none", edgecolors="#8e44ad", label="Sim 07 (quimb MERA, χ=2 rescaled)", zorder=3)
lim = max(xs.max(), ys5.max(), ys7.max()) * 1.15
ax.plot([0, lim], [0, lim], "--", color="#c0392b", lw=1.4, label="exact RT (large χ): S = mincut · lnχ")
ax.set_xlim(0, lim); ax.set_ylim(0, lim)
ax.set_xlabel("mincut(A) · lnχ  (discrete minimal surface area)", fontsize=11)
ax.set_ylabel("⟨S2(A)⟩", fontsize=11)
ax.set_title("Entanglement entropy = minimal surface: two independent implementations", fontsize=12)
ax.legend(fontsize=9, frameon=False)
ax.grid(alpha=0.25)
fig.savefig(str(FIG / "en_fig03_rt_mincut.png"))
plt.close(fig)

# ---------------- fig04: fifth force ----------------
G = 6.6743e-11
def alpha_bound(delta_a, M, r, lamb):
    a_N = G * M / r ** 2
    a_Y = a_N * (1.0 + r / lamb) * math.exp(-r / lamb)
    return delta_a / a_Y if a_Y > 0 else float("inf")
experiments = [("Eöt-Wash torsion", 1e-11, 1e-3, 1e-4, "#2980b9"),
               ("Panda lattice atoms", 6.2e-9, 0.1, 0.05, "#27ae60"),
               ("MICROSCOPE", 2.5e-14, 5.97e24, 7.0e6, "#8e44ad"),
               ("Lunar laser ranging", 1e-12, 5.97e24, 3.84e8, "#d35400")]
lambs = np.logspace(-8, 10, 200)
fig, ax = plt.subplots(figsize=(8.5, 6))
best = np.full_like(lambs, np.inf)
for (name, da, M, r, c) in experiments:
    b = np.array([alpha_bound(da, M, r, l) for l in lambs])
    finite = np.isfinite(b)
    ax.plot(lambs[finite], b[finite], color=c, lw=1.4, label=name)
    best = np.minimum(best, b)
ax.plot(lambs, best, color="black", lw=2.2, ls="--", label="strongest combined bound")
ax.fill_between(lambs, best, 1e4, color="#c0392b", alpha=0.10)
ax.scatter([1e6], [0.36], marker="*", s=260, color="#c0392b", zorder=5, label="KK-AB requirement (eV splitting)")
ax.axvspan(1e-8, 1e-5, color="#f1c40f", alpha=0.12)
ax.text(2.5e-7, 3e-3, "open window\n(Casimir platforms)", fontsize=9, color="#7d6608", ha="center")
ax.set_xscale("log"); ax.set_yscale("log")
ax.set_xlabel("λ [m]  (Yukawa range)", fontsize=11)
ax.set_ylabel("α  (coupling relative to gravity)", fontsize=11)
ax.set_title("Fifth-force landscape: α ~ O(1) excluded; the KK eV requirement sits 7-8 orders inside the excluded region", fontsize=12)
ax.set_ylim(1e-16, 1e1)
ax.legend(fontsize=8.5, frameon=False, loc="lower left")
ax.grid(alpha=0.25, which="both")
fig.savefig(str(FIG / "en_fig04_fifth_force.png"))
plt.close(fig)

# ---------------- fig05: GIE discrimination ----------------
import qutip as qt
def qubit_negativity(phi):
    psi = np.array([0.5, 0.5, 0.5, 0.5], dtype=complex)
    U = np.diag([1, np.exp(1j * phi), np.exp(1j * phi), 1])
    psi = U @ psi
    rho = np.outer(psi, psi.conj())
    pt = rho.reshape(2, 2, 2, 2).transpose(0, 3, 2, 1).reshape(4, 4)
    ev = np.linalg.eigvalsh(pt)
    return float(np.sum(np.abs(ev[ev < 0])))
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(12.5, 5.2))
phis = np.linspace(0, np.pi, 200)
n_qg = [qubit_negativity(p) for p in phis]
ax1.plot(phis, n_qg, color="#2980b9", lw=2.2, label="quantum gravity (global unitary)")
ax1.axhline(0, color="#8e44ad", lw=1.6, ls="--", label="Schrödinger-Newton / LOCC")
phi_bose = 0.217
n_bose = qubit_negativity(phi_bose)
ax1.scatter([phi_bose], [n_bose], color="#c0392b", s=70, zorder=5)
ax1.annotate(f"Bose benchmark\nφ={phi_bose} rad, N={n_bose:.3f}", (phi_bose, n_bose),
             xytext=(8, -28), textcoords="offset points", fontsize=9, color="#c0392b",
             arrowprops=dict(arrowstyle="->", color="#c0392b", lw=1))
ax1.set_xlabel("entanglement phase φ [rad]", fontsize=11)
ax1.set_ylabel("negativity N", fontsize=11)
ax1.set_title("(a) Three-model discrimination: N>0 excludes LOCC", fontsize=11.5)
ax1.legend(fontsize=8.5, frameon=False, loc="upper left")
ax1.grid(alpha=0.25)
ax1.set_ylim(-0.02, 0.22)
GG, HBAR = 6.6743e-11, 1.054571817e-34
m, dx, d, t = 1e-14, 250e-6, 450e-6, 2.5
p0 = GG * m * m * t / (HBAR * d)
phi_vec = (0.0, GG * m * m * t / (HBAR * (d + dx)) - p0, GG * m * m * t / (HBAR * (d - dx)) - p0, 0.0)
N_qubit = qubit_negativity((phi_vec[1] + phi_vec[2]) / 2.0)
NN = 16
alphas = np.linspace(0.4, 2.4, 11)
devs = []
for alpha in alphas:
    a = qt.coherent(NN, alpha); na = qt.coherent(NN, -alpha)
    psi = (qt.tensor(a, a) * np.exp(1j * phi_vec[0]) + qt.tensor(a, na) * np.exp(1j * phi_vec[1])
           + qt.tensor(na, a) * np.exp(1j * phi_vec[2]) + qt.tensor(na, na) * np.exp(1j * phi_vec[3])).unit()
    rho = psi * psi.dag()
    M = rho.full().reshape(NN, NN, NN, NN).transpose(0, 3, 2, 1).reshape(NN * NN, NN * NN)
    ev = np.linalg.eigvalsh(M)
    devs.append(abs(float(np.sum(np.abs(ev[ev < 0]))) - N_qubit))
ax2.semilogy(alphas, devs, "o-", color="#2980b9", lw=1.8, ms=5, label="|N_CV − N_qubit| (numerical)")
ax2.plot(alphas, np.exp(-2 * alphas ** 2), "--", color="#c0392b", lw=1.6, label="e^(−2α²) (prediction)")
ax2.set_xlabel("branch displacement α", fontsize=11)
ax2.set_ylabel("deviation from qubit limit", fontsize=11)
ax2.set_title("(b) Qubit-abstraction fidelity: CV convergence ∝ e^(−2α²)", fontsize=11.5)
ax2.legend(fontsize=8.5, frameon=False)
ax2.grid(alpha=0.25, which="both")
fig.savefig(str(FIG / "en_fig05_gie_discrimination.png"))
plt.close(fig)

# ---------------- fig06: nuclear-clock reachability ----------------
E_TRANS = 8.36
S_LAB = 9.5e-14
S_ORB = 2.79
A_ORB = 6.771e6
SIGMA0 = 4.6e-23

def alpha_min(lamb, tau, s):
    return E_TRANS * SIGMA0 / np.sqrt(tau) / s * np.exp(A_ORB / lamb)

lambs = np.logspace(5, 11, 300)
taus = [1e3, 1e4, 1e5, 1e6]
ccolors = ["#9fb8d4", "#6fa8dc", "#3d85c6", "#0b5394"]
fig, ax = plt.subplots(figsize=(9.5, 6.5))
for tau, c in zip(taus, ccolors):
    ax.plot(lambs, alpha_min(lambs, tau, S_LAB), color=c, lw=1.8,
            label=f"laboratory a_min (tau={tau:.0e} s)")
a_orb = E_TRANS * SIGMA0 / np.sqrt(1e6) / S_ORB
ax.axhline(a_orb, color="#27ae60", lw=1.6, ls=":",
           label=f"orbital a_min (tau=1e6 s) ~ {a_orb:.0e}")
segs = [(1e5, 1e7, 1e-9, "#8e44ad", "LAGEOS/GEO"),
        (1e7, 3.8e8, 1e-9, "#8e44ad", None),
        (3.8e8, 1.5e11, 3e-11, "#8e44ad", "LLR"),
        (1.5e11, 3e11, 1e-8, "#8e44ad", "planetary")]
for x0, x1, y, c, lab in segs:
    ax.plot([x0, x1], [y, y], color=c, lw=2.4, ls="--", alpha=0.85)
    if lab:
        ax.text(x1 * 1.06, y, lab, fontsize=8.5, color=c, va="center")
ax.plot([], [], color="#8e44ad", lw=2.4, ls="--", label="existing universal bound (ranging)")
ax.plot([7e6, 3e11], [5.5e-15, 5.5e-15], color="#d35400", lw=2.0, ls="-.",
        label="MICROSCOPE composition channel (2-sigma saturated)")
ax.axhspan(1e-12, 1e-6, color="#f1c40f", alpha=0.10)
ax.text(1.6e5, 3e-11, "unexcluded window\na in [1e-12, 1e-6]", fontsize=9.5,
        color="#7d6608", va="center")
ax.annotate("tau=1e6 s curve is 1-2 orders deeper\nthan ranging bounds in lambda in [1e7, 1e10] m",
            xy=(1e8, 4.3e-12), xytext=(4e5, 2e-14),
            fontsize=9, color="#0b5394",
            arrowprops=dict(arrowstyle="->", color="#0b5394", lw=1))
ax.set_xscale("log"); ax.set_yscale("log")
ax.set_xlim(1e5, 3e11); ax.set_ylim(1e-26, 1e-4)
ax.set_xlabel("lambda [m]  (Yukawa range)", fontsize=11)
ax.set_ylabel("a_min  (detectable coupling, 1-sigma)", fontsize=11)
ax.set_title("Nuclear-clock KK reachability: lab a_min(lambda, tau) + orbital limit vs existing bounds", fontsize=12)
ax.legend(fontsize=8.5, frameon=False, loc="lower left")
ax.grid(alpha=0.25, which="both")
fig.savefig(str(FIG / "en_fig06_reachability.png"))
plt.close(fig)

print("english figures generated:", ", ".join(f"en_fig0{i+1}" for i in range(6)))
