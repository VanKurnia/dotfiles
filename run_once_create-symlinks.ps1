# Create symlinks from home directory to chezmoi source files

$sourceDir = "$env:USERPROFILE\.dotconfig"

# Wezterm config
$dest = "$env:USERPROFILE\.config\wezterm\wezterm.lua"
$target = "$sourceDir\wezterm\wezterm.lua"
if (-not (Test-Path "$env:USERPROFILE\.config\wezterm")) {
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.config\wezterm" | Out-Null
}
if (Test-Path $dest) { Remove-Item -Force $dest }
New-Item -ItemType SymbolicLink -Path $dest -Target $target | Out-Null
Write-Host "  symlink: $dest"

# Oh My Posh config
$dest = "$env:USERPROFILE\.oh-my-posh.toml"
$target = "$sourceDir\oh-my-posh\config.toml"
if (Test-Path $dest) { Remove-Item -Force $dest }
New-Item -ItemType SymbolicLink -Path $dest -Target $target | Out-Null
Write-Host "  symlink: $dest"

# PowerShell 7 profile (pwsh)
$dest = "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
$target = "$sourceDir\powershell\Microsoft.PowerShell_profile.ps1"
if (-not (Test-Path "$env:USERPROFILE\Documents\PowerShell")) {
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Documents\PowerShell" | Out-Null
}
if (Test-Path $dest) { Remove-Item -Force $dest }
New-Item -ItemType SymbolicLink -Path $dest -Target $target | Out-Null
Write-Host "  symlink: $dest"

# Windows PowerShell profile (powershell.exe)
$dest = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
$target = "$sourceDir\powershell\windows_profile.ps1"
if (-not (Test-Path "$env:USERPROFILE\Documents\WindowsPowerShell")) {
    New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\Documents\WindowsPowerShell" | Out-Null
}
if (Test-Path $dest) { Remove-Item -Force $dest }
New-Item -ItemType SymbolicLink -Path $dest -Target $target | Out-Null
Write-Host "  symlink: $dest"
