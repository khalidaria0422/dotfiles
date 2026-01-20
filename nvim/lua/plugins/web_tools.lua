return {
  -- Prettier plugin using vim-prettier
  {
    'prettier/vim-prettier',
    ft = {'html', 'css', 'javascript', 'json'},
    run = 'yarn install' -- install dependencies if necessary
  },

  -- autotag close/rename using tagalong.vim
  {
    'AndrewRadev/tagalong.vim',
    ft = { 'html'},
    config = function ()
      vim.g.tagalong_auto_close = 1
      vim.g.tagalong_auto_rename = 1
    end
  },

  -- emmet plugin using nvim-emmet
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end
  },
}
