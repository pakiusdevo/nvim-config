local lspconfig = require("lspconfig")
local functions = require("functions")
local util = require("lspconfig.util")
local opts = require("config.lsp.opts")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {
  "bashls",
  "jsonls",
  "tsserver",
  "vuels",
  "tailwindcss",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = function(client, buffer)
      functions.custom_lsp_attach(client, buffer)
    end,
    before_init = function(_, config)
      if lsp == "pyright" then
        config.settings.python.pythonPath = functions.get_python_path(config.root_dir)
      end
    end,
    capabilities = capabilities,
  })
end

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
}

lspconfig['pyright'].setup({
  on_attach = function(client, buffer)
    functions.custom_lsp_attach(client, buffer)
  end,
  before_init = function(_, config)
    config.settings.python.pythonPath = functions.get_python_path(config.root_dir)
  end,
  capabilities = capabilities,

  cmd = {"pyright-langserver", "--stdio"},
  filetypes = {"python"},
  root_dir = util.root_pattern(unpack(root_files)),

  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
      },
    },
  },
})

-- -- remove inline diagnostics
-- -- lsp_lines will cover for this
-- vim.diagnostic.config({
--   virtual_text = false,
-- })

