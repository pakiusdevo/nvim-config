local conf = require('conf')

local o = vim.opt
local fn = vim.fn

o.updatetime = 100
o.timeoutlen = 300
o.ttimeoutlen = 0

o.backup = false
o.swapfile = true
o.undofile = true

o.dir = fn.stdpath('data')..'/swap'
o.undodir = fn.stdpath('data')..'/undo'

o.history = 1000
o.clipboard = 'unnamedplus'

-- o.fileencoding = 'utf-8'
o.encoding = 'utf-8'

o.number = conf.number
o.relativenumber = conf.relative_number

o.termguicolors = true
o.cursorline = true

o.smartindent = true
o.ignorecase = true

o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.scrolloff = 8
