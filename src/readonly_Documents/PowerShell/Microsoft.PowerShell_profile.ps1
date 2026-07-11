# PowerShell profile (pwsh 7) — managed via chezmoi

# Initialize Oh My Posh prompt
$omp = oh-my-posh init pwsh --config "$env:USERPROFILE\.oh-my-posh.toml"
# Fix: OMP outputs Cygwin paths (/c/...) when MSYSTEM leaks from parent Git Bash
$omp = $omp -replace "'/c/", "'C:/"
Invoke-Expression $omp

# zoxide — smart cd
Invoke-Expression (& {
    (zoxide init powershell | Out-String)
})

# PSFzf — fuzzy finder
Import-Module PSFzf -ErrorAction SilentlyContinue

# PSReadLine — editing, autosuggestion, history, syntax highlight
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle InlineView
Set-PSReadLineOption -EditMode Windows
Set-PSReadLineOption -BellStyle None

# fzf keybindings
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -ErrorAction SilentlyContinue
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r' -ErrorAction SilentlyContinue
