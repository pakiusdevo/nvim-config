local project = require('project_nvim')

project.setup({
  patterns = {
    ".git",
    ".project",
    ".pyrightconfig.json",
    ".pyproject.toml",
  },

  detection_methods = {
    "pattern",
    -- "lsp",
  },
})

