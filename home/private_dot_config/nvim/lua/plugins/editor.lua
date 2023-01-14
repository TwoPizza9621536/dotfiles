-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
return {
    -- file explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        keys = {
            {
                "<leader>fe",
                function()
                    require("neo-tree.command").execute {
                        toggle = true,
                        dir = require("util").get_root(),
                    }
                end,
                desc = "Explorer NeoTree (root dir)",
            },
            {
                "<leader>fE",
                "<cmd>Neotree toggle<CR>",
                desc = "Explorer NeoTree (cwd)",
            },
            {
                "<leader>e",
                "<leader>fe",
                desc = "Explorer NeoTree (root dir)",
                remap = true,
            },
            {
                "<leader>E",
                "<leader>fE",
                desc = "Explorer NeoTree (cwd)",
                remap = true,
            },
        },
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
            if vim.fn.argc() == 1 then
                local stat = vim.loop.fs_stat(vim.fn.argv(0))
                if stat and stat.type == "directory" then
                    require("neo-tree")
                end
            end
        end,
        opts = { filesystem = { follow_current_file = true } },
    },

    -- search/replace in multiple files
    {
        "windwp/nvim-spectre",
        keys = {
            {
                "<leader>sr",
                function()
                    require("spectre").open()
                end,
                desc = "Replace in files (Spectre)",
            },
        },
    },

    -- easily jump to any location and enhanced f/t motions for Leap
    {
        "ggandor/leap.nvim",
        dependencies = { "ggandor/flit.nvim", opts = { labeled_modes = "nv" } },
        event = "VeryLazy",
        config = function(_, opts)
            local leap = require("leap")
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings(true)
        end,
    },

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)
            wk.register {
                mode = { "n", "v" },
                ["g"] = { name = "+goto" },
                ["]"] = { name = "+next" },
                ["["] = { name = "+prev" },
                ["<leader><tab>"] = { name = "+tabs" },
                ["<leader>b"] = { name = "+buffer" },
                ["<leader>c"] = { name = "+code" },
                ["<leader>d"] = { name = "+debug" },
                ["<leader>f"] = { name = "+file/find" },
                ["<leader>g"] = { name = "+git" },
                ["<leader>gh"] = { name = "+hunks" },
                ["<leader>q"] = { name = "+quit/session" },
                ["<leader>s"] = { name = "+search" },
                ["<leader>sn"] = { name = "+noice" },
                ["<leader>u"] = { name = "+ui" },
                ["<leader>w"] = { name = "+windows" },
                ["<leader>x"] = { name = "+diagnostics/quickfix" },
            }
        end,
        opts = {
            plugins = { spelling = true },
            key_labels = { ["<leader>"] = "SPC" },
        },
    },

    -- git signs
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = {
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- stylua: ignore start
                map('n', ']h', gs.next_hunk, 'Next Hunk')
                map('n', '[h', gs.prev_hunk, 'Prev Hunk')
                map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>', 'Stage Hunk')
                map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>', 'Reset Hunk')
                map('n', '<leader>ghS', gs.stage_buffer, 'Stage Buffer')
                map('n', '<leader>ghu', gs.undo_stage_hunk, 'Undo Stage Hunk')
                map('n', '<leader>ghR', gs.reset_buffer, 'Reset Buffer')
                map('n', '<leader>ghp', gs.preview_hunk, 'Preview Hunk')
                map('n', '<leader>ghb', function() gs.blame_line({ full = true }) end, 'Blame Line')
                map('n', '<leader>ghd', gs.diffthis, 'Diff This')
                map('n', '<leader>ghD', function() gs.diffthis('~') end, 'Diff This ~')
                map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', 'GitSigns Select Hunk')
            end,
        },
    },

    -- references
    {
        "RRethy/vim-illuminate",
        event = "BufReadPost",
        keys = {
            {
                "]]",
                function()
                    require("illuminate").goto_next_reference(false)
                end,
                desc = "Next Reference",
            },
            {
                "[[",
                function()
                    require("illuminate").goto_prev_reference(false)
                end,
                desc = "Prev Reference",
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
        opts = { delay = 200 },
    },

    -- buffer remove
    {
        "echasnovski/mini.bufremove",
        keys = {
            {
                "<leader>bd",
                function()
                    require("mini.bufremove").delete(0, false)
                end,
                desc = "Delete Buffer",
            },
            {
                "<leader>bD",
                function()
                    require("mini.bufremove").delete(0, true)
                end,
                desc = "Delete Buffer (Force)",
            },
        },
    },

    -- better diagnostics list and others
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" },
        keys = {
            {
                "<leader>xx",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                desc = "Document Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                desc = "Workspace Diagnostics (Trouble)",
            },
        },
        opts = { use_diagnostic_signs = true },
    },

    -- todo comments
    {
        "folke/todo-comments.nvim",
        cmd = { "TodoTrouble", "TodoTelescope" },
        event = "BufReadPost",
        keys = {
            {
                "]t",
                function()
                    require("todo-comments").jump_next()
                end,
                desc = "Next todo comment",
            },
            {
                "[t",
                function()
                    require("todo-comments").jump_prev()
                end,
                desc = "Previous todo comment",
            },
            {
                "<leader>xt",
                "<cmd>TodoTrouble<cr>",
                desc = "Todo Trouble",
            },
            {
                "<leader>xs",
                "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",
                desc = "Todo Trouble Sort",
            },
            { "<leader>xT", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
        },
        config = true,
    },

    -- Scrollbar
    {
        "petertriho/nvim-scrollbar",
        dependencies = "kevinhwang91/nvim-hlslens",
        event = "BufReadPost",
        keys = {
            {
                "n",
                function()
                    vim.cmd([[execute('normal! ' . v:count1 . 'n')]])
                    require("hlslens").start()
                end,
                desc = "Jump to Next Matching Word",
            },
            {
                "N",
                function()
                    vim.cmd([[execute('normal! ' . v:count1 . 'N')]])
                    require("hlslens").start()
                end,
                desc = "Jump to Previous Matching Word",
            },
            {
                "*",
                [[*<cmd>lua require('hlslens').start()<cr>]],
                desc = "Find Next Matching Word",
            },
            {
                "#",
                [[#<cmd>lua require('hlslens').start()<cr>]],
                desc = "Find Previous Matching Word",
            },
            {
                "n",
                "g*",
                [[g*<cmd>lua require('hlslens').start()<cr>]],
                { desc = "Find Next Whole Word" },
            },
            {
                "g#",
                [[g#<cmd>lua require('hlslens').start()<cr>]],
                desc = "Find Previous Whole Word",
            },
        },
        config = function(_, opts)
            require("scrollbar").setup(opts)
            require("hlslens").setup()
            require("scrollbar.handlers.search").setup()
            require("scrollbar.handlers.gitsigns").setup()
        end,
        opts = { handle = { color = "#808080" } },
    },
}
