# Serpentine Laser Array — 1×1 Polarization Study

Discrete-mode switching on a diffuse LED panel with a **1×1 serpentine** geometry. Curated trials use descriptive filenames (`NN_condition_phenomenon.mp4`). Raw repeat-validation clips from **2026-05-22** keep camera export IDs under `media/serpentine-laser-array/videos/sessions/20260522/`. **2026-05-23** privacy-film repeat clips are under `media/serpentine-laser-array/videos/sessions/20260523/privacy-film/`.

## Media paths

| Content | Path |
|---------|------|
| Trials 01–22 | [`media/serpentine-laser-array/videos/`](../../media/serpentine-laser-array/videos/) |
| Repeat session 2026-05-22 | [`media/serpentine-laser-array/videos/sessions/20260522/`](../../media/serpentine-laser-array/videos/sessions/20260522/) |
| Privacy-film session 2026-05-23 | [`media/serpentine-laser-array/videos/sessions/20260523/`](../../media/serpentine-laser-array/videos/sessions/20260523/) |
| Overview grid (if present) | [`media/serpentine-laser-array/images/led_panel_6x8_grid.jpg`](../../media/serpentine-laser-array/images/led_panel_6x8_grid.jpg) |
| Input polarizer notes (90°) | [polarizer-input-90deg-notes.pdf](polarizer-input-90deg-notes.pdf) |
| Privacy-film notes | [privacy-film/](privacy-film/) |

## Session 6 — Repeat validation (2026-05-22)

Five consecutive recordings under fixed conditions to confirm reproducibility of the polarization-controlled mode behavior documented in Sessions 1–5.

| File | Local time (from filename) | Role |
|------|----------------------------|------|
| `20260522-210257_TzfilD67.mp4` | 21:02:57 | Repeat run 1 |
| `20260522-210325_xISkwfLz.mp4` | 21:03:25 | Repeat run 2 |
| `20260522-210401_6e2gcJpF.mp4` | 21:04:01 | Repeat run 3 |
| `20260522-210430_oV0fbIvo.mp4` | 21:04:30 | Repeat run 4 |
| `20260522-210454_HpUhZoGW.mp4` | 21:04:54 | Repeat run 5 |

All clips are retained in Git (LFS). Reorganize with `scripts/reorganize-repo.ps1` (`git mv` only).

## Session 7 — Privacy-film repeat validation (2026-05-23)

Fifteen recordings using **privacy protection film (사생활보호필름)** at three orientations. Files are renamed from camera exports to descriptive names (original timestamps preserved in session README).

| Subfolder | Files | Role |
|-----------|-------|------|
| `privacy-film/0deg/` | `privacy_film_0deg_v1..v5.mp4` | 0° — static single-dot mode-locking |
| `privacy-film/rhombus/` | `privacy_film_rhombus_v1..v5.mp4` | Rhombus — sharp discrete dots |
| `privacy-film/180deg/` | `privacy_film_180deg_v1..v5.mp4` | 180° — stable discrete patterns |

Observations: [privacy-film/0deg-notes.md](privacy-film/0deg-notes.md) · [rhombus-notes.md](privacy-film/rhombus-notes.md) · [180deg-notes.md](privacy-film/180deg-notes.md)

## Manuscripts

Related Word drafts: [`../manuscripts/`](../manuscripts/) (`1x1 honeycomb.docx`, `Serpentine Moire.docx`, etc.).
