return {

  -- tokyonight theme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
       vim.cmd[[colorscheme tokyonight-night]]
    end
  },

  -- prettier plugin using vim-prettier
  {
    'prettier/vim-prettier',
    ft = {'html', 'css', 'javascript', 'json'},
    run = 'yarn install' -- install dependencies if necessary
  },

  -- color preview using nvim-colorizer.lua
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css' },
    config = function()
      local configs = require('colorizer')

      configs.setup({
        'css';
        css = {
          css = true;
        }
      })
    end
  },

  -- autopair plugin using nvim-autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true
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

  -- treesitter plugin using nvim-treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function ()
      local configs = require('nvim-treesitter.configs')

      configs.setup({
        ensure_installed = {'html', 'css', 'javascript', 'json', 'lua', 'cpp', 'python', 'bash'},
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },

  -- autocompletion plugin using nvim-lspconfig & nvim-cmp
  -- lsp config
  { 'neovim/nvim-lspconfig' },

  -- autocompletion plugins
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },

  -- snippet engine and source
  { 'L3MON4D3/LuaSnip',
    build = "make install_jsregexp",
    keys = function ()
      -- diable default tab keybinding in LuaSnip
      return {}
    end
  },

  { 'saadparwaiz1/cmp_luasnip' },

  -- emmet plugin using nvim-emmet
  {
    "olrtg/nvim-emmet",
    config = function()
      vim.keymap.set({ "n", "v" }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)
    end
  }
}

