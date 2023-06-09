require("indent_blankline").setup({
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  show_current_context = true,
  show_current_context_start = true,

  filetype_exclude = {
    "alpha",
    "help",
    "terminal",
    "dashboard",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "markdown",
  },
  buftype_exclude = { "terminal" },
  chat_list = { "|", "¦", "┆", "┊" },
})

