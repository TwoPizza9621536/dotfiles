return {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'folke/which-key.nvim',
    'b0o/SchemaStore.nvim',
    { 'andweeb/presence.nvim', lazy = false },
    { 'gpanders/editorconfig.nvim', event = 'BufReadPre' },
    {
        'chrisbra/unicode.vim',
        cmd = {
            'Digraphs',
            'UnicodeSearch',
            'UnicodeName',
            'UnicodeTable',
            'DownloadUnicode',
            'UnicodeCache',
        },
    },
    {
        'uga-rosa/ccc.nvim',
        cmd = {
            'CccPick',
            'CccConvert',
        },
    },

    -- Themes
    'Mofiqul/vscode.nvim',
    { 'baskerville/bubblegum', event = 'VeryLazy' },
    { 'doki-theme/doki-theme-vim', event = 'VeryLazy' },
    { 'tanvirtin/monokai.nvim', event = 'VeryLazy' },

    -- Visuals
    { 'folke/twilight.nvim', cmd = 'Twilight' },

    -- Language Server and Debugger
    'jose-elias-alvarez/null-ls.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jayp0521/mason-nvim-dap.nvim',
    'jayp0521/mason-null-ls.nvim',
    'folke/neodev.nvim',
    { 'folke/neoconf.nvim', cmd = 'Neoconf' },
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup {}
        end,
    },

    -- Check startup time
    {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
        config = function()
            vim.g.startuptime_tries = 10
        end,
    },
}
