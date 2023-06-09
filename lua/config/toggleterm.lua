require("toggleterm").setup({
  autochdir = true, -- current project dir always
  open_mapping = "<C-n>",

  direction = "float",

  shell = vim.o.shell,
})
