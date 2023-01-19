return {
    -- add treesitter extensions and parsers
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "p00f/nvim-ts-rainbow",
        },
        opts = {
            context_commentstring = { enable = true, enable_autocmd = false },
            rainbow = { enable = true },
        },
    },

    -- add cpm-emoji and cmp-dap
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-emoji", "rcarriga/cmp-dap" },
        config = function(_, opts)
            local cmp = require("cmp")
            cmp.setup(opts)
            cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
                sources = {
                    { name = "dap" },
                },
            })
        end,
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.sources = cmp.config.sources(
                vim.list_extend(opts.sources, { { name = "emoji" } })
            )
            opts.enabled = function()
                return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                    or require("cmp_dap").is_dap_buffer()
            end
        end,
    },

    -- add telescope extensions
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "benfowler/telescope-luasnip.nvim",
            "nvim-telescope/telescope-dap.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function(_, opts)
            local telescope = require("telescope")

            telescope.setup(opts)
            telescope.load_extension("fzf")
            telescope.load_extension("luasnip")
            telescope.load_extension("dap")
            telescope.load_extension("notify")
        end,
    },

    -- Set notify background_color to transparent
    {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#000000",
        },
    },

    -- dashboard
    {
        "goolord/alpha-nvim",
        opts = function()
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.buttons.val = {
                dashboard.button(
                    "SPC ff",
                    " " .. " Find file",
                    ":Telescope find_files <CR>"
                ),
                dashboard.button(
                    "SPC fn",
                    " " .. " New file",
                    ":ene <BAR> startinsert <CR>"
                ),
                dashboard.button(
                    "SPC fr",
                    " " .. " Recent files",
                    ":Telescope oldfiles <CR>"
                ),
                dashboard.button(
                    "SPC sg",
                    " " .. " Find text",
                    ":Telescope live_grep <CR>"
                ),
                dashboard.button(
                    "SPC qs",
                    " " .. " Restore Session",
                    [[:lua require("persistence").load() <cr>]]
                ),
                dashboard.button("SPC l", "鈴" .. " Lazy", ":Lazy<CR>"),
                dashboard.button("q", " " .. " Quit", ":qa<CR>"),
            }
            for _, button in ipairs(dashboard.section.buttons.val) do
                button.opts.hl = "AlphaButtons"
                button.opts.hl_shortcut = "AlphaShortcut"
            end
            dashboard.section.footer.opts.hl = "Type"
            dashboard.section.header.opts.hl = "AlphaHeader"
            dashboard.section.buttons.opts.hl = "AlphaButtons"
            dashboard.opts.layout[1].val = 8
            return dashboard
        end,
    },
}
