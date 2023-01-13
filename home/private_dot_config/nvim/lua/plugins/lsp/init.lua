-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
return {
    -- Schemas
    'b0o/SchemaStore.nvim',

    -- lspconfig
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true },
            {
                'folke/neodev.nvim',
                opts = { experimental = { pathStrict = true } },
            },
            'mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        event = 'BufReadPre',
        ---@class PluginLspOpts
        opts = function()
            return {
                ---@type lspconfig.options
                servers = {
                    jsonls = {
                        settings = {
                            json = {
                                format = {
                                    enable = true,
                                },
                                schemas = require('schemastore').json.schemas(),
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
                                completion = {
                                    callSnippet = 'Replace',
                                },
                            },
                        },
                    },
                },
                -- you can do any additional lsp server setup here
                -- return true if you don't want this server to be setup with lspconfig
                ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
                setup = {
                    -- example to setup with typescript.nvim
                    -- tsserver = function(_, opts)
                    --   require("typescript").setup({ server = opts })
                    --   return true
                    -- end,
                    -- Specify * to use this function as a fallback for any server
                    -- ["*"] = function(server, opts) end,
                },
            }
        end,

        ---@param opts PluginLspOpts
        config = function(plugin, opts)
            if plugin.servers then
                require('util').deprecate(
                    'lspconfig.servers',
                    'lspconfig.opts.servers'
                )
            end
            if plugin.setup_server then
                require('util').deprecate(
                    'lspconfig.setup_server',
                    'lspconfig.opts.setup[SERVER]'
                )
            end

            -- setup formatting and keymaps
            require('util').on_attach(function(client, buffer)
                require('plugins.lsp.format').on_attach(client, buffer)
                require('plugins.lsp.keymaps').on_attach(client, buffer)
            end)

            -- diagnostics
            for name, icon in pairs(require('config.icons').diagnostics) do
                name = 'DiagnosticSign' .. name
                vim.fn.sign_define(
                    name,
                    { text = icon, texthl = name, numhl = '' }
                )
            end
            vim.diagnostic.config {
                underline = true,
                update_in_insert = false,
                virtual_text = { spacing = 4, prefix = '●' },
                severity_sort = true,
            }

            local servers = opts.servers
            local capabilities = require('cmp_nvim_lsp').default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

            require('mason-lspconfig').setup {
                ensure_installed = vim.tbl_keys(servers),
            }
            require('mason-lspconfig').setup_handlers {
                function(server)
                    local server_opts = servers[server] or {}
                    server_opts.capabilities = capabilities
                    if opts.setup[server] then
                        if opts.setup[server](server, server_opts) then
                            return
                        end
                    elseif opts.setup['*'] then
                        if opts.setup['*'](server, server_opts) then
                            return
                        end
                    end
                    require('lspconfig')[server].setup(server_opts)
                end,
            }
        end,
    },

    -- debuggers
    { 'mfussenegger/nvim-dap' },
    {
        'jayp0521/mason-nvim-dap.nvim',
        dependencies = { 'mason.nvim', 'nvim-dap' },
        opts = { automatic_installation = true },
    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-dap' },
        event = 'BufReadPre',
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup()

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open {}
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close {}
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close {}
            end
        end,
    },

    -- formatters
    {
        'jayp0521/mason-null-ls.nvim',
        dependencies = { 'mason.nvim', 'null-ls.nvim' },
        event = 'BufReadPre',
        opts = {
            ensure_installed = nil,
            automatic_installation = true,
            automatic_setup = false,
        },
    },

    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'mason.nvim' },
        opts = function()
            local nls = require('null-ls')
            return {
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
        end,
    },

    -- cmdline tools and lsp servers
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
        ---@param opts MasonSettings | {ensure_installed: string[]}
        config = function(plugin, opts)
            if plugin.ensure_installed then
                require('util').deprecate(
                    'treesitter.ensure_installed',
                    'treesitter.opts.ensure_installed'
                )
            end
            require('mason').setup(opts)
            local mr = require('mason-registry')
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
            ensure_installed = {
                'stylua',
            },
        },
    },
}
