local M = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = 'BufReadPre',

    dependencies = {
        'nvim-treesitter/nvim-treesitter-context',
        'p00f/nvim-ts-rainbow',
    },
}

function M.config()
    require('nvim-treesitter.configs').setup {
        auto_install = true,
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },
        ensure_installed = {
            'bash',
            'c',
            'help',
            'jsonc',
            'lua',
            'markdown',
            'markdown_inline',
            'regex',
            'vim',
        },
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<c-backspace>',
            },
        },
        rainbow = { enable = true },
    }

    require('treesitter-context').setup { throttle = true }
end

return M
