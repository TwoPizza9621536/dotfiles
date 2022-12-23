local M = {
    'mcauley-penney/tidy.nvim',
    event = 'BufWritePre',
}

function M.config()
    require('tidy').setup {
        filetype_exclude = {
            'dashboard',
            'lazy',
            'NvimTree',
            'TelescopePrompt',
        },
    }
end

return M
