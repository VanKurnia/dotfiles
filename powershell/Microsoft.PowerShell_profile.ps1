# PowerShell profile — managed via chezmoi
# Source: ~/.dotconfig/powershell/Microsoft.PowerShell_profile.ps1

# Initialize Oh My Posh prompt
oh-my-posh init pwsh --config "$env:USERPROFILE\.oh-my-posh.toml" | Invoke-Expression
