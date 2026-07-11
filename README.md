# dotconfig

Managed dotfiles — chezmoi + Oh My Posh + WezTerm + PowerShell + PSReadLine + fzf + zoxide.

## Setup on a new machine

### 1. Install prerequisites

```powershell
# chezmoi
winget install chezmoi

# Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

# fzf — fuzzy finder
winget install junegunn.fzf

# zoxide — smart cd
winget install ajeetdsouza.zoxide

# WezTerm (optional, terminal emulator)
winget install wez.wezterm
```

Then install PowerShell modules:

```powershell
# PSFzf (PowerShell integration for fzf)
Install-Module PSFzf -Scope CurrentUser -Force

# PSReadLine (latest version, for autosuggestions & syntax highlight)
Install-Module PSReadLine -Scope CurrentUser -Force
```

### 2. Apply dotfiles

```powershell
chezmoi init --apply https://github.com/VanKurnia/dotfiles.git
```

### 3. Restart PowerShell

Start a new `pwsh` (PowerShell 7) session. If modules installed correctly you get:
- Oh My Posh prompt (Zen theme)
- zoxide smart `cd`
- `Ctrl+t` → fuzzy file picker
- `Ctrl+r` → fuzzy history search
- Inline autosuggestions from PSReadLine

## What gets installed

| File | Home location |
|------|---------------|
| `src/dot_oh-my-posh.toml` | `~/.oh-my-posh.toml` |
| `src/dot_config/wezterm/wezterm.lua` | `~/.config/wezterm/wezterm.lua` |
| `src/readonly_Documents/PowerShell/Microsoft.PowerShell_profile.ps1` | `~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1` |
| `src/readonly_Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1` | `~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1` |

## Stack

```
WezTerm (or any terminal)
  └── PowerShell 7
        ├── PSReadLine — autosuggest, syntax highlight, history
        ├── PSFzf — fuzzy file/history search (Ctrl+t, Ctrl+r)
        ├── zoxide — smart cd (z, zi)
        └── Oh My Posh — prompt theme
```

## Structure

```
~/.dotconfig/
  .chezmoiroot → "src"
  src/
    dot_oh-my-posh.toml
    dot_config/wezterm/wezterm.lua
    readonly_Documents/PowerShell/Microsoft.PowerShell_profile.ps1
    readonly_Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
```

## Daily use

```powershell
# Check what would change
chezmoi diff

# Apply pending changes
chezmoi apply

# Add a new file to management
chezmoi add ~/.gitconfig

# Edit a managed file
chezmoi edit ~/.oh-my-posh.toml

# Enter source directory
chezmoi cd
```

## Update from remote

```powershell
chezmoi update
```
