return {
    -- colorschemes
    { "Mofiqul/vscode.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = function()
                require("vscode").setup {
                    italic_comments = true,
                    transparent = true,
                }
                vim.cmd("highlight BufferLineFill guibg=NONE")
            end,
        },
    },

    { "baskerville/bubblegum" },
    { "doki-theme/doki-theme-vim" },
    { "tanvirtin/monokai.nvim" },
}
