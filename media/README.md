# Media layout

All photos and videos stay in Git — nothing is deleted during reorganization. Run `scripts/reorganize-repo.ps1` from the repository root to move files here with `git mv` (history preserved).

```
media/
├── holoscopic-boundary/
│   ├── images/raw/              # 20260513_*.jpg (full set)
│   ├── images/input_position/   # optional representative picks
│   ├── images/output_position/
│   └── videos/
│       ├── 20260513_194532.mp4  # Video 1 — double spot
│       ├── circular_interference.mp4  # Video 2 (from mp4-2.mp4)
│       ├── sessions/20260517/   # timestamped 720p session clips
│       ├── curated/             # Key / Final / Final2 / Finale edits
│       ├── uv-contrast/         # UV vs pol-film vs black-paper
│       ├── uv-distance/         # UV at 25 cm / 50 cm
│       ├── showcase/            # Video3–5 overview clips
│       └── archive/
│           └── duplicates/      # byte-identical copies (never deleted)
├── laser-diffraction-z-rotation/
│   ├── photos/                  # 20260515_203*.jpg
│   └── videos/                  # 20260515–16 clips + Video7_ZAxisRotation
└── serpentine-interferometer/
    └── images/
        ├── cad/                 # ray diagram, CAD renders
        ├── notebook/
        └── bench/
```

## Restoring videos on a fresh clone

```powershell
git lfs install
git lfs pull
```

**Video 1** is `20260513_194532.mp4` (uploaded to replace the old `mp4-1.mp4` text stub). Run `scripts/fix-20260513-video.ps1` to move it from the repo root into `media/holoscopic-boundary/videos/`.
