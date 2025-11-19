--********** initial setup **********--
vim.g.mapleader = ' '
vim.cmd('filetype plugin indent on')

-- shortcuts (general)
vim.api.nvim_set_keymap('n', '<leader><leader>', ':Ex<CR>', {noremap = true, silent = true}) -- :Ex explorer (shortcut)
vim.api.nvim_set_keymap('n', '<leader>l', ':Lazy<CR>', {noremap = true, silent = true}) -- :Lazy (shortcut)
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true }) -- :q quit (shortcut)
vim.api.nvim_set_keymap('n', '<leader>s', ':w<CR>', { noremap = true, silent = true }) -- :w save (shortcut)
vim.api.nvim_set_keymap('n', '<leader>a', ':wall<CR>', {noremap = true, silent = true}) -- :wall save all (shortcut)
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {noremap = true, silent = true}) -- switch to left pane (shortcut)
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {noremap = true, silent = true}) -- switch to right pane (shortcut)
vim.api.nvim_set_keymap('n', '<leader>p', ':w<CR>:vsplit | terminal python3 main.py<CR>', {noremap = true, silent = true}) -- run python file

-- shortcuts (QOL)
-- run live-server and open 'index.html' in chrome
vim.keymap.set('n', '<leader>(', function()
  os.execute('bash ~/.config/bash/scripts/live_server_start.sh')
  print('✅ Live server Started!')
end)

-- stop live-server
vim.keymap.set('n', '<leader>)', function()
  os.execute('bash ~/.config/bash/scripts/live_server_stop.sh')
  print('🛑 Live server stopped!')
end)

-- general editor configs
vim.o.number = true
vim.o.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

vim.o.splitright = true
vim.o.splitbelow = true

-- Disable auto-comment continuation
vim.cmd([[
  augroup DisableAutoCommenting
    autocmd!
    autocmd FileType * setlocal formatoptions-=r
    autocmd Filetype * setlocal formatoptions-=o
  augroup END
]])

-- package manager: lazy
require('config.lazy')
require('config.cmp')
require('config.lsp')
require('config.luasnip')
require('config.compile_and_run_cpp') -- shortcut '<leader>c'

-- prettier config
-- fix to auto save not working
vim.cmd([[
  augroup PrettierFormatOnSave
    autocmd!
    autocmd BufWritePre *.js,*.ts,*.html,*.css,*.json Prettier
  augroup END
]])

vim.g.prettier_cli_path = 'prettier' -- path to prettier (global)
vim.g.prettier_autoformat = 1 -- format on save

-- cpp config
-- to prevent cursor jump to the top
function SaveCursorAndFormat()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.cmd('silent! %!clang-format')
  vim.api.nvim_win_set_cursor(0, pos)
end
vim.api.nvim_create_user_command("ClangFormat", SaveCursorAndFormat, {}) -- set func as command

-- clang format
vim.cmd([[
  augroup ClangFormatOnSave
    autocmd!
    autocmd BufWritePre *.cpp,*.h,*.hpp,*.cc ClangFormat
  augroup END
]])

-- python config
vim.g.python3_host_prog = '/home/khalidaria/.venvs/nvim/bin/python' -- run python from the virtual environment

-- [tab indent fix] - something is overriding the 'general editor configs' (only for python)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

