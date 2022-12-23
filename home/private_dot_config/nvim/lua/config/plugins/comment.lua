local M = {
    'numToStr/Comment.nvim',
    keys = 'gc',

    dependencies = 'JoosepAlviste/nvim-ts-context-commentstring',
}

function M.config()
    require('Comment').setup {
        opleader = {
            line = 'gcn',
            block = 'gbn',
        },
        pre_hook = require(
            'ts_context_commentstring.integrations.comment_nvim'
        ).create_pre_hook(),
    }
end

return M
