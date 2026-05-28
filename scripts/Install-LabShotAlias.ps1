#Requires -Version 5.1
<#
.SYNOPSIS
    Adds a 'labshot' function to your PowerShell profile so you can run it from anywhere.
    Safe to run more than once — it will not add duplicate entries.
.EXAMPLE
    .\Install-LabShotAlias.ps1
    labshot setup 01-admin-center-home "docs: add admin center screenshot"
#>

$RepoRoot  = Split-Path $PSScriptRoot -Parent
$ScriptPath = Join-Path $RepoRoot 'scripts\Save-LabScreenshot.ps1'

$FunctionBlock = @"

# labshot — Microsoft 365 Entra ID Admin Lab screenshot helper
function labshot {
    param(
        [Parameter(Mandatory)][string]`$Area,
        [Parameter(Mandatory)][string]`$Name,
        [Parameter(Mandatory)][string]`$Message,
        [switch]`$NoCommit
    )
    & '$ScriptPath' -Area `$Area -Name `$Name -Message `$Message @(if (`$NoCommit) { '-NoCommit' })
}
"@

$ProfilePath = $PROFILE.CurrentUserAllHosts
if (-not (Test-Path $ProfilePath)) {
    New-Item -ItemType File -Force $ProfilePath | Out-Null
    Write-Host "Created profile at $ProfilePath"
}

$ProfileContent = Get-Content $ProfilePath -Raw -ErrorAction SilentlyContinue
if ($ProfileContent -match 'function labshot') {
    Write-Host "labshot function already present in profile — no changes made."
} else {
    Add-Content -Path $ProfilePath -Value $FunctionBlock
    Write-Host "labshot function added to $ProfilePath"
    Write-Host "Reload your shell or run:  . `$PROFILE"
}

Write-Host "`nUsage:"
Write-Host '  labshot <area> <name> "<commit message>"'
Write-Host '  labshot setup 01-admin-center "docs: add admin center screenshot"'
Write-Host '  labshot users 02-new-user "docs: add new user screenshot" -NoCommit'
