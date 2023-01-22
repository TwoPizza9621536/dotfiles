return {
    -- add additional lsp
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            ---@type lspconfig.options
            servers = {
                -- Lua
                sumneko_lua = {
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                -- Python
                pyright = {},
                jedi_language_server = {},
            },
        },
    },

    -- add mason lsp tools
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- add mason to install null-ls tools
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "jayp0521/mason-null-ls.nvim" },
        config = function(_, opts)
            require("null-ls").setup(opts)
            require("mason-null-ls").setup {
                ensure_installed = nil,
                automatic_installation = true,
                automatic_setup = false,
            }
        end,
        opts = function()
            local nls = require("null-ls")
            return {
                sources = {
                    -- Spelling
                    nls.builtins.code_actions.cspell,
                    nls.builtins.completion.spell,
                    nls.builtins.diagnostics.cspell.with {
                        diagnostics_postprocess = function(diagnostic)
                            diagnostic.severity = vim.diagnostic.severity.INFO
                        end,
                        disabled_filetypes = {
                            "alpha",
                            "dashboard",
                            "help",
                            "lazy",
                            "neo-tree",
                            "TelescopePrompt",
                            "Trouble",
                        },
                    },
                    -- Lua
                    nls.builtins.formatting.stylua,
                    -- Markdown
                    nls.builtins.diagnostics.markdownlint,
                    -- Python
                    nls.builtins.diagnostics.flake8,
                    nls.builtins.diagnostics.pylint,
                    nls.builtins.formatting.autopep8,
                    nls.builtins.formatting.black.with {
                        extra_args = { "-l", "79" },
                    },
                    nls.builtins.formatting.isort,
                },
            }
        end,
    },

    -- debuggers
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "mason.nvim",
            "jayp0521/mason-nvim-dap.nvim",
        },
        config = function(_, opts)
            require("mason-nvim-dap").setup {
                automatic_setup = true,
            }

            local servers = opts.servers
            require("mason-nvim-dap").setup_handlers {
                function(server)
                    local server_opts = servers[server] or {}
                    if opts.setup[server] then
                        if opts.setup[server](server, server_opts) then
                            return
                        end
                    elseif opts.setup["*"] then
                        if opts.setup["*"](server, server_opts) then
                            return
                        end
                    end
                    require("mason-nvim-dap.automatic_setup")(server)
                end,
            }
        end,
        opts = {
            servers = { debugpy = {} },
            setup = {},
        },
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "nvim-dap" },
        event = "BufReadPost",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open {}
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close {}
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close {}
            end
        end,
    },
}
