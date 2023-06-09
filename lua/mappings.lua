local map = vim.keymap.set

-- Remap leader key
map({'n', 'v'}, '<Space>', '<NOP>', {silent = true})
vim.g.mapleader = ' '


-- Better indenting
map('v', '<', '<gv', {silent = true})
map('v', '>', '>gv', {silent = true})

-- Cancel search highlighting with <Esc>
map('n', '<Esc>', ':noh<CR>', {silent = true})

-- Window navigation
map('n', '<C-k>', '<cmd>wincmd k<CR>', {silent = true})
map('n', '<C-j>', '<cmd>wincmd j<CR>', {silent = true})
map('n', '<C-h>', '<cmd>wincmd h<CR>', {silent = true})
map('n', '<C-l>', '<cmd>wincmd l<CR>', {silent = true})

-- Buffer navigation
map('n', '<TAB>', ':bnext<CR>', {silent = true})
map('n', '<S-TAB>', ':bprevious<CR>', {silent = true})

