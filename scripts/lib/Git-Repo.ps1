# Shared helpers for repository maintenance scripts.

function Find-GitExe {
    if ($env:GIT_EXECUTABLE -and (Test-Path -LiteralPath $env:GIT_EXECUTABLE)) {
        return $env:GIT_EXECUTABLE
    }
    $cmd = Get-Command git -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }

    $candidates = @(
        "${env:ProgramFiles}\Git\cmd\git.exe",
        "${env:ProgramFiles}\Git\bin\git.exe",
        "${env:ProgramFiles(x86)}\Git\cmd\git.exe",
        "${env:LocalAppData}\Programs\Git\cmd\git.exe"
    )
    foreach ($p in $candidates) {
        if ($p -and (Test-Path -LiteralPath $p)) { return $p }
    }
    throw "git.exe not found. Install Git for Windows or set `$env:GIT_EXECUTABLE."
}

function Invoke-Git {
    param(
        [Parameter(Mandatory)][string[]]$Args,
        [string]$WorkDir
    )
    $git = Find-GitExe
    $argList = $Args
    Write-Host "git $($argList -join ' ')" -ForegroundColor DarkCyan
    if ($WorkDir) {
        & $git -C $WorkDir @argList
    } else {
        & $git @argList
    }
    if ($LASTEXITCODE -ne 0) {
        throw "git failed (exit $LASTEXITCODE): git $($argList -join ' ')"
    }
}

function Ensure-GitLfs {
    param([string]$Root)
    try {
        Invoke-Git -WorkDir $Root -Args @("lfs", "version")
    } catch {
        Write-Warning "Git LFS not available; large files may commit without LFS pointers."
        return
    }
    Invoke-Git -WorkDir $Root -Args @("lfs", "install", "--local")
}

function Ensure-Dir {
    param([string]$Path)
    if (-not (Test-Path -LiteralPath $Path)) {
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

function Git-MvIfExists {
    param(
        [string]$Root,
        [string]$SrcRel,
        [string]$DstRel
    )
    $src = Join-Path $Root $SrcRel
    $dst = Join-Path $Root $DstRel
    if (-not (Test-Path -LiteralPath $src)) {
        Write-Host "  skip (missing): $SrcRel"
        return $false
    }
    if (Test-Path -LiteralPath $dst) {
        Write-Host "  skip (exists): $DstRel"
        return $false
    }
    Ensure-Dir (Split-Path $dst -Parent)
    Invoke-Git -WorkDir $Root -Args @("mv", "--", $SrcRel, $DstRel)
    Write-Host "  moved: $SrcRel -> $DstRel"
    return $true
}
