# PowerShell profile (pwsh 7) — managed via chezmoi

# Initialize Oh My Posh prompt
oh-my-posh init pwsh --config "$env:USERPROFILE\.oh-my-posh.toml" | Invoke-Expression
