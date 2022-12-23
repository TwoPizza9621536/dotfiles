return {
    'rcarriga/nvim-notify',
    lazy = false,

    config = function()
        require('notify').setup {
            background_colour = '#000000',
            stages = 'slide',
        }
        vim.notify = require('notify')
    end,
}
