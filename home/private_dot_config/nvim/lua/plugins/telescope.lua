-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
local Util = require('util')

return {
    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        dependencies = {
            'benfowler/telescope-luasnip.nvim',
            'nvim-telescope/telescope-dap.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        version = false, -- telescope did only one release, so use HEAD for now
        keys = {
            {
                '<leader>,',
                '<cmd>Telescope buffers show_all_buffers=true<cr>',
                desc = 'Switch Buffer',
            },
            {
                '<leader>/',
                Util.telescope('live_grep'),
                desc = 'Find in Files (Grep)',
            },
            {
                '<leader>:',
                '<cmd>Telescope command_history<cr>',
                desc = 'Command History',
            },
            {
                '<leader><space>',
                Util.telescope('files'),
                desc = 'Find Files (root dir)',
            },
            {
                '<leader>fF',
                Util.telescope('files', { cwd = false }),
                desc = 'Find Files (cwd)',
            },
            { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
            {
                '<leader>ff',
                Util.telescope('files'),
                desc = 'Find Files (root dir)',
            },
            { '<leader>fr', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
            {
                '<leader>gc',
                '<cmd>Telescope git_commits<CR>',
                desc = 'commits',
            },
            { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'status' },
            { '<leader>sC', '<cmd>Telescope commands<cr>', desc = 'Commands' },
            {
                '<leader>sG',
                Util.telescope('live_grep', { cwd = false }),
                desc = 'Grep (cwd)',
            },
            {
                '<leader>sM',
                '<cmd>Telescope man_pages<cr>',
                desc = 'Man Pages',
            },
            {
                '<leader>sa',
                '<cmd>Telescope autocommands<cr>',
                desc = 'Auto Commands',
            },
            {
                '<leader>sb',
                '<cmd>Telescope current_buffer_fuzzy_find<cr>',
                desc = 'Buffer',
            },
            {
                '<leader>sc',
                '<cmd>Telescope command_history<cr>',
                desc = 'Command History',
            },
            {
                '<leader>sg',
                Util.telescope('live_grep'),
                desc = 'Grep (root dir)',
            },
            {
                '<leader>sh',
                '<cmd>Telescope help_tags<cr>',
                desc = 'Help Pages',
            },
            {
                '<leader>sH',
                '<cmd>Telescope highlights<cr>',
                desc = 'Search Highlight Groups',
            },
            { '<leader>sk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },
            { '<leader>sm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
            {
                '<leader>so',
                '<cmd>Telescope vim_options<cr>',
                desc = 'Options',
            },
            { '<leader>st', '<cmd>Telescope builtin<cr>', desc = 'Telescope' },
            {
                '<leader>ss',
                Util.telescope('lsp_document_symbols', {
                    symbols = {
                        'Class',
                        'Function',
                        'Method',
                        'Constructor',
                        'Interface',
                        'Module',
                        'Struct',
                        'Trait',
                        'Field',
                        'Property',
                    },
                }),
                desc = 'Goto Symbol',
            },
        },
        config = function(_, opts)
            local telescope = require('telescope')

            telescope.setup(opts)
            telescope.load_extension('fzf')
            telescope.load_extension('luasnip')
            telescope.load_extension('dap')
            telescope.load_extension('notify')
        end,
        opts = {
            defaults = {
                prompt_prefix = ' ',
                selection_caret = ' ',
                mappings = {
                    i = {
                        ['<c-t>'] = function(...)
                            return require('trouble.providers.telescope').open_with_trouble(
                                ...
                            )
                        end,
                        ['<C-i>'] = function()
                            Util.telescope('find_files', { no_ignore = true })()
                        end,
                        ['<C-h>'] = function()
                            Util.telescope('find_files', { hidden = true })()
                        end,
                        ['<C-Down>'] = function(...)
                            return require('telescope.actions').cycle_history_next(
                                ...
                            )
                        end,
                        ['<C-Up>'] = function(...)
                            return require('telescope.actions').cycle_history_prev(
                                ...
                            )
                        end,
                    },
                },
            },
        },
    },
}
