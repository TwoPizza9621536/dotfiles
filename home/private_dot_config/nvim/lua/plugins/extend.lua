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

    -- add telescope extensions
    {
        "nvim-telescope/telescope.nvim",
        keys = {
            {
                "<space>fb",
                ":Telescope file_browser",
                { noremap = true },
            },
        },
        dependencies = {
            "benfowler/telescope-luasnip.nvim",
            "nvim-telescope/telescope-dap.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        config = function(_, opts)
            local telescope = require("telescope")

            telescope.setup(opts)
            telescope.load_extension("dap")
            telescope.load_extension("file_browser")
            telescope.load_extension("fzf")
            telescope.load_extension("luasnip")
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

    -- Handle cmp docs with noice
    {
        "folke/noice.nvim",
        opts = {
            lsp = {
                override = {
                    ["cmp.entry.get_documentation"] = true,
                },
            },
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
                dashboard.button("SPC l", "鈴 " .. " Lazy", ":Lazy<CR>"),
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