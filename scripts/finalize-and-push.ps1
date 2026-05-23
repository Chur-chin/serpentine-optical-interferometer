# Final repository cleanup: pull LFS -> reorganize -> commit -> push (GitHub Desktop git)
# Usage: .\scripts\finalize-and-push.ps1

[CmdletBinding()]
param(
    [switch]$SkipPull,
    [string]$CommitMessage
)

$ErrorActionPreference = "Stop"
. "$PSScriptRoot\lib\Git-Repo.ps1"

$root = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
Set-Location $root

Write-Host "=== finalize-and-push ===" -ForegroundColor Cyan
Write-Host "Root: $root"
Write-Host "Git:  $(Find-GitExe)"

if (-not $SkipPull) {
    Invoke-Git -WorkDir $root -Args @("pull", "--ff-only", "origin", "main")
    Ensure-GitLfs -Root $root
    Invoke-Git -WorkDir $root -Args @("lfs", "pull")
}

& "$PSScriptRoot\reorganize-repo.ps1"

Invoke-Git -WorkDir $root -Args @("add", "-A")
Invoke-Git -WorkDir $root -Args @("status")

$porcelain = (& (Find-GitExe) -C $root status --porcelain) | Where-Object { $_ }
if (-not $porcelain) {
    Write-Host "Nothing to commit — repository is clean." -ForegroundColor Green
} else {
    if (-not $CommitMessage) {
        $CommitMessage = @"
chore(repo): final layout — Session 7 privacy-film repeat (2026-05-23)

- Move 15 root 20260523 clips into media/serpentine-laser-array/videos/sessions/20260523/privacy-film/
- Rename to privacy_film_{0deg,rhombus,180deg}_vN.mp4 (git mv only; no video deletion)
- Relocate READme-privacy* notes to docs/serpentine-laser-array/privacy-film/
- Update README, experiment summary CSV, and session documentation
"@
    }
    Invoke-Git -WorkDir $root -Args @("commit", "-m", $CommitMessage)
}

$hash = (& (Find-GitExe) -C $root rev-parse HEAD) | Select-Object -First 1
Write-Host "HEAD: $hash" -ForegroundColor Green

Invoke-Git -WorkDir $root -Args @("push", "origin", "main")
Invoke-Git -WorkDir $root -Args @("status", "-sb")

Write-Host ""
Write-Host "Done. Commit: $hash" -ForegroundColor Green
