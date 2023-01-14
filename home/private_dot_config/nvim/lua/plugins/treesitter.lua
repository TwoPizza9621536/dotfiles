-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
return {
    -- syntax highlight
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context',
            'p00f/nvim-ts-rainbow',
        },
        event = 'BufReadPost',
        ---@param opts TSConfig
        config = function(plugin, opts)
            if plugin.ensure_installed then
                require('util').deprecate(
                    'treesitter.ensure_installed',
                    'treesitter.opts.ensure_installed'
                )
            end
            require('nvim-treesitter.configs').setup(opts)
        end,
        ---@type TSConfig
        opts = {
            sync_install = false,
            context_commentstring = { enable = true, enable_autocmd = false },
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = { enable = true },
            ensure_installed = {
                'bash',
                'c',
                'help',
                'html',
                'jsonc',
                'lua',
                'markdown',
                'markdown_inline',
                'python',
                'vim',
            },
        },
    },
}
