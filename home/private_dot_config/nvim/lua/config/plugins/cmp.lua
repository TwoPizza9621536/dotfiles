local M = {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'rcarriga/cmp-dap',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'lukas-reineke/cmp-under-comparator',
        'saadparwaiz1/cmp_luasnip',
        'L3MON4D3/LuaSnip',
        'rafamadriz/friendly-snippets',
    },
    event = 'InsertEnter',
}

function M.config()
    vim.o.completeopt = 'menuone,noselect'

    local cmp = require('cmp')
    local luasnip = require('luasnip')

    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup {
        completion = {
            completeopt = 'menu,menuone,noinsert',
        },
        duplicates = {
            nvim_lsp = 1,
            luasnip = 1,
            buffer = 1,
            path = 1,
        },
        formatting = {
            format = require('config.plugins.lsp.kind').cmp_format(),
        },
        mapping = cmp.mapping.preset.insert {
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm { select = true },
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end, { 'i', 's' }),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { 'i', 's' }),
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },
        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.score,
                require('cmp-under-comparator').under,
                cmp.config.compare.kind,
                cmp.config.compare.sort_text,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        },
        sources = cmp.config.sources {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
        },
    }

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline {},
        sources = {
            { name = 'buffer' },
        },
    })

    -- cmp.setup.cmdline(':', {
    --     mapping = cmp.mapping.preset.cmdline {},
    --     sources = cmp.config.sources {
    --         { name = 'path' },
    --         { name = 'cmdline' },
    --     },
    -- })

    cmp.setup.filetype({ 'dap-repl', 'dapui_watches', 'dapui_hover' }, {
        sources = cmp.config.sources {
            { name = 'dap' },
        },
    })
end

return M
