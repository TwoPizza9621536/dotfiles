return {
    'NvChad/nvim-colorizer.lua',
    cmd = 'ColorizerToggle',

    config = function()
        require('colorizer').setup {
            css = true,
            RRGGBBAA = true,
            sass = {
                enable = true,
            },
        }
    end,
}
