local telescope = require('telescope')
local actions = require('telescope.actions')
local fb_actions = require('telescope').extensions.file_browser.actions

telescope.setup({

  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
      mappings = {
        i = {
          ["<C-n>"] = fb_actions.create,
          ["<C-d>"] = fb_actions.remove,
          ["<C-r>"] = fb_actions.rename,
          ["<C-y>"] = fb_actions.copy,
          ["<C-p>"] = fb_actions.move,
          ["<C-h>"] = fb_actions.toggle_hidden,
        },
        n = {
          n = fb_actions.create,
          d = fb_actions.remove,
          r = fb_actions.rename,
          y = fb_actions.copy,
          p = fb_actions.move,
          h = fb_actions.toggle_hidden,
        }
      }
    },

    media_files = {
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "rg"
    },
  },


  defaults = {

    layout_strategy = "flex",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },

    file_ignore_patterns = { "/node_modules", "/.git", "/venv", "/env", "/logs", "/dist", "/.lock" },

    vimgrep_arguments = {
      'rg',
      '--follow',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--trim',
    },

    mappings = {
      i = {
        ["<esc>"] = actions.close,
      }
    },

    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
  }
})

telescope.load_extension('projects')
telescope.load_extension('file_browser')
telescope.load_extension('media_files')
telescope.load_extension('lazygit')
