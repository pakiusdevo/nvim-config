local api = vim.api

-- no buffer show alpha
api.nvim_create_augroup("alpha_on_empty", { clear = true })
api.nvim_create_autocmd("User", {
  pattern = "BDeletePre",
  group = "alpha_on_empty",
  callback = function(event)
    local found_non_empty_buffer = false
    local buffers = require("functions").get_listed_buffers()

    for _, buffer in ipairs(buffers) do
      if not found_non_empty_buffer then
        local buffer_name = api.nvim_buf_get_name(buffer)
        local ft = api.nvim_buf_get_option(buffer, "filetype")

        if buffer ~= event.buf and buffer_name ~= "" and ft ~= "alpha" then
          found_non_empty_buffer = true
        end
      end
    end

    if not found_non_empty_buffer then
      vim.cmd([[:Alpha]])
    end
  end,
})


-- go to last location when opening a file
api.nvim_create_autocmd("BufReadPost", {
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]]
})


-- trim whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})


-- cursorline only on active window
local cursorGrp = api.nvim_create_augroup("cursorline", { clear = true })
api.nvim_create_autocmd({ "WinEnter", "InsertLeave" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd({ "WinLeave", "InsertEnter" }, {
  pattern = "*",
  command = "set nocursorline",
  group = cursorGrp,
})


-- close references window after select
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local bufnr = vim.fn.bufnr('%')
    vim.keymap.set("n", "<CR>", function()
      api.nvim_command([[execute "normal! \<cr>"]])
      api.nvim_command(bufnr .. 'bd')
    end, { buffer = bufnr })
  end,
  pattern = "qf",
})


