# Full layout: pull LFS -> holoscopic videos -> reorganize -> stage -> optional commit/push
# Usage:
#   .\scripts\apply-repo-layout.ps1
#   .\scripts\apply-repo-layout.ps1 -Commit
#   .\scripts\apply-repo-layout.ps1 -Commit -Push

[CmdletBinding()]
param(
    [switch]$Commit,
    [switch]$Push,
    [switch]$SkipPull
)

$ErrorActionPreference = "Stop"
. "$PSScriptRoot\lib\Git-Repo.ps1"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Set-Location $root

function Get-Porcelain {
    param([string]$Root)
    $git = Find-GitExe
    return (& $git -C $Root status --porcelain) | Where-Object { $_ }
}

Write-Host "=== serpentine-optical-interferometer layout ===" -ForegroundColor Cyan
Write-Host "Root: $root"

if (-not $SkipPull) {
    Invoke-Git -WorkDir $root -Args @("pull", "--ff-only")
    Ensure-GitLfs -Root $root
    Invoke-Git -WorkDir $root -Args @("lfs", "pull")
}

# --- Pass 1: holoscopic videos ---
& "$PSScriptRoot\fix-20260513-video.ps1"

if ($Commit) {
    Invoke-Git -WorkDir $root -Args @("add", "-A")
    if (Get-Porcelain -Root $root) {
        Invoke-Git -WorkDir $root -Args @(
            "commit", "-m", "media(holoscopic): move Video 1 and Video 2 under media/holoscopic-boundary/videos"
        )
    }
}

# --- Pass 2: remaining media + archive ---
& "$PSScriptRoot\reorganize-repo.ps1"

if ($Commit) {
    Invoke-Git -WorkDir $root -Args @("add", "-A")
}

Write-Host ""
Invoke-Git -WorkDir $root -Args @("status")

if ($Commit -and (Get-Porcelain -Root $root)) {
    $msg = @"
chore(repo): reorganize root media, docs, and archive legacy notes

- Move holoscopic stills and z-rotation photos/videos into media/
- Move manuscripts into docs/manuscripts/
- Archive legacy root READme fragments under docs/archive/legacy-root/
- Archive mp4-1 text stub; Video 1 is 20260513_194532.mp4
"@
    Invoke-Git -WorkDir $root -Args @("commit", "-m", $msg)
}

if ($Commit) {
    Invoke-Git -WorkDir $root -Args @("status")
}

if ($Push) {
    Invoke-Git -WorkDir $root -Args @("push", "origin", "HEAD")
}

Write-Host ""
if (-not $Commit) {
    Write-Host "Staged/unstaged changes shown above." -ForegroundColor Yellow
    Write-Host "Commit:  .\scripts\apply-repo-layout.ps1 -Commit"
    Write-Host "Push:    .\scripts\apply-repo-layout.ps1 -Commit -Push"
} else {
    Write-Host "Ready to push: git push origin main" -ForegroundColor Green
}
