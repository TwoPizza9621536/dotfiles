-- From https://github.com/folke/dot
local M = {
    'jose-elias-alvarez/null-ls.nvim',
}

function M.setup(options)
    local nls = require('null-ls')

    nls.setup {
        on_attach = options.on_attach,
        sources = {
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
        },
    }

    require('mason-null-ls').setup {
        automatic_installation = true,
        automatic_setup = false,
        ensure_installed = nil,
    }
end

return M
