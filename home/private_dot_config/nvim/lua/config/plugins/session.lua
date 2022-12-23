local M = {
    'Shatur/neovim-session-manager',
    cmd = 'SessionManager',
}

function M.config()
    local Path = require('plenary.path')

    require('session_manager').setup {
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
        autosave_last_session = false,
        autosave_ignore_filetypes = {
            'dashboard',
            'gitcommit',
            'NvimTree',
            'TelescopePrompt',
        },
    }
end

function M.init()
    vim.keymap.set('n', '<leader>sl', function()
        vim.cmd('SessionManager load_last_session')
    end, { desc = 'Load Last Session' })

    vim.keymap.set('n', '<leader>sr', function()
        vim.cmd('SessionManager load_session')
    end, { desc = 'Load Session' })

    vim.keymap.set('n', '<leader>ss', function()
        vim.cmd('SessionManager save_current_session')
    end, { desc = 'Save Current Session' })

    vim.keymap.set('n', '<leader>sd', function()
        vim.cmd('SessionManager delete_session')
    end, { desc = 'Delete  Session' })
end

return M
