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
        require('config.plugins.lsp.formatting').setup(client, bufnr)
    end

    local servers = {
        jsonls = {
            settings = {
            json = {
                    format = {
                        enable = true,
                    },
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
        },
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

    local nls = require('null-ls')

    local formatters = {
        nls.builtins.code_actions.cspell,
        nls.builtins.completion.spell,
        nls.builtins.diagnostics.cspell.with {
            diagnostics_postprocess = function(diagnostic)
                diagnostic.severity = vim.diagnostic.severity.INFO
            end,
            disabled_filetypes = {
                'dashboard',
                'NvimTree',
                'TelescopePrompt',
            },
        },
        nls.builtins.formatting.stylua,
    }

    nls.setup {
        on_attach = options.on_attach,
        sources = formatters,
    }

    require('mason-null-ls').setup {
        automatic_installation = true,
        automatic_setup = false,
        ensure_installed = nil,
    }
end

return M
