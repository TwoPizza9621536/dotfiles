local M = {
    'dnlhc/glance.nvim',
    keys = { 'gD', 'gR', 'gY', 'gM' },

    config = function()
        require('glance').setup {}
    end,
}

function M.init()
    vim.keymap.set('n', 'gD', function()
        vim.cmd('Glance definitions')
    end, { desc = 'Glance definitions' })

    vim.keymap.set('n', 'gR', function()
        vim.cmd('Glance references')
    end, { desc = 'Glance references' })

    vim.keymap.set('n', 'gY', function()
        vim.cmd('Glance type_definitions')
    end, { desc = 'Glance type_definitions' })

    vim.keymap.set('n', 'gM', function()
        vim.cmd('Glance implementations')
    end, { desc = 'Glance implementations' })
end

return M
