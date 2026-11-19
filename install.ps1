param(
    [ValidateSet("agents", "codex", "claude", "copilot", "gemini", "cursor", "all")]
    [string]$Target = "agents",
    [ValidateSet("User", "Project")]
    [string]$Scope = "User",
    [string]$ProjectPath = (Get-Location).Path,
    [switch]$Force
)

$ErrorActionPreference = "Stop"
$sourceRoot = Join-Path $PSScriptRoot ".agents\skills"
if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) {
    throw "Folder sumber skill tidak ditemukan: $sourceRoot"
}

if ($Scope -eq "User") {
    $base = $HOME
} else {
    if (-not (Test-Path -LiteralPath $ProjectPath -PathType Container)) {
        throw "Folder proyek tidak ditemukan: $ProjectPath"
    }
    $base = (Resolve-Path -LiteralPath $ProjectPath).Path
}

$targetMap = @{
    "agents"  = ".agents\skills"
    "codex"   = ".agents\skills"
    "claude"  = ".claude\skills"
    "copilot" = if ($Scope -eq "User") { ".copilot\skills" } else { ".github\skills" }
    "gemini"  = ".gemini\skills"
    "cursor"  = ".cursor\skills"
}

if ($Target -eq "all") {
    $selectedTargets = @("agents", "claude", "copilot", "gemini", "cursor")
} else {
    $selectedTargets = @($Target)
}

foreach ($selected in $selectedTargets) {
    $destinationRoot = Join-Path $base $targetMap[$selected]
    New-Item -ItemType Directory -Path $destinationRoot -Force | Out-Null
    Write-Host ""
    Write-Host "Tujuan: $destinationRoot" -ForegroundColor Cyan

    Get-ChildItem -LiteralPath $sourceRoot -Directory | ForEach-Object {
        $sourceSkill = $_.FullName
        $destinationSkill = Join-Path $destinationRoot $_.Name

        if ((Test-Path -LiteralPath $destinationSkill) -and -not $Force) {
            Write-Warning "Dilewati karena sudah ada: $destinationSkill (gunakan -Force untuk menimpa berkas yang sama)"
            return
        }

        New-Item -ItemType Directory -Path $destinationSkill -Force | Out-Null
        Copy-Item -Path (Join-Path $sourceSkill "*") -Destination $destinationSkill -Recurse -Force
        Write-Host "Terpasang: $($_.Name)" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Selesai. Buka ulang aplikasi AI bila skill belum terdeteksi." -ForegroundColor Green
if ($Scope -eq "User") {
    Write-Host "Instalasi ini berlaku untuk akun pengguna Windows saat ini."
} else {
    Write-Host "Instalasi ini hanya berlaku untuk proyek: $base"
}
