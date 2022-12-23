local M = {
    'nvim-telescope/telescope.nvim',
    cmd = { 'Notifications', 'Telescope' },
    dependencies = {
        'benfowler/telescope-luasnip.nvim',
        'nvim-telescope/telescope-dap.nvim',
        'nvim-telescope/telescope-file-browser.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
}

function M.config()
    local telescope = require('telescope')

    telescope.setup {}

    telescope.load_extension('dap')
    telescope.load_extension('file_browser')
    telescope.load_extension('fzf')
    telescope.load_extension('luasnip')
    telescope.load_extension('notify')
    telescope.load_extension('ui-select')
end

function M.init()
    vim.keymap.set('n', '<leader>ff', function()
        require('telescope.builtin').find_files {
            find_command = { 'rg', '--hidden', '--files' },
        }
    end, { desc = 'Find File' })

    vim.keymap.set('n', '<leader>fg', function()
        require('telescope.builtin').live_grep()
    end, { desc = 'Find Text' })

    vim.keymap.set('n', '<leader>fr', function()
        require('telescope.builtin').oldfiles()
    end, { desc = 'Recent Files' })

    vim.keymap.set('n', '<leader>fl', function()
        require('telescope.builtin').buffers()
    end, { desc = 'List Buffers' })

    vim.keymap.set('n', '<leader>fh', function()
        require('telescope.builtin').help_tags()
    end, { desc = 'List Help' })

    vim.keymap.set('n', '<leader>fb', function()
        require('telescope').extensions.file_browser()
    end, { desc = 'File Browser' })
end

return M
