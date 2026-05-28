#Requires -Version 5.1
<#
.SYNOPSIS
    Saves the newest screenshot on this PC into the correct repo folder, commits, and pushes.
.EXAMPLE
    .\Save-LabScreenshot.ps1 -Area setup -Name 01-admin-center-home -Message "docs: add admin center screenshot"
    .\Save-LabScreenshot.ps1 -Area users -Name 02-new-user -Message "docs: add user screenshot" -NoCommit
#>
param(
    [Parameter(Mandatory)][ValidateSet('setup','users','groups','security','powershell','tickets')]
    [string]$Area,

    [Parameter(Mandatory)][string]$Name,

    [Parameter(Mandatory)][string]$Message,

    [switch]$NoCommit
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Resolve repo root (script lives in scripts/)
$RepoRoot = Split-Path $PSScriptRoot -Parent

$SearchDirs = @(
    "$HOME\Pictures",
    "$HOME\OneDrive\Documents\ShareX\Screenshots",
    "$HOME\Desktop",
    "$HOME\Downloads",
    "$HOME\Documents"
)

# Find newest screenshot not already inside this repo
$Newest = $SearchDirs |
    Where-Object { Test-Path $_ } |
    ForEach-Object { Get-ChildItem -Path $_ -Recurse -Include '*.png','*.jpg','*.jpeg' -File -ErrorAction SilentlyContinue } |
    Where-Object { $_.FullName -notlike "$RepoRoot*" } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

if (-not $Newest) {
    Write-Error "No screenshots found outside this repo in the search paths."
}

$DestDir  = Join-Path $RepoRoot "screenshots\$Area"
$DestFile = Join-Path $DestDir  "$Name.png"

if (-not (Test-Path $DestDir)) {
    New-Item -ItemType Directory -Force $DestDir | Out-Null
    Write-Host "Created $DestDir"
}

Copy-Item -Path $Newest.FullName -Destination $DestFile -Force
Write-Host "Source : $($Newest.FullName)"
Write-Host "Dest   : $DestFile"

Push-Location $RepoRoot
try {
    git add "screenshots/$Area/$Name.png"

    if ($NoCommit) {
        Write-Host "Skipped commit (-NoCommit)"
    } else {
        $commitOut = git commit -m $Message 2>&1
        Write-Host "Commit : $commitOut"

        $pushOut = cmd /c "git push origin master 2>&1"
        Write-Host "Push   : $pushOut"
    }

    Write-Host "`nStatus:"
    git status --short
} finally {
    Pop-Location
}

