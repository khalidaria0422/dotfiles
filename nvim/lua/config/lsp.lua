-- lsp.lua (config for nvim-lspconfig)
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Default applied to every server
vim.lsp.config('*', { capabilities = capabilities })

-- Lua LSP configuration (using `sumneko_lua` server)
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})

-- HTML LSP configuration (using `html-lsp` server)
vim.lsp.config('html', {})

-- CSS LSP configuration (using `cssls` server)
vim.lsp.config('cssls', {})

-- JavaScript (and TypeScript) LSP configuration (using `tsserver` server)
vim.lsp.config('ts_ls', {})

-- JSON LSP configuration (using `jsonls` server)
vim.lsp.config('jsonls', {})

-- Emmet LSP configuration (using `@olrtg` server)
vim.lsp.config('emmet_language_server', {
  filetypes = { "css", "html", "sass", "scss" },
  -- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
  -- **Note:** only the options listed in the table are supported.
  init_options = {
    ---@type table<string, string>
    includeLanguages = {},
    --- @type string[]
    excludeLanguages = {},
    --- @type string[]
    extensionsPath = {},
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
    preferences = {},
    --- @type boolean Defaults to `true`
    showAbbreviationSuggestions = true,
    --- @type "always" | "never" Defaults to `"always"`
    showExpandedAbbreviation = "always",
    --- @type boolean Defaults to `false`
    showSuggestionsAsSnippets = false,
    --- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
    syntaxProfiles = {},
    --- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
    variables = {},
  },
})

-- C++ LSP configuration (using 'clangd' server)
vim.lsp.config('clangd', {})

-- Python LSP configuration (using 'pyright' server)
vim.lsp.config('pyright', {})

-- Bash LSP configuration (using 'bashls' server)
vim.lsp.config('bashls', {})

-- Enable the configured servers
vim.lsp.enable({ 'lua_ls', 'html', 'cssls', 'jsonls', 'ts_ls', 'emmet_language_server', 'clangd', 'pyright', 'bashls' })
