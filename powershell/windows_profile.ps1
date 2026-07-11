# PowerShell profile (Windows PowerShell 5.1) — managed via chezmoi
# Source: ~/.dotconfig/powershell/windows_profile.ps1

# Initialize Oh My Posh prompt
oh-my-posh init powershell --config "$env:USERPROFILE\.oh-my-posh.toml" | Invoke-Expression
