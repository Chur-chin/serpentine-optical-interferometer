# Reorganize root media and archive legacy root notes. Uses git mv only (no deletions).

$ErrorActionPreference = "Stop"
. "$PSScriptRoot\lib\Git-Repo.ps1"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Set-Location $root
Write-Host "Repository: $root" -ForegroundColor Green

Ensure-GitLfs -Root $root

$dirs = @(
    "docs/manuscripts",
    "docs/archive/legacy-root",
    "media/holoscopic-boundary/images/raw",
    "media/holoscopic-boundary/images/input_position",
    "media/holoscopic-boundary/images/output_position",
    "media/holoscopic-boundary/videos/archive",
    "media/holoscopic-boundary/videos/archive/duplicates",
    "media/holoscopic-boundary/videos/sessions/20260517",
    "media/holoscopic-boundary/videos/curated/key",
    "media/holoscopic-boundary/videos/curated/final",
    "media/holoscopic-boundary/videos/curated/final2",
    "media/holoscopic-boundary/videos/curated/finale",
    "media/holoscopic-boundary/videos/uv-contrast",
    "media/holoscopic-boundary/videos/uv-distance",
    "media/holoscopic-boundary/videos/showcase",
    "media/laser-diffraction-z-rotation/photos",
    "media/laser-diffraction-z-rotation/videos",
    "media/serpentine-interferometer/images/cad",
    "media/serpentine-interferometer/images/notebook",
    "media/serpentine-interferometer/images/bench"
)
foreach ($d in $dirs) { Ensure-Dir (Join-Path $root $d) }

# Manuscripts
Get-ChildItem -Path $root -Filter "*.docx" -File -ErrorAction SilentlyContinue | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_.Name -DstRel "docs/manuscripts/$($_.Name)" | Out-Null
}
Git-MvIfExists -Root $root `
    -SrcRel "Interference Colors, Wave-Particle Duality, and Analogy to Graphene Moiré Physics" `
    -DstRel "docs/manuscripts/interference-colors-graphene-moire-overview.md" | Out-Null

# Holoscopic stills
Get-ChildItem -Path $root -Filter "20260513_*.jpg" -File -ErrorAction SilentlyContinue | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_.Name -DstRel "media/holoscopic-boundary/images/raw/$($_.Name)" | Out-Null
}

# Z-rotation photos
Get-ChildItem -Path $root -Filter "20260515_203*.jpg" -File -ErrorAction SilentlyContinue | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_.Name -DstRel "media/laser-diffraction-z-rotation/photos/$($_.Name)" | Out-Null
}

# Z-rotation videos (all kept)
@(
    "20260515_192723.mp4",
    "20260515_192803.mp4",
    "20260515_192843.mp4",
    "20260515_194504.mp4",
    "20260515_194553.mp4",
    "20260515_195645.mp4",
    "20260515_195721.mp4"
) | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_ -DstRel "media/laser-diffraction-z-rotation/videos/$_" | Out-Null
}
Git-MvIfExists -Root $root `
    -SrcRel "20260515_192921 (1).mp4" `
    -DstRel "media/laser-diffraction-z-rotation/videos/20260515_192921.mp4" | Out-Null

# Holoscopic videos (idempotent with fix-20260513-video.ps1)
Git-MvIfExists -Root $root `
    -SrcRel "20260513_194532.mp4" `
    -DstRel "media/holoscopic-boundary/videos/20260513_194532.mp4" | Out-Null
Git-MvIfExists -Root $root `
    -SrcRel "mp4-2.mp4" `
    -DstRel "media/holoscopic-boundary/videos/circular_interference.mp4" | Out-Null

# mp4-1: text stub vs real video
$mp4one = Join-Path $root "mp4-1.mp4"
if (Test-Path -LiteralPath $mp4one) {
    $len = (Get-Item -LiteralPath $mp4one).Length
    if ($len -gt 100000) {
        Git-MvIfExists -Root $root `
            -SrcRel "mp4-1.mp4" `
            -DstRel "media/holoscopic-boundary/videos/archive/mp4-1-legacy.mp4" | Out-Null
    } else {
        Git-MvIfExists -Root $root `
            -SrcRel "mp4-1.mp4" `
            -DstRel "docs/archive/mp4-1-root-stub.txt" | Out-Null
    }
}

# Legacy root notes -> docs/archive/legacy-root/
@(
    "READme-2",
    "READme-3",
    "Angular Dependence Study",
    "Representative Observations",
    "Recommended Usage in README.md"
) | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_ -DstRel "docs/archive/legacy-root/$_" | Out-Null
}

# May 16 z-rotation session (uploaded to repo root)
Get-ChildItem -Path $root -Filter "20260516_*.mp4" -File -ErrorAction SilentlyContinue |
    Where-Object { $_.Name -ne "20260516_181439_new.mp4" } |
    ForEach-Object {
        Git-MvIfExists -Root $root -SrcRel $_.Name `
            -DstRel "media/laser-diffraction-z-rotation/videos/$($_.Name)" | Out-Null
    }
Git-MvIfExists -Root $root `
    -SrcRel "2026_05_16_20_36.mp4" `
    -DstRel "media/laser-diffraction-z-rotation/videos/2026_05_16_20_36.mp4" | Out-Null

# Duplicate upload (same clip as 20260516_181439.mp4)
$dupNew = Join-Path $root "20260516_181439_new.mp4"
$canonical = Join-Path $root "media/laser-diffraction-z-rotation/videos/20260516_181439.mp4"
if (Test-Path -LiteralPath $dupNew) {
    if (Test-Path -LiteralPath $canonical) {
        Invoke-Git -WorkDir $root -Args @("rm", "-f", "--", "20260516_181439_new.mp4")
        Write-Host "  removed duplicate: 20260516_181439_new.mp4"
    } else {
        Git-MvIfExists -Root $root `
            -SrcRel "20260516_181439_new.mp4" `
            -DstRel "media/laser-diffraction-z-rotation/videos/20260516_181439_new.mp4" | Out-Null
    }
}

# Serpentine CAD images (if present)
@{
    "image 10.jpg" = "media/serpentine-interferometer/images/cad/image-10.jpg"
    "installment.jpg" = "media/serpentine-interferometer/images/notebook/installment.jpg"
    "image 11.jpg" = "media/serpentine-interferometer/images/bench/image-11.jpg"
}.GetEnumerator() | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_.Key -DstRel $_.Value | Out-Null
    $underDocs = Join-Path "docs/images" $_.Key
    if (Test-Path (Join-Path $root $underDocs)) {
        Git-MvIfExists -Root $root -SrcRel $underDocs -DstRel $_.Value | Out-Null
    }
}

Git-MvIfExists -Root $root `
    -SrcRel "serpentine_interferometer_ray_diagram.png" `
    -DstRel "media/serpentine-interferometer/images/cad/serpentine_interferometer_ray_diagram.png" | Out-Null

# 2026-05-17 holoscopic session (timestamped 720p clips)
Get-ChildItem -Path $root -Filter "20260517_*_720p.mp4" -File -ErrorAction SilentlyContinue | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_.Name `
        -DstRel "media/holoscopic-boundary/videos/sessions/20260517/$($_.Name)" | Out-Null
}

# Curated holoscopic sets (edited titles preserved)
@{
    "Key_"   = "media/holoscopic-boundary/videos/curated/key"
    "Final_" = "media/holoscopic-boundary/videos/curated/final"
    "Final2_" = "media/holoscopic-boundary/videos/curated/final2"
    "Finale_" = "media/holoscopic-boundary/videos/curated/finale"
}.GetEnumerator() | ForEach-Object {
    $prefix = $_.Key
    $dstDir = $_.Value
    Get-ChildItem -Path $root -Filter "${prefix}*.mp4" -File -ErrorAction SilentlyContinue | ForEach-Object {
        Git-MvIfExists -Root $root -SrcRel $_.Name -DstRel "$dstDir/$($_.Name)" | Out-Null
    }
}

# UV contrast / Mobius-lock experiments
@(
    "UV_Contrast_Video1_SatelliteFades.mp4",
    "UV_Contrast_Video2_FringeVanish.mp4",
    "UV_Contrast_Video3_BeforeAfterUV.mp4",
    "UV_Contrast_Video4_CentralOnly.mp4",
    "UV_True_Video1_CentralSpotOnly.mp4",
    "UV_True_Video2_MobiusLock.mp4",
    "UV_Video2_NoFringe.mp4",
    "UV_Video3_MobiusEffect.mp4",
    "UV_Video4_TransitionLocked.mp4",
    "UV_Video5_NoTransition.mp4"
) | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_ `
        -DstRel "media/holoscopic-boundary/videos/uv-contrast/$_" | Out-Null
}
Git-MvIfExists -Root $root `
    -SrcRel "UV_Video1_StaticSpot (1).mp4" `
    -DstRel "media/holoscopic-boundary/videos/uv-contrast/UV_Video1_StaticSpot.mp4" | Out-Null

# UV distance sweeps (25 cm / 50 cm)
@(
    "UVdist_Video1_PolFilmOnly_Run1.mp4",
    "UVdist_Video2_UV50cm_Run1.mp4",
    "UVdist_Video3_PolFilmOnly_Run2.mp4",
    "UVdist_Video4_UV50cm_Run2.mp4",
    "UVdist_Video5_UV25cm_then_50cm.mp4",
    "UVdist2_Video1_PolOnly_then_UV50cm.mp4",
    "UVdist2_Video2_PolOnly_then_UV25cm.mp4",
    "UVdist2_Video3_PolOnly_then_UV50cm.mp4",
    "UVdist2_Video4_PolOnly_then_UV25cm.mp4"
) | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_ `
        -DstRel "media/holoscopic-boundary/videos/uv-distance/$_" | Out-Null
}

# README showcase clips (Video 3–6 holoscopic; Video 7 → z-rotation)
@(
    "Video3_BeamSplitPattern.mp4",
    "Video4_FringeTransition.mp4",
    "Video5_SerpentineLoop.mp4"
) | ForEach-Object {
    Git-MvIfExists -Root $root -SrcRel $_ `
        -DstRel "media/holoscopic-boundary/videos/showcase/$_" | Out-Null
}
Git-MvIfExists -Root $root `
    -SrcRel "Video7_ZAxisRotation.mp4" `
    -DstRel "media/laser-diffraction-z-rotation/videos/Video7_ZAxisRotation.mp4" | Out-Null

# Video6 is byte-identical to Video5 — keep in archive/duplicates (never delete)
$v5Root = Join-Path $root "Video5_SerpentineLoop.mp4"
$v6Root = Join-Path $root "Video6_HoloscopicBoundary.mp4"
$v5Showcase = Join-Path $root "media/holoscopic-boundary/videos/showcase/Video5_SerpentineLoop.mp4"
if (Test-Path -LiteralPath $v6Root) {
    if (Test-Path -LiteralPath $v5Showcase) {
        Git-MvIfExists -Root $root `
            -SrcRel "Video6_HoloscopicBoundary.mp4" `
            -DstRel "media/holoscopic-boundary/videos/archive/duplicates/Video6_HoloscopicBoundary.mp4" | Out-Null
    } elseif (Test-Path -LiteralPath $v5Root) {
        Git-MvIfExists -Root $root `
            -SrcRel "Video5_SerpentineLoop.mp4" `
            -DstRel "media/holoscopic-boundary/videos/showcase/Video5_SerpentineLoop.mp4" | Out-Null
        Git-MvIfExists -Root $root `
            -SrcRel "Video6_HoloscopicBoundary.mp4" `
            -DstRel "media/holoscopic-boundary/videos/archive/duplicates/Video6_HoloscopicBoundary.mp4" | Out-Null
    } else {
        Git-MvIfExists -Root $root `
            -SrcRel "Video6_HoloscopicBoundary.mp4" `
            -DstRel "media/holoscopic-boundary/videos/showcase/Video6_HoloscopicBoundary.mp4" | Out-Null
    }
}

Write-Host ""
Write-Host "Reorganization pass complete. Run: git add -A && git status" -ForegroundColor Yellow
