local conf = require('conf')

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local path_ok, path = pcall(require, "plenary.path")
if not path_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
-- local nvim_web_devicons = require("nvim-web-devicons")

local header = {
  type = "text",
  val = {
    [[                                  __]],
    [[     ___     ___    ___   __  __ /\_\    ___ ___]],
    [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
    [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
    [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
  },
  opts = {
    position = "center",
    hl = "Type",
  },
}

local buttons = {
  type = "group",
  val = {
    dashboard.button("f", "  Find File", ":" .. require("functions").telescope_find_files() .. "<CR>"),
    dashboard.button("b", "  File Browser", ":Telescope file_browser grouped=true <CR>"),
    dashboard.button("t", "  Find Text", ":Telescope live_grep <CR>"),
    dashboard.button("p", "  Search Projects", ":Telescope projects<CR>"),
    dashboard.button("z", "  Search Zoxide", ":Telescope zoxide list<CR>"),
    dashboard.button("r", "  Recent Files", ":Telescope oldfiles <CR>"),
    dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
    dashboard.button("c", "  Configuration", ":e ~/.config/nvim/ <CR>"),
    dashboard.button("q", "  Quit", ":qa<CR>"),
  },
  position = "center",
}

local layout = {
  header,
  { type = "padding", val = 2 },
  buttons,
}

local opts = {
  layout = layout,
  opts = {
    margin = 5,
  },
}

alpha.setup(opts)

