# dotconfig

Managed dotfiles — chezmoi + komorebi + YASB + Oh My Posh + WezTerm + PowerShell 7 + PSReadLine + fzf + zoxide.

## Default shell: PowerShell 7

Both **WezTerm** and **herdr** are configured to launch `pwsh.exe` (PowerShell 7) as the default shell.
Git Bash is available as a fallback in WezTerm — uncomment the line in `wezterm.lua` to switch back.

## Setup on a new machine

### 1. Install PowerShell 7

If not already installed:
```powershell
winget install Microsoft.PowerShell
```

### 2. Install prerequisites

```powershell
# chezmoi — dotfile manager
winget install chezmoi

# komorebi — tiling window manager
winget install LGUG2Z.komorebi

# Oh My Posh — prompt
winget install JanDeDobbeleer.OhMyPosh

# fzf — fuzzy finder
winget install junegunn.fzf

# zoxide — smart cd
winget install ajeetdsouza.zoxide

# WezTerm (optional, terminal emulator, already defaults to pwsh)
winget install wez.wezterm

# herdr (optional, agent multiplexer, already defaults to pwsh)
winget install herdr
```

### 3. Install PowerShell modules

```powershell
Install-Module PSFzf -Scope CurrentUser -Force
Install-Module PSReadLine -Scope CurrentUser -Force
```

### 4. Apply dotfiles

```powershell
chezmoi init --apply https://github.com/VanKurnia/dotfiles.git
```

### 5. Set up komorebi

```powershell
# Start komorebi with YASB (skip --bar since we use YASB)
komorebic start --whkd

# Or with autostart enabled
komorebic enable-autostart --task
```

### 6. Set up YASB

YASB (Yet Another Status Bar) replaces komorebi's native status bar.

```powershell
# Install YASB via winget
winget install --id --exact amnweb.yasb

# Enable autostart (via tray menu or CLI)
yasbc enable-autostart
```

### 7. Open PowerShell 7

Start a new `pwsh` session. You get:
- **komorebi** — tiling window manager with 5 workspaces
- **YASB** — status bar with workspace, media, cpu, memory, volume, todo widgets
- Oh My Posh prompt (Zen theme)
- zoxide smart `cd` — `z folder`, `zi` interactive picker
- `Ctrl+t` → fuzzy file picker
- `Ctrl+r` → fuzzy history search
- Inline autosuggestions from PSReadLine

## What's managed

| File | Home location | Description |
|------|---------------|-------------|
| `src/dot_bashrc` | `~/.bashrc` | Bash config |
| `src/dot_bash_profile` | `~/.bash_profile` | Bash profile |
| `src/dot_oh-my-posh.toml` | `~/.oh-my-posh.toml` | Oh My Posh theme |
| `src/dot_config/wezterm/wezterm.lua` | `~/.config/wezterm/wezterm.lua` | WezTerm config |
| `src/dot_config/yasb/config.yaml` | `~/.config/yasb/config.yaml` | YASB widget config |
| `src/dot_config/yasb/styles.css` | `~/.config/yasb/styles.css` | YASB styles (Catppuccin) |
| `src/komorebi.json` | `~/komorebi.json` | Komorebi tiling config |
| `src/applications.json` | `~/applications.json` | Komorebi app rules |
| `src/readonly_Documents/PowerShell/Microsoft.PowerShell_profile.ps1` | `~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1` | PS7 profile |
| `src/readonly_Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1` | `~/Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1` | PS5 profile |
| `src/AppData/Roaming/herdr/config.toml` | `~/AppData/Roaming/herdr/config.toml` | herdr config |

## Stack

```
WezTerm / herdr
  └── PowerShell 7 (pwsh)
        ├── PSReadLine — autosuggest, syntax highlight, history
        ├── PSFzf — fuzzy file/history search (Ctrl+t, Ctrl+r)
        ├── zoxide — smart cd (z, zi)
        └── Oh My Posh — prompt (Zen theme)

Komorebi (tiling window manager)
  ├── YASB — status bar (workspaces, media, cpu, memory, volume, todo)
  └── whkd — hotkey daemon
```

## Structure

```
~/.dotconfig/
  .chezmoiroot → "src"
  .gitignore
  src/
    dot_bashrc
    dot_bash_profile
    dot_oh-my-posh.toml
    dot_config/
      wezterm/wezterm.lua
      yasb/
        config.yaml
        styles.css
    komorebi.json
    applications.json
    readonly_Documents/PowerShell/Microsoft.PowerShell_profile.ps1
    readonly_Documents/WindowsPowerShell/Microsoft.PowerShell_profile.ps1
    AppData/Roaming/herdr/config.toml
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
