local M = {
    'petertriho/nvim-scrollbar',
    event = 'BufReadPost',

    dependencies = 'kevinhwang91/nvim-hlslens',
}

function M.config()
    require('scrollbar').setup {
        handle = {
            color = '#808080',
        },
    }

    require('hlslens').setup {}

    require('scrollbar.handlers.search').setup {}
    require('scrollbar.handlers.gitsigns').setup()
end

function M.init()
    vim.keymap.set('n', 'n', function()
        vim.cmd([[execute('normal! ' . v:count1 . 'n')]])
        require('hlslens').start()
    end, { desc = 'Jump to Next Matching Word' })

    vim.keymap.set('n', 'N', function()
        vim.cmd([[execute('normal! ' . v:count1 . 'N')]])
        require('hlslens').start()
    end, { desc = 'Jump to Previous Matching Word' })

    vim.keymap.set(
        'n',
        '*',
        [[*<cmd>lua require('hlslens').start()<cr>]],
        { desc = 'Find Next Matching Word' }
    )

    vim.keymap.set(
        'n',
        '#',
        [[#<cmd>lua require('hlslens').start()<cr>]],
        { desc = 'Find Previous Matching Word' }
    )

    vim.keymap.set(
        'n',
        'g*',
        [[g*<cmd>lua require('hlslens').start()<cr>]],
        { desc = 'Find Next Whole Word' }
    )

    vim.keymap.set(
        'n',
        'g#',
        [[g#<cmd>lua require('hlslens').start()<cr>]],
        { desc = 'Find Previous Whole Word' }
    )
end

return M
