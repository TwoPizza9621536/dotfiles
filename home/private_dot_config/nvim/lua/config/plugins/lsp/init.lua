-- From https://github.com/folke/dot
local M = {
    'neovim/nvim-lspconfig',
    name = 'lsp',
    event = 'BufReadPre',
    dependencies = { 'hrsh7th/cmp-nvim-lsp' },
}

function M.config()
    require('neodev').setup {}
    require('mason')
    require('config.plugins.lsp.diagnostics').setup()
    require('neoconf').setup {}

    local on_attach = function(client, bufnr)
        require('nvim-navic').attach(client, bufnr)
        require('config.plugins.lsp.formatting').setup(client, bufnr)
    end

    local servers = {
        sumneko_lua = {
            single_file_support = true,
            settings = {
                Lua = {
                    workspace = {
                        checkThirdParty = false,
                    },
                },
            },
        },
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local options = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }

    for server, opts in pairs(servers) do
        opts = vim.tbl_deep_extend('force', {}, options, opts or {})
        require('lspconfig')[server].setup(opts)
    end

    require('config.plugins.null-ls').setup(options)
end

return M
