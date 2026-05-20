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
$env:GIT_EXECUTABLE = "C:\Users\Administrator\AppData\Local\GitHubDesktop\app-3.5.8\resources\app\git\cmd\git.exe"
.\scripts\apply-repo-layout.ps1 -Commit -Push
```

Or step by step:

```powershell
git pull
.\scripts\fix-20260513-video.ps1
.\scripts\reorganize-repo.ps1
git add -A
git commit -m "chore(repo): organize holoscopic videos and manuscripts"
git push
```

## Folder index (after reorganize)

| Path | Clips |
|------|-------|
| `media/holoscopic-boundary/videos/` | Video 1 & 2 (2026-05-13) |
| `media/holoscopic-boundary/videos/sessions/20260517/` | 29× 720p session files |
| `media/holoscopic-boundary/videos/curated/key/` | `Key_Video*` recommended set |
| `media/holoscopic-boundary/videos/uv-contrast/` | UV / Mobius / fringe suppression |
| `media/holoscopic-boundary/videos/showcase/` | `Video3`–`Video5` overview |
