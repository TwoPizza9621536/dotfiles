local wk = require('which-key')

wk.setup {
    plugins = { spelling = true },
    key_labels = { ['<leader>'] = 'SPC' },
}

wk.register {
    ['<leader>l'] = { vim.cmd('nohlsearch'), 'Clear Highlight' },
}

wk.register {
    ['[d'] = { vim.diagnostic.goto_prev, 'Previous Diagnostics' },
    [']d'] = { vim.diagnostic.goto_next, 'Next Diagnostics' },
    ['<leader>e'] = { vim.diagnostic.open_float, 'Show Diagnostics' },
    ['<leader>q'] = { vim.diagnostic.setloclist, 'Open Diagnostics' },
}

wk.register({
    c = {
        name = 'Check Neovim',
        h = { '<cmd>checkhealth<cr>', 'Check Health' },
        p = { '<cmd>checkpath<cr>', 'Check Path' },
        t = { '<cmd>checktime<cr>', 'Check Time' },
    },
    f = {
        n = { '<cmd>DashboardNewFile<cr>', 'New File' },
    },
}, { prefix = '<leader>' })
