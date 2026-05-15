# Holoscopic Video 1 + Video 2: git mv into media/holoscopic-boundary/videos/
# Safe to re-run. Preserves Git LFS tracking (content unchanged, path only).

$ErrorActionPreference = "Stop"
. "$PSScriptRoot\lib\Git-Repo.ps1"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Set-Location $root
Write-Host "Repository: $root" -ForegroundColor Green

Ensure-GitLfs -Root $root

$dstDir = "media/holoscopic-boundary/videos"
Ensure-Dir (Join-Path $root $dstDir)

# Video 1 — double spot (2026-05-13 upload)
Git-MvIfExists -Root $root `
    -SrcRel "20260513_194532.mp4" `
    -DstRel "$dstDir/20260513_194532.mp4" | Out-Null

# Video 2 — internal interference (from mp4-2.mp4)
Git-MvIfExists -Root $root `
    -SrcRel "mp4-2.mp4" `
    -DstRel "$dstDir/circular_interference.mp4" | Out-Null

$v1 = Join-Path $root "$dstDir/20260513_194532.mp4"
$v2 = Join-Path $root "$dstDir/circular_interference.mp4"
if (-not (Test-Path -LiteralPath $v1)) {
    Write-Warning "Video 1 not found at $v1 — run: git pull && git lfs pull"
}
if (-not (Test-Path -LiteralPath $v2)) {
    Write-Warning "Video 2 not found at $v2 — ensure mp4-2.mp4 exists at root or was already moved."
}

Write-Host ""
Write-Host "Holoscopic videos ready. Next:" -ForegroundColor Yellow
Write-Host "  .\scripts\reorganize-repo.ps1"
Write-Host "  git add -A"
Write-Host "  git status"
