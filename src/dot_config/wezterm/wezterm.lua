local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--- default shell: Git Bash
config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', '-l' }

--- Font ---
config.font = wezterm.font 'JetBrainsMono NFM'
config.font_size = 12.0
config.line_height = 1.2

--- Catppuccin Mocha
config.colors = {
    foreground = '#cdd6f4',
    background = '#1e1e2e',
    cursor_bg = '#f5e0dc',
    cursor_border = '#f5e0dc',
    cursor_fg = '#1e1e2e',
    selection_bg = '#585b70',
    selection_fg = '#cdd6f4',
    ansi = {
        '#45475a', -- black
        '#f38ba8', -- red
        '#a6e3a1', -- green  (success)
        '#f9e2af', -- yellow (warn)
        '#89b4fa', -- blue
        '#f5c2e7', -- magenta
        '#94e2d5', -- cyan
        '#bac2de', -- white
    },
    brights = {
        '#585b70', -- bright black
        '#f38ba8', -- bright red
        '#a6e3a1', -- bright green
        '#f9e2af', -- bright yellow
        '#89b4fa', -- bright blue
        '#f5c2e7', -- bright magenta
        '#94e2d5', -- bright cyan
        '#a6adc8', -- bright white
    },
}

--- appearance
config.window_decorations = 'RESIZE'
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.hide_tab_bar_if_only_one_tab = true

--- background gradient: black -> subtle blue
config.window_background_gradient = {
    colors = { '#000000', '#0a0a1a' },
    orientation = 'Vertical',
}

return config
