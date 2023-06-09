local cmd = vim.cmd
local fn = vim.fn

local functions = {}


functions.isdir = function(path)
  return fn.isdirectory(path) ~= 0
end

functions.telescope_find_files = function()
  if functions.isdir('.git/') then
    return "Telescope git_files"
  else
    return "Telescope find_files"
  end
end

functions.toggle_wrap = function()
  if vim.o.wrap then
    vim.o.wrap = false
  else
    vim.o.wrap = true
  end
end

functions.toggle_number = function()
  if vim.o.number then
    vim.o.number = false
  else
    vim.o.number = true
  end
end

functions.toggle_relative_number = function()
  if vim.o.relativenumber then
    vim.o.relativenumber = false
  else
    vim.o.relativenumber = true
  end
end

functions.toggle_cursorline = function()
  if vim.o.cursorline then
    vim.o.cursorline = false
  else
    vim.o.cursorline = true
  end
end

functions.get_python_path = function(workspace)
  local util = require('lspconfig/util')
  local path = util.path

  -- Activated virtualenv
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Workspace virtualenv
  for _, pattern in ipairs({ "*", ".*" }) do
    local match = fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
    if match ~= '' then
      return path.join(path.dirname(match), 'bin', 'python')
    end
  end

  -- System python
  return fn.exepath('python3') or fn.exepath('python') or "python"
end

functions.custom_lsp_attach = function(client, buffer)

end

functions.get_listed_buffers = function()
  local buffers = {}
  local len = 0
  for buffer = 1, fn.bufnr('$') do
    if fn.buflisted(buffer) == 1 then
      len = len + 1
      buffers[len] = buffer
    end
  end

  return buffers
end

return functions

