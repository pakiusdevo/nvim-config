require("mason").setup({

})

require("mason-lspconfig").setup({})

require("mason-tool-installer").setup({

  -- stuff to have installed on start
  ensure_installed = {
    -- LSP
    "bash-language-server",
    "json-lsp",
    "pyright",
    "lua-language-server",
    "typescript-language-server",
    "tailwindcss-language-server",
    "vetur-vls",
    "css-lsp",
  },

  auto_update = false,
  run_on_start = true,

  start_delay = 3000,

})
