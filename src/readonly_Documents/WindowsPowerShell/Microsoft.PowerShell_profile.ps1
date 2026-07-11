# PowerShell profile (Windows PowerShell 5.1) – managed via chezmoi

# Initialize Oh My Posh prompt
$omp = oh-my-posh init powershell --config "$env:USERPROFILE\.oh-my-posh.toml"
# Fix: OMP outputs Cygwin paths (/c/...) when MSYSTEM leaks from parent Git Bash
$omp = $omp -replace "'/c/", "'C:/"
Invoke-Expression $omp
