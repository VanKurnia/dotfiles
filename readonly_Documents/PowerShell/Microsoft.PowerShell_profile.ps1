# PowerShell profile managed by chezmoi
# Source: ~/.dotconfig/Documents/PowerShell/Microsoft.PowerShell_profile.ps1

# Initialize Oh My Posh prompt
oh-my-posh init pwsh --config "$env:USERPROFILE\.oh-my-posh.omp.json" | Invoke-Expression
