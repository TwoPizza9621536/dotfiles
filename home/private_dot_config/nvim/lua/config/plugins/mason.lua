-- From https://github.com/folke/dot
local M = {
    'williamboman/mason.nvim',
}

function M.config()
    require('mason').setup {
        ui = {
            icons = {
                package_installed = '✓',
                package_pending = '➜',
                package_uninstalled = '✗',
            },
        },
    }

    local tools = {
        'stylua',
    }

    local mr = require('mason-registry')
    for _, tool in ipairs(tools) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
            p:install()
        end
    end

    require('mason-lspconfig').setup {
        automatic_installation = true,
    }
    require('mason-nvim-dap').setup {
        automatic_installation = true,
    }
end

return M
