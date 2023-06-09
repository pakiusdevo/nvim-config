local config = {}

-- global status line
config.global_statusline = true
-- numbered lines
config.number = true
-- relative numbered lines
config.relative_number = true

-- use ripgrep for grepping
config.grepprg = "rg --hidden --vimgrep --smart-case --"

-- theme
config.theme = "catppuccin"

return config
