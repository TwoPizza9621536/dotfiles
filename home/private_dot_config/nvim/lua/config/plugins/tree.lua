return {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeOpen',

    config = function()
        require('nvim-tree').setup {
            diagnostics = {
                enable = true,
            },
            filters = { custom = { '^.git$' } },
            open_on_setup = true,
            renderer = {
                highlight_git = true,
                indent_markers = {
                    enable = true,
                },
            },
        }
    end,
}
