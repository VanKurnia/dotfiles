# PowerShell profile (pwsh 7) — managed via chezmoi

# Initialize Oh My Posh prompt
$omp = oh-my-posh init pwsh --config "$env:USERPROFILE\.oh-my-posh.toml"
# Fix: OMP outputs Cygwin paths (/c/...) when MSYSTEM leaks from parent Git Bash
$omp = $omp -replace "'/c/", "'C:/"
Invoke-Expression $omp
