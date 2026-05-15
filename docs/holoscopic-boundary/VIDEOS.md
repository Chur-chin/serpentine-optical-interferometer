# Holoscopic videos

## Video 1 — Double spot blinking

| | |
|---|---|
| **File** | `media/holoscopic-boundary/videos/20260513_194532.mp4` |
| **Recorded** | 2026-05-13 19:45:32 |
| **GitHub (after move)** | [View / download](https://github.com/Chur-chin/serpentine-optical-interferometer/blob/main/media/holoscopic-boundary/videos/20260513_194532.mp4) |
| **Replaces** | `mp4-1.mp4` (was a text stub, not playable) |

**Setup:** Shake an extra polarizing film in front of the output assembly; a second circular spot blinks on and off.

## Video 2 — Internal interference dynamics

| | |
|---|---|
| **File** | `media/holoscopic-boundary/videos/circular_interference.mp4` |
| **Source upload** | `mp4-2.mp4` at repository root |

**Setup:** Output position near 0°; small nail-clipper movements evolve the pattern inside the main spot.

## Apply folder layout locally

```powershell
git pull
.\scripts\fix-20260513-video.ps1
git commit -am "Holoscopic Video 1: move 20260513_194532.mp4 into media/"
git push
```
