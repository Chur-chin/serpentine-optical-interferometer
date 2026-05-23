# Serpentine Optical Interferometer — Research Repository

**Author:** Chur Chin (Busan, Republic of Korea)  
**Repository:** [github.com/Chur-chin/serpentine-optical-interferometer](https://github.com/Chur-chin/serpentine-optical-interferometer)

This repository documents three coupled experimental threads: **holoscopic boundary** near-field interference, **laser diffraction with Z-axis rotation**, and the **serpentine laser array** (1×1 → planned 6×8) polarization-controlled discrete mode study. All video assets are versioned in Git (Git LFS for large binaries). **No experiment video is deleted during reorganization** — files are relocated with `git mv` only.

---

## Executive summary

A **1×1 serpentine** red-laser array on a diffuse LED panel exhibits **localized discrete mode switching** rather than lattice-wide propagation. Across **22 curated trials** (Sessions 1–5), the primary control variable for dot versus streak output is **input polarizer orientation** (orthogonal → discrete satellites; diamond/45° → pure streaks). **Session 6 (2026-05-22)** adds five repeat-validation clips confirming reproducibility under fixed polarizer conditions. **Session 7 (2026-05-23)** completes the repeat campaign with **15 privacy-film clips** at three orientations (0°, rhombus, 180°), demonstrating superior discrete mode-locking compared to standard polarizing film in honeycomb geometry. Large-array **6×8 collective propagation** remains the next experimental milestone.

---

## Repository layout

```
├── README.md                          # This file
├── docs/
│   ├── holoscopic-boundary/           # Near-field interference notes
│   ├── laser-diffraction-z-rotation/
│   ├── serpentine-interferometer/     # CAD / bench / notebook
│   ├── serpentine-laser-array/        # 1×1 array study + privacy-film notes
│   └── manuscripts/                   # Word drafts
├── media/                             # Photos and videos (LFS)
│   ├── holoscopic-boundary/
│   ├── laser-diffraction-z-rotation/
│   ├── serpentine-interferometer/
│   └── serpentine-laser-array/        # Trials 01–22 + session folders
├── data/
│   └── serpentine-laser-array/experiment-summary.csv
└── scripts/
    ├── reorganize-repo.ps1            # git mv layout (no video deletion)
    ├── apply-repo-layout.ps1
    └── finalize-and-push.ps1          # pull LFS → reorganize → commit → push
```

| Thread | Documentation | Media |
|--------|---------------|-------|
| Holoscopic boundary | [`docs/holoscopic-boundary/`](docs/holoscopic-boundary/) | [`media/holoscopic-boundary/`](media/holoscopic-boundary/) |
| Z-axis laser diffraction | [`docs/laser-diffraction-z-rotation/`](docs/laser-diffraction-z-rotation/) | [`media/laser-diffraction-z-rotation/`](media/laser-diffraction-z-rotation/) |
| Serpentine interferometer (CAD) | [`docs/serpentine-interferometer/`](docs/serpentine-interferometer/) | [`media/serpentine-interferometer/`](media/serpentine-interferometer/) |
| **Serpentine laser array (1×1)** | [`docs/serpentine-laser-array/`](docs/serpentine-laser-array/) | [`media/serpentine-laser-array/`](media/serpentine-laser-array/) |

**Maintenance:** from the repo root:

```powershell
.\scripts\finalize-and-push.ps1          # full cleanup + push (GitHub Desktop git)
.\scripts\reorganize-repo.ps1            # layout only (git mv)
git lfs install && git lfs pull          # restore large binaries on fresh clone
```

---

## Experiment data summary — serpentine laser array

Machine-readable table: [`data/serpentine-laser-array/experiment-summary.csv`](data/serpentine-laser-array/experiment-summary.csv)

| Session | Date | Videos | *n* | Primary control | Key outcome |
|---------|------|--------|-----|-----------------|-------------|
| 1 | 2026-05 | 01–06 | 6 | White LED, no polarizer | Single dot → cluster → arc → vertical streaks |
| 2 | 2026-05 | 07–10 | 4 | Dark field / UV | Discrete dots confirmed; UV isolates red channel |
| 3 | 2026-05 | 11–15 | 5 | Black paper | Fringe suppression independent of surface |
| 4 | 2026-05 | 16–20 | 5 | Orthogonal input polarizer | **Discrete modes in 1×1** — polarization, not array size |
| 5 | 2026-05 | 21–22 | 2 | Diamond input; output analyzer | Streak mode vs dot mode; extinction/recovery |
| 6 | 2026-05-22 | 20260522 session | 5 | Repeat validation (fixed setup) | Reproducibility across back-to-back runs |
| **7** | **2026-05-23** | **privacy-film 0° / rhombus / 180°** | **15** | **Privacy film vs polarizer** | **Superior discrete mode-locking at all three angles** |

Curated videos: `media/serpentine-laser-array/videos/`  
Session folders: [`20260522/`](media/serpentine-laser-array/videos/sessions/20260522/) · [`20260523/privacy-film/`](media/serpentine-laser-array/videos/sessions/20260523/)

---

## Serpentine laser array — overview grid (Session 1)

![6×8 frame grid](media/serpentine-laser-array/images/led_panel_6x8_grid.jpg)

*Columns = videos 01–06 · Rows = evenly sampled time steps (add `led_panel_6x8_grid.jpg` under `media/serpentine-laser-array/images/` if missing locally).*

---

## Video captions (curated trials 01–22)

Paths below are under `media/serpentine-laser-array/videos/`.

### Session 1 — White LED panel, no polarizer (01–06)

| File | Duration | Description |
|------|----------|-------------|
| `01_baseline_single_dot.mp4` | ~48 s | **Baseline — single localized mode.** One stationary dot at lower-center. Reference for isolated mode behavior. |
| `02_dot_appears_bottom.mp4` | ~48 s | **Mode re-entry at edge.** Dot reappears at bottom edge with slight drift. |
| `03_dots_cluster_scatter.mp4` | ~47 s | **Discrete satellite cluster onset.** Multiple dots in a loose cluster — local, not collective. |
| `04_dots_arc_pattern.mp4` | ~43 s | **Angular preference emerging.** Curved arc — serpentine geometry influences path selection. |
| `05_streaks_vertical.mp4` | ~35 s | **Fringe → streak transition.** Vertical streak elongation along one axis. |
| `06_streaks_full_panel.mp4` | ~34 s | **Broadest local extent** in current 1×1 configuration. |

### Session 2 — Dark background / UV suppression (07–10)

| File | Duration | Description |
|------|----------|-------------|
| `07_discrete_cluster_dark.mp4` | ~41 s | **Discrete cluster — dark field.** Isolated point emitters; non-circular asymmetry. |
| `08_cluster_to_streaks_dark.mp4` | ~33 s | **Cluster → streaks (dark).** Same preferred axes as Session 1. |
| `09_scattered_dots_dark.mp4` | ~38 s | **Wide-field discrete scatter.** Localized mode jumping, not blur merge. |
| `10_uv_suppression_red_on_blue.mp4` | ~36 s | **UV suppression.** Red satellites visible on violet UV background. |

### Session 3 — Black paper backup (11–15)

| File | Duration | Description |
|------|----------|-------------|
| `11_blackpaper_single_streak_onset.mp4` | ~40 s | Streak onset on black paper. |
| `12_blackpaper_fringe_suppressed_dot.mp4` | ~34 s | Fringe lines suppressed; single dot remains. |
| `13_blackpaper_satellite_cluster_cross.mp4` | ~35 s | Cross/plus satellite geometry. |
| `14_blackpaper_fringe_null_dark.mp4` | ~31 s | Near-complete fringe null. |
| `15_blackpaper_wide_discrete_scatter.mp4` | ~28 s | Wide arc of point-like satellites. |

### Session 4 — Orthogonal polarizer at input (16–20)

> **Key finding:** discrete satellites in **1×1** with orthogonal input polarizer — array size is not the primary driver.

| File | Duration | Description |
|------|----------|-------------|
| `16_polarizer_orthogonal_single_dot.mp4` | ~29 s | Orthogonal baseline — single dot, short vertical streak. |
| `17_polarizer_orthogonal_fringe_null.mp4` | ~26 s | Fringe fully nulled. |
| `18_polarizer_orthogonal_dot_stable.mp4` | ~27 s | Stable isolated dot for full trial. |
| `19_polarizer_orthogonal_discrete_onset.mp4` | ~22 s | Discrete satellite onset in 1×1. |
| `20_polarizer_orthogonal_discrete_confirmed.mp4` | ~24 s | Discrete mode confirmed — geometry-independent. |

### Session 5 — Diamond input / output analyzer (21–22)

| File | Duration | Description |
|------|----------|-------------|
| `21_polarizer_diamond_input_streak_mode.mp4` | ~6 s | **Diamond (45°) input — pure streak mode.** |
| `22_polarizer_output_rotation_streak_suppress_recover.mp4` | ~30 s | Output rotation → extinction then recovery; polarized streak output. |

### Session 6 — Repeat validation (2026-05-22)

Five clips in `media/serpentine-laser-array/videos/sessions/20260522/` (export IDs preserved). See [`docs/serpentine-laser-array/README.md`](docs/serpentine-laser-array/README.md).

### Session 7 — Privacy-film repeat validation (2026-05-23)

Fifteen clips in `media/serpentine-laser-array/videos/sessions/20260523/privacy-film/` organized as:

| Subfolder | Files | Finding |
|-----------|-------|---------|
| `0deg/` | `privacy_film_0deg_v1..v5.mp4` | Extremely static single-dot mode-locking; brief v3 cluster then recovery |
| `rhombus/` | `privacy_film_rhombus_v1..v5.mp4` | Sharp discrete dots with minimal diffusion vs polarizing film |
| `180deg/` | `privacy_film_180deg_v1..v5.mp4` | Highly stable discrete patterns at 180° |

Notes: [`docs/serpentine-laser-array/privacy-film/`](docs/serpentine-laser-array/privacy-film/) · Session index: [`media/.../20260523/README.md`](media/serpentine-laser-array/videos/sessions/20260523/README.md)

---

## Technical notes

| Parameter | Value |
|-----------|--------|
| Camera | 1920×1080 @ ~30 fps (original) |
| Panel | Diffuse white LED / acrylic diffuser; black-paper and dark-field variants |
| Laser | Red ~650 nm, single-point source |
| Films tested | Standard polarizing film; privacy protection film (사생활보호필름) |
| GitHub export | 960×540, H.264 CRF 28, 15 fps (target &lt;2 MB/file where compressed) |

---

## Analysis and conclusions

The 1×1 serpentine behaves as **localized mode switching**: short coupling paths and edge-dominated dynamics produce **discrete state jumps** rather than continuous lattice flow. Satellite clusters show **non-circular angular preference**, consistent with geometry-assisted optical path selection.

| Item | Status |
|------|--------|
| Fringe → discrete satellite transition | Partially observed ✅ |
| Localized (non-collective) behavior | Confirmed ✅ |
| Dark-field discreteness | Confirmed ✅ |
| Surface-independent fringe suppression | Confirmed ✅ |
| Orthogonal polarizer → discrete 1×1 modes | **Confirmed ✅** |
| Diamond input → streak-only mode | Confirmed ✅ |
| Output analyzer extinction/recovery | Confirmed ✅ |
| Repeat validation — polarizer (Session 6) | **Recorded ✅** |
| Repeat validation — privacy film (Session 7) | **Recorded ✅** |
| Privacy film superior mode-lock (0° / rhombus / 180°) | **Confirmed ✅** |
| 6×8 collective propagation | Pending ❌ |

**Conclusion:** Input film type and polarizer orientation are the primary mode selectors. Privacy protection film yields **sharper, more stable discrete dots** in honeycomb geometry across 0°, rhombus, and 180° orientations. Standard polarizing film remains preferable for open serpentine structures. **6×8 expansion** is required for large-scale collective effects. Supplementary Savart-plate discussion: [`docs/serpentine-laser-array/polarizer-input-90deg-notes.pdf`](docs/serpentine-laser-array/polarizer-input-90deg-notes.pdf).

---

## Why 0° vs 90° input polarizer produces different modes

A Savart plate’s fast/slow axes interact with input polarization angle. Near **90°**, o- and e-ray amplitudes tend toward balance and **streak/fringe** character strengthens; near **0°**, **discrete dot** character is relatively preserved. This matches the orthogonal (Session 4) versus diamond streak (Session 5) dichotomy in the curated trials. Privacy film (Session 7) suppresses diffuse spreading, further stabilizing discrete dots at all tested angles.

---

## License

See [`License`](License).
