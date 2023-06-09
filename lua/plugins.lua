local fn = vim.fn
local install_path = fn.stdpath('data')..'/lazy/lazy.nvim'

local function get_config(name)
  return function()
    require('config/'..name)
  end
end

-- install packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', install_path}
  )
  print("Installing lazy.vim ...")
end

vim.opt.rtp:prepend(install_path)


-- init lazy
-- load plugins

local lazy = require('lazy')

lazy.setup({

  -- copilot
  'github/copilot.vim',

  -- indent
  {
    "nmac427/guess-indent.nvim",
    config = get_config("guessindent"),
  },

  -- popup
  'nvim-lua/popup.nvim',

  -- oil
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = get_config("oil"),
  },

  -- telescope stuff
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Telescope",
    config = get_config("telescope"),
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope-media-files.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- project management
  {
    "ahmedkhalf/project.nvim",
    config = get_config("project")
  },

  -- dashboard
  {
    "goolord/alpha-nvim",
    config = get_config("alpha"),
  },

  -- git
  {
    "f-person/git-blame.nvim",
    config = get_config("git.blame")
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = get_config("git.signs"),
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    config = get_config("git.lazygit"),
  },
  {
    "ruifm/gitlinker.nvim",
  },

  -- folke
  {"folke/zen-mode.nvim"},
  {"folke/twilight.nvim"},
  {"folke/trouble.nvim"},
  {"folke/tokyonight.nvim"},
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = get_config("todo"),
  },
  {
    "folke/which-key.nvim",
    config = get_config("whichkey"),
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    config = get_config("treesitter"),
    run = ":TSUpdate",
  },
  -- {
  --   "nvim-treesitter/playground",
  --   config = get_config("tsplayground"),
  -- },


  -- others
  {
    "windwp/nvim-autopairs",
    config = get_config("autopairs"),
  },


  {
    "NvChad/nvim-colorizer.lua",
    config = get_config("colorizer"),
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = get_config("barbecue"),
  },
  {
    "nacro90/numb.nvim",
    config = get_config("numb"),
  },

  {"RRethy/vim-illuminate"},
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = get_config("indent"),
  },
  {
    "beauwilliams/focus.nvim",
    config = get_config("focus"),
  },
  {"mbbill/undotree"},
  {"Vimjas/vim-python-pep8-indent"},

  -- lspconfig / completion

  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = get_config("lsp.lines"),
  },

  {
    "neovim/nvim-lspconfig",
    config = get_config("lsp.lsp"),
  },
  {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim", "WhoIsSethDaniel/mason-tool-installer.nvim" },
    config = get_config("lsp.mason"),
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = get_config("cmp"),
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    config = get_config("luasnip"),
  },


  -- mini
  {
    "echasnovski/mini.nvim",
    config = get_config("mini"),
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
  },

  -- terminal
  {
    "akinsho/nvim-toggleterm.lua",
    config = get_config("toggleterm"),
  },

  -- themes
  {
    "rebelot/kanagawa.nvim",
    config = get_config("themes.kanagawa"),
  },
  {
    "catppuccin/nvim",
    config = get_config("themes.catppuccin"),
  }

})

-- load colorscheme
require("config.themes.colorscheme")

