# dotconfig

Managed dotfiles — chezmoi + Oh My Posh + WezTerm + PowerShell.

## Setup on a new machine

### 1. Install prerequisites

**chezmoi**
```powershell
winget install chezmoi
```

**Oh My Posh**
```powershell
winget install JanDeDobbeleer.OhMyPosh
```

**WezTerm** (optional, if you want the terminal config)
```powershell
winget install wez.wezterm
```

### 2. Apply

```powershell
chezmoi init --apply https://github.com/VanKurnia/dotfiles.git
```

This clones the repo and copies all config files to the right places.

### 3. Open a new PowerShell window

Start a new `pwsh` (PowerShell 7) session — Oh My Posh loads with the Zen theme.

### Windows PowerShell (5.1)

The profile for the legacy `powershell.exe` is also set up. Open a new Windows PowerShell window if you use it.

## What gets installed

| File | Home location |
|------|---------------|
| `src/dot_oh-my-posh.toml` | `~/.oh-my-posh.toml` |
| `src/dot_config/wezterm/wezterm.lua` | `~/.config/wezterm/wezterm.lua` |
| `src/readonly_Documents/PowerShell/Microsoft.PowerShell_profile.ps1` | `~/Documents/PowerShell/...` |
| `src/readonly_Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1` | `~/Documents/WindowsPowerShell/...` |

## Structure

```
~/.dotconfig/
  .chezmoiroot → "src"   # chezmoi source root
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
