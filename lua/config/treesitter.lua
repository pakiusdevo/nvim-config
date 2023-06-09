local conf = require("conf")

require("nvim-treesitter.configs").setup({
  ensure_installed = conf.treesitter_ensure_installed, 

  auto_install = true,
  highlight = {
    enable = true,
  },

  autopairs = {
    enable = true,
  },

  indent = {
    enable = true,
    disable = { "python" },
  },
})
