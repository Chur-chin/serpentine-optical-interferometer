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

Write-Host ""
Write-Host "Reorganization pass complete. Run: git add -A && git status" -ForegroundColor Yellow
