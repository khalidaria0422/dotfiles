-- cmp.lua (config for nvim-cmp)
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)  -- Expands snippets
        end,
    },
    mapping = {
        -- If completion suggestions are visible, use Tab to cycle forward
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()  -- Use Luasnip snippet expansion or jump
          else
            fallback()  -- Fall back to Tab (insert indentation)
          end
        end, {'i', 's', 'c'}),

        -- Use Shift+Tab to cycle backward through suggestions
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)  -- Jump backward in Luasnip snippets
          else
            fallback()  -- Fall back to Shift+Tab (insert indentation)
          end
        end, {'i', 's', 'c'}),

        -- Confirm the suggestion with Enter
        ['<CR>'] = cmp.mapping(function (fallback)
          if cmp.visible() and cmp.get_selected_entry() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, {'i', 's', 'c'})
    },

    sources = {
        { name = 'nvim_lsp' },    -- LSP source
        { name = 'buffer' },      -- Buffer source
        { name = 'path' },        -- Path source
        { name = 'luasnip' },     -- Snippet source
    },
})

-- Setup for cmdline completion (e.g., :e, :w commands)
cmp.setup.cmdline(':', {
    sources = {
        { name = 'path' },         -- Path completion for commands
        { name = 'cmdline' },      -- Command-line completion
    },
})

-- Setup for cmdline completion in insert mode (e.g., typing in search)
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' },       -- Buffer source for search
    },
})

