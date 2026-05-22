# Serpentine Laser Array — Polarization-Controlled Discrete Mode Switching (1×1 → 6×8 Expansion Study)

Red laser dot(s) projected onto a diffuse white LED panel surface, recording the spatial distribution and optical behavior of reflected/scattered light across 20 trials across 4 sessions. **Key finding (Session 4):** orthogonal polarizer film at the input port produces discrete satellite modes even in a 1×1 array — confirming that discrete mode generation is driven by polarization state, not array size. Expansion to **6×8** remains planned for large-scale collective propagation.

---

## Overview Grid (Session 1 — 6 videos × 8 time steps)

![6×8 frame grid](led_panel_6x8_grid.jpg)

*Columns = videos 01–06 · Rows = evenly sampled time steps within each video*

---

## Video Captions

### Session 1 — White LED Panel, No Polarizer (videos 01–06)

| File | Duration | Description |
|------|----------|-------------|
| `01_baseline_single_dot.mp4` | ~48 s | **Baseline — single localized mode.** One stationary dot at lower-center. No lattice propagation; edge dominates the entire system. Reference for isolated mode behavior. |
| `02_dot_appears_bottom.mp4` | ~48 s | **Mode re-entry at edge.** Dot reappears at bottom edge with slight positional drift. Early surface reflection visible — coupling path still minimal. |
| `03_dots_cluster_scatter.mp4` | ~47 s | **Discrete satellite cluster onset.** Multiple dots in a loose, irregular cluster across the lower half. Transition from single mode toward multi-site activation — still local, not collective. |
| `04_dots_arc_pattern.mp4` | ~43 s | **Angular preference emerging.** Dots arrange into a curved arc — non-circular symmetry indicates serpentine geometry is influencing optical path selection, not simple diffuse scattering. |
| `05_streaks_vertical.mp4` | ~35 s | **Continuous fringe → streak transition.** Dots elongate into vertical streaks, suggesting partial fringe coupling along one axis. Directional satellite set reappears consistently. |
| `06_streaks_full_panel.mp4` | ~34 s | **Broadest local mode extent.** Multiple streaks across larger panel area — closest to collective behavior seen in current 1×1 array, but large-array propagation still absent. |

### Session 2 — Dark Background / UV Suppression (videos 07–10)

| File | Duration | Description |
|------|----------|-------------|
| `07_discrete_cluster_dark.mp4` | ~41 s | **Discrete satellite cluster confirmed — dark field.** Panel background fully dark; red dots appear as isolated, sharply separated point emitters. Cluster geometry shows consistent non-circular asymmetry, reinforcing angular preference hypothesis. |
| `08_cluster_to_streaks_dark.mp4` | ~33 s | **Cluster → streak transition in dark conditions.** Satellite dots elongate into directional streaks as the trial progresses. Streak orientation is non-random — same preferred axes as Session 1, confirming structural optical path selection. |
| `09_scattered_dots_dark.mp4` | ~38 s | **Wide-field discrete dot scatter — dark field.** Dots distributed across a broader area in distinct, separated positions. Clear discreteness visible: dots do not blur or merge, consistent with localized mode jumping rather than continuous propagation. |
| `10_uv_suppression_red_on_blue.mp4` | ~36 s | **UV suppression trial.** UV illumination introduced; panel background shifts to deep blue/violet. Red laser satellites remain visible as distinct warm-toned emitters against the UV field. UV background suppresses ambient scatter, isolating red-channel signal. Demonstrates wavelength-selective visibility of satellite pattern. |

### Session 3 — Black Paper Backup (videos 11–15)

| File | Duration | Description |
|------|----------|-------------|
| `11_blackpaper_single_streak_onset.mp4` | ~40 s | **Single red dot with streak onset — black paper.** Fringe structure begins suppressed against black paper surface; only the primary emission point and its immediate streak survive. Confirms fringe suppression is not a white-panel artifact. |
| `12_blackpaper_fringe_suppressed_dot.mp4` | ~34 s | **Fringe lines fully suppressed — black paper.** Single dot persists at center with no surrounding diffuse halo. Fringe suppression occurs equally on black paper and white LED panel, ruling out surface-dependent scattering. |
| `13_blackpaper_satellite_cluster_cross.mp4` | ~35 s | **Satellite cluster — cross geometry, black paper.** Discrete, separated dots arrange in a cross/plus pattern around the primary dot. Angular preference consistent with Sessions 1 and 2; no merging or blurring. |
| `14_blackpaper_fringe_null_dark.mp4` | ~31 s | **Near-complete fringe null state — black paper.** Only faint residual dots visible at extreme low intensity. Demonstrates fringe suppression can reach a near-zero floor independent of background surface. |
| `15_blackpaper_wide_discrete_scatter.mp4` | ~28 s | **Wide-field discrete scatter — black paper.** Satellites spread to a broad arc as pure point-like emitters with no streak elongation. Localized mode jumping on black paper matches behavior seen on LED panel — confirms surface independence. |

### Session 4 — Orthogonal Polarizer Film at Input (videos 16–20)

> **Key finding:** discrete satellite modes appear in a 1×1 array when the input polarizer is set orthogonal. Array size is not the primary driver — polarization state is.

| File | Duration | Description |
|------|----------|-------------|
| `16_polarizer_orthogonal_single_dot.mp4` | ~29 s | **Orthogonal polarizer baseline — single dot.** Polarizer film placed orthogonal at the input port of the 1×1 serpentine. Single isolated dot visible with short vertical streak; no fringe lines. Confirms polarization state controls fringe onset. |
| `17_polarizer_orthogonal_fringe_null.mp4` | ~26 s | **Fringe fully nulled — orthogonal polarization.** No fringe structure visible; only the primary dot survives. Demonstrates that fringe lines are polarization-dependent, not a surface or geometry artifact. |
| `18_polarizer_orthogonal_dot_stable.mp4` | ~27 s | **Stable isolated dot — orthogonal polarization.** Primary dot holds a fixed position with minimal drift across the full trial duration. System locked in single localized state under orthogonal polarization. |
| `19_polarizer_orthogonal_discrete_onset.mp4` | ~22 s | **Discrete satellite onset — 1×1 with orthogonal polarizer.** Discrete satellites appear despite 1×1 array geometry. Confirms discrete mode generation is driven by polarization condition, not array size. |
| `20_polarizer_orthogonal_discrete_confirmed.mp4` | ~24 s | **Discrete mode confirmed — polarizer-induced, geometry-independent.** Multiple discrete satellites visible and stable. Establishes that orthogonal polarizer input is a sufficient condition for discrete satellite generation even in a minimal 1×1 configuration. |

---

## Technical Notes

- **Camera**: 1920×1080 @ ~30 fps (original)
- **Panel**: Diffuse white surface (LED panel / acrylic diffuser)
- **Laser**: Red (~650 nm), single-point source
- **Compressed**: 960×540, H.264 CRF 28, 15 fps — optimized for GitHub (<2 MB/file)

---

## Observation

Session 1 shows a progression from single static dot → scattered cluster → arc → vertical streaks. Session 2 (dark field) confirms that the discrete character is real and not an artifact of background illumination. Session 3 (black paper) confirms fringe suppression and discrete behavior are surface-independent. Session 4 is the critical result: **orthogonal polarizer input produces discrete satellites in a 1×1 array**, directly demonstrating that polarization state — not array size — is the primary control variable for discrete mode generation.

---

## Analysis

> The following interpretation is based on GPT analysis of the current footage.

The current 1×1 serpentine configuration behaves more like **localized mode switching** than true dynamic rotation. The "slightly static" impression is accurate, for the following reasons:

- No global lattice propagation occurs
- Coupling paths are short
- The edge effectively acts as the entire system

As a result, the pattern appears to **jump between discrete states** rather than flow continuously across the surface.

### Notable Finding — Angular Preference

The discrete satellite clusters are **not fully circularly symmetric**. This suggests the serpentine geometry is **inducing an angular preference** in the optical output. If this were simple diffuse scattering, rotating the source should only increase diffuse blur. Instead, the same directional satellite set reappears consistently — indicating that the structure is actively involved in **optical path selection**, not just passive scattering.

### Expected Changes with 6×8 Expansion

- Fringe plumes will extend and connect spatially
- Satellite activations will propagate in sequence across the array
- The current "frozen dot" appearance is expected to diminish significantly

### Summary Assessment (Sessions 1–4)

| Item | Status |
|------|--------|
| Continuous fringe → discrete satellite transition | Partially observed ✅ |
| Behavior confined to local mode level | Confirmed ✅ |
| Discrete character confirmed under dark field | Confirmed (Session 2) ✅ |
| Fringe suppression surface-independent | Confirmed (Session 3) ✅ |
| Red satellite survives UV background suppression | Confirmed (video 10) ✅ |
| **Discrete mode triggered by orthogonal polarizer — 1×1 sufficient** | **Confirmed (Session 4) ✅** |
| Diamond polarizer input → pure streak mode (no dots) | Confirmed (video 21) ✅ |
| Output polarizer rotation → streak extinction + recovery | Confirmed (video 22) ✅ |
| Streak output carries defined polarization state | Confirmed (video 22) ✅ |
| Large-array collective effect | Pending (6×8 required) ❌ |

**Conclusion: Input polarizer orientation is the primary mode selector — orthogonal produces discrete dots, diamond (45°) produces pure streak lines. Streak output carries a well-defined polarization state confirmed by output analyzer extinction. 6×8 expansion remains necessary for large-scale collective propagation effects.**

### Session 5 — Diamond Polarizer at Input / Output Polarizer Rotation (videos 21–22)

> **Key finding:** diamond-orientation polarizer at input converts the output entirely into streak lines. Rotating a polarizer at the output port causes the streaks to temporarily vanish then recover — confirming the streak pattern carries a defined polarization state that can be selectively blocked.

| File | Duration | Description |
|------|----------|-------------|
| `21_polarizer_diamond_input_streak_mode.mp4` | ~6 s | **Diamond polarizer at input — pure streak mode.** Polarizer film oriented at 45° (diamond) at the input port. Output is entirely streak lines with no discrete dot component — contrasts directly with orthogonal (Session 4) which produced discrete dots. Demonstrates that input polarizer angle selects between streak mode and discrete dot mode. |
| `22_polarizer_output_rotation_streak_suppress_recover.mp4` | ~30 s | **Output polarizer rotation — streak suppression and recovery.** Polarizer film rotated at the output port while diamond input polarizer is active. Streaks temporarily disappear at the extinction angle then fully recover as rotation continues. Confirms streak pattern is polarized output: the output polarization state is well-defined and can be extinguished by an analyzer, ruling out incoherent scatter. |


---

## Why 0° vs 90° Input Polarizer Produces Different Modes

> Based on GPT analysis — Savart plate behavior with polarizer input angle.

### Observed at 90° Input (from footage)

- Discrete vertical streaks and dots appear with high clarity
- Dots elongate strongly into vertical streak form
- When output analyzer is rotated, contrast changes periodically — pattern disappears then reappears strongly

### Physical Explanation — Savart Plate Axis Interaction

A Savart plate has two orthogonal axes (fast axis / slow axis).

- **0° input polarizer** → relatively more aligned or misaligned with the Savart plate axes → discrete dot character is more likely to survive
- **90° input polarizer** → input approaches 45° relative to the Savart plate axes, or o-ray / e-ray amplitudes become more equal → tendency toward stronger streak (continuous line) output

In other words: at 90°, interference is more strongly activated, lengthening the streak lines. At 0°, discrete character is relatively more preserved.

This is a well-known behavior. In Savart plate + polarizer experiments, switching between discrete ↔ fringe/streak modes depending on input polarizer angle is commonly observed.

