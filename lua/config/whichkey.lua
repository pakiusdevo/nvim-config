local wk = require("which-key")

wk.setup({
  window = {
    border = "single",
    position = "bottom",
  },
})

wk.register({
  gd = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
  gr = { "<cmd>lua vim.lsp.buf.references()<CR>", "Go to references" },
  gi = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Go to implementation" },
})

-- Leader based mappings
wk.register({
  -- Search General
  ["/"] = { "<cmd>Telescope live_grep<CR>", "Search Files" },
  ["<leader>"] = { "<cmd>" .. require("functions").telescope_find_files() .. "<CR>", "Find in project" },

  -- File
  f = {
    name = "+File",
    f = { "<cmd>" .. require("functions").telescope_find_files() .. "<CR>", "Find File" },
    b = { "<cmd>Telescope file_browser grouped=true<CR>", "File Browser" },
    r = { "<cmd>Telescope oldfiles<CR>", "Recent Files" },
    n = { "<cmd>ene<CR>", "New File" },
    c = { "<cmd>e ~/.config/nvim/<CR>", "Configuration" },
    s = { "<cmd>w<CR>", "Save" },
  },

  -- Config
  c = {
    name = "+Config",
    o = { "<cmd>e ~/.config/nvim/<CR>", "Configuration" },
  },

  -- Undo
  u = { "<cmd>UndotreeToggle<CR>", "Undo Tree" },

  -- Git
  g = {
    name = "+Git",
    g = { "<cmd>LazyGit<CR>", "Lazy Git" },
    L = { "<cmd>lua require('gitlinker').get_buf_range_url('n', {action_callback = require('gitlinker.actions').open_in_browser})<CR>", "Open in Browser" },
    l = { "<cmd>lua require('gitlinker').get_buf_range_url('n', {action_callback = require('gitlinker.actions').copy_to_clipboard})<CR>", "Copy to Clipboard" },
    Y = { "<cmd>lua require('gitlinker').get_repo_url({action_callback = require('gitlinker.actions').open_in_browser})<CR>", "Open Repo in Browser" },
    y = { "<cmd>lua require('gitlinker').get_repo_url({action_callback = require('gitlinker.actions').copy_to_clipboard})<CR>", "Copy Repo to Clipboard" },
  },

  -- Project
  p = {
    name = "+Project",
    p = { "<cmd>Telescope projects<CR>", "Search Projects" },
  },

  -- Window
  w = {
    name = "+Window",

    s = { "<cmd>FocusSplitDown<CR>", "Split Horizontally (down)" },
    S = { "<cmd>FocusSplitUp<CR>", "Split Horizontally (up)" },
    v = { "<cmd>FocusSplitRight<CR>", "Split Vertically (right)" },
    V = { "<cmd>FocusSplitLeft<CR>", "Split Vertically (left)" },
    d = { "<cmd>close<CR>", "Close Window" },

    ["="] = { "<cmd>FocusEqualise<CR>", "Equalise" },

    k = { "<cmd>wincmd k<CR>", "Move Up" },
    j = { "<cmd>wincmd j<CR>", "Move Down" },
    h = { "<cmd>wincmd h<CR>", "Move Left" },
    l = { "<cmd>wincmd l<CR>", "Move Right" },
  },

  -- Options
  o = {
    name = "+Options",
    n = {
      function()
        require('functions').toggle_number()
      end, "Toggle Number"
    },
    r = {
      function()
        require('functions').toggle_relative_number()
      end, "Toggle Relative Number"
    },
    w = {
      function()
        require('functions').toggle_wrap()
      end, "Toggle Wrap"
    },
    c = {
      function()
        require('functions').toggle_cursorline()
      end, "Toggle Cursor Line"
    },
    t = { "<cmd>ToggleTerm<CR>", "Toggle Terminal" },
    z = { "<cmd>ZenMode<CR>", "Zen Mode" },
  },

  -- Zen
  z = { "<cmd>ZenMode<CR>", "Zen Mode" },

  -- Error Info
  e = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Show Line Diagnostics" },

  -- Diagnostic
  l = {
    function()
      require('lsp_lines').toggle()
    end
  , "Toggle LSP Lines Diagnostic" }

}, {
  prefix = "<leader>",
  mode = "n",
  { silent = true },
})
