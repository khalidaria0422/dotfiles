return {
	-- Formatter plugin
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			-- optional: auto-format on save
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = true,
			},
		},
	},

	-- autocompletion plugin using nvim-lspconfig & nvim-cmp
	-- lsp config
	{ "neovim/nvim-lspconfig" },

	-- autocompletion plugins
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-cmdline" },

	-- snippet engine and source
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		keys = function()
			-- diable default tab keybinding in LuaSnip
			return {}
		end,
	},

	{ "saadparwaiz1/cmp_luasnip" },

	-- treesitter plugin using nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "html", "css", "javascript", "json", "lua", "cpp", "python", "bash" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
