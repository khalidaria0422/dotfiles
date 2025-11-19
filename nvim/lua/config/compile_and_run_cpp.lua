-- function to find the project root (where Makefile exists)
local function find_project_root()
  local cwd = vim.fn.getcwd()
  local root = vim.fn.findfile('Makefile', cwd .. ';')
  if root == '' then
    print("Makefile not found")
    return nil
  end
  return vim.fn.fnamemodify(root, ':h')
end

-- function to find the binary (in ./ or ./build/)
local function find_binary()
  local candidates = { "./main", "./build/main" }
  for _, path in ipairs(candidates) do
    if vim.fn.filereadable(path) == 1 then
      return path
    end
  end
  print("Binary not found")
  return nil
end

-- compile and run in terminal
local function compile_and_run()
  local root = find_project_root()
  if not root then return end

  vim.cmd('cd ' .. root)
  vim.cmd('write')  -- save current file
  vim.cmd('silent make | cwindow')   -- run Makefile

  local binary = find_binary()
  if binary then
    vim.cmd('vsplit')
    vim.cmd('terminal ' .. binary)
  end
end

-- keymap to trigger it
vim.keymap.set('n', '<leader>c', compile_and_run, { noremap = true, silent = true })
