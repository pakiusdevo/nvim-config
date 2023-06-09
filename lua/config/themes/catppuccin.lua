require("catppuccin").setup({
  flavour = "mocha",
  term_colors = true,
  transparent_background = true,
  background = {
    light = "latte",
    dark = "mocha",
  },

  -- color_overrides = {
  --   mocha = {
  --     -- base = "#000000",
  --     -- mantle = "#000000",
  --     -- crust = "#000000",
  --   }
  -- },
  -- highlight_overrides = {
  --   mocha = function(C)
  --     return {
  --       TabLineSel = { bg = C.pink },
  --       CmpBorder = { fg = C.surface2 },
  --       Pmenu = { bg = C.none },
  --       TelescopeBorder = { link = "FloatBorder" },
  --     }
  --   end,
  -- },


  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.1,
  },
  integrations = {
    telescope = true,
    cmp = true,
    gitsigns = true,
    mini = true,
    mason = true,
    treesitter = true,
    which_key = true,
  }
})
