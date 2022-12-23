local M = {
    'jdhao/whitespace.nvim',
    cmd = 'StripTrailingWhitespace',
}

function M.config()
    vim.g.trailing_whitespace_exclude_filetypes = {
        'dashboard',
        'lazy',
        'NvimTree',
        'TelescopePrompt',
    }
end

function M.init()
    vim.keymap.set('n', '<leader>t', function()
        vim.cmd('StripTrailingWhitespace')
    end, { desc = 'Trim Whitespace' })
end

return M
