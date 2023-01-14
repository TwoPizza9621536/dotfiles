-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
return {
    -- better vim.notify
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss { silent = true, pending = true }
                end,
                desc = "Delete all Notifications",
            },
        },
        opts = {
            background_colour = "#000000",
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
    },

    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        init = function()
            vim.ui.select = function(...)
                require("lazy").load { plugins = { "dressing.nvim" } }
                return vim.ui.select(...)
            end
            vim.ui.input = function(...)
                require("lazy").load { plugins = { "dressing.nvim" } }
                return vim.ui.input(...)
            end
        end,
    },

    -- noicer ui
    {
        "j-hui/fidget.nvim",
        enabled = false,
        event = "BufReadPre",
        config = function(_, opts)
            require("fidget").setup(opts)
        end,
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        keys = {
            {
                "<S-Enter>",
                function()
                    require("noice").redirect(vim.fn.getcmdline())
                end,
                mode = "c",
                desc = "Redirect Cmdline",
            },
            {
                "<leader>snl",
                function()
                    require("noice").cmd("last")
                end,
                desc = "Noice Last Message",
            },
            {
                "<leader>snh",
                function()
                    require("noice").cmd("history")
                end,
                desc = "Noice History",
            },
            {
                "<leader>sna",
                function()
                    require("noice").cmd("all")
                end,
                desc = "Noice All",
            },
            {
                "<c-f>",
                function()
                    if not require("noice.lsp").scroll(4) then
                        return "<c-f>"
                    end
                end,
                silent = true,
                expr = true,
                desc = "Scroll forward",
            },
            {
                "<c-b>",
                function()
                    if not require("noice.lsp").scroll(-4) then
                        return "<c-b>"
                    end
                end,
                silent = true,
                expr = true,
                desc = "Scroll backward",
            },
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
            },
            routes = {
                {
                    view = "notify",
                    filter = { event = "msg_showmode" },
                },
            },
        },
    },

    -- dashboard
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        config = function(_, dashboard)
            vim.b.miniindentscope_disable = true

            -- close Lazy and re-open when the dashboard is ready
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end

            require("alpha").setup(dashboard.opts)

            vim.api.nvim_create_autocmd("User", {
                pattern = "NeoVimStarted",
                callback = function()
                    local stats = require("lazy").stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    dashboard.section.footer.val = "⚡ Neovim loaded "
                        .. stats.count
                        .. " plugins in "
                        .. ms
                        .. "ms"
                    pcall(vim.cmd.AlphaRedraw)
                end,
            })
        end,
        opts = function()
            local dashboard = require("alpha.themes.dashboard")
            local logo = [[
    ____                  _    ___
   / __ \__  ____  ______| |  / (_)___ ___
  / /_/ / / / / / / / __ \ | / / / __ `__ \
 / ____/ /_/ / /_/ / /_/ / |/ / / / / / / /
/_/    \__,_/\__, /\____/|___/_/_/ /_/ /_/
            /____/
]]

            dashboard.section.header.val = vim.split(logo, "\n")
            dashboard.section.buttons.val = {
                dashboard.button(
                    "f",
                    " " .. " Find file",
                    ":Telescope find_files <CR>"
                ),
                dashboard.button(
                    "n",
                    " " .. " New file",
                    ":ene <BAR> startinsert <CR>"
                ),
                dashboard.button(
                    "r",
                    " " .. " Recent files",
                    ":Telescope oldfiles <CR>"
                ),
                dashboard.button(
                    "g",
                    " " .. " Find text",
                    ":Telescope live_grep <CR>"
                ),
                dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
                dashboard.button(
                    "s",
                    " " .. " Restore Session",
                    [[:lua require("persistence").load() <cr>]]
                ),
                dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
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

    -- icons
    "nvim-tree/nvim-web-devicons",

    -- ui components
    "MunifTanjim/nui.nvim",
}
