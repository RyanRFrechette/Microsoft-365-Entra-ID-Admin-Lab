#Requires -Version 5.1
<#
.SYNOPSIS
    Saves the newest screenshot, displays it in README.md, commits, and pushes.

.DESCRIPTION
    HR-friendly screenshot workflow for the Microsoft 365 / Entra ID Admin Lab.
    Use after taking a ShareX screenshot.

.EXAMPLE
    .\scripts\Add-HRProofScreenshot.ps1 -Area users -Name 01-active-users-list -Title "Active Users List" -Completed "Opened the Microsoft 365 active users page." -Proves "Can navigate user administration in Microsoft 365."
#>
param(
    [Parameter(Mandatory)][ValidateSet('setup','users','groups','security','powershell','tickets')]
    [string]$Area,

    [Parameter(Mandatory)][string]$Name,

    [Parameter(Mandatory)][string]$Title,

    [Parameter(Mandatory)][string]$Completed,

    [Parameter(Mandatory)][string]$Proves,

    [string]$Message,

    [switch]$NoPush
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$RepoRoot = Split-Path $PSScriptRoot -Parent
$ReadmePath = Join-Path $RepoRoot 'README.md'

$SearchDirs = @(
    "$HOME\Pictures",
    "$HOME\OneDrive\Documents\ShareX\Screenshots",
    "$HOME\Desktop",
    "$HOME\Downloads",
    "$HOME\Documents"
)

$Newest = $SearchDirs |
    Where-Object { Test-Path $_ } |
    ForEach-Object { Get-ChildItem -Path $_ -Recurse -Include '*.png','*.jpg','*.jpeg' -File -ErrorAction SilentlyContinue } |
    Where-Object { $_.FullName -notlike "$RepoRoot*" } |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

if (-not $Newest) {
    Write-Error 'No screenshots found outside this repo in the usual screenshot folders.'
}

$DestDir = Join-Path $RepoRoot "screenshots\$Area"
$DestFile = Join-Path $DestDir "$Name.png"
$RepoImagePath = "screenshots/$Area/$Name.png"

if (-not (Test-Path $DestDir)) {
    New-Item -ItemType Directory -Force -Path $DestDir | Out-Null
}

Copy-Item -Path $Newest.FullName -Destination $DestFile -Force

$Readme = Get-Content -Path $ReadmePath -Raw

if ($Readme -notmatch [regex]::Escape($RepoImagePath)) {
    $ExistingNumbers = [regex]::Matches($Readme, '(?m)^### \d+\. ')
    $NextNumber = $ExistingNumbers.Count + 1
    $SafeAlt = ($Title -replace '"','')

    $Block = @"
### $NextNumber. $Title

<p>
<img src="$RepoImagePath" height="80%" width="80%" alt="$SafeAlt"/>
</p>

**What was completed:**  
$Completed

**What this proves:**  
$Proves

"@

    $Pattern = '(?s)---\r?\n\r?\n## Planned Build Steps'
    if ($Readme -notmatch $Pattern) {
        Write-Error 'Could not find the README insertion point before "## Planned Build Steps".'
    }

    $Replacement = $Block + "`r`n---`r`n`r`n## Planned Build Steps"
    $Readme = [regex]::Replace($Readme, $Pattern, $Replacement, 1)
    Set-Content -Path $ReadmePath -Value $Readme
}
else {
    Write-Host "README already contains $RepoImagePath; not adding duplicate section."
}

if ([string]::IsNullOrWhiteSpace($Message)) {
    $Message = "docs: add $Title screenshot"
}

Push-Location $RepoRoot
try {
    git add $RepoImagePath README.md
    git diff --cached --quiet
    if ($LASTEXITCODE -eq 0) {
        Write-Host 'No staged changes to commit.'
    }
    else {
        $CommitOut = git commit -m $Message 2>&1
        Write-Host "Commit : $CommitOut"

        if (-not $NoPush) {
            $PushOut = cmd /c "git push origin master 2>&1"
            Write-Host "Push   : $PushOut"
        }
    }

    Write-Host "Source : $($Newest.FullName)"
    Write-Host "Dest   : $DestFile"
    Write-Host "README : updated with $Title"
    Write-Host "Status :"
    git status --short
}
finally {
    Pop-Location
}
