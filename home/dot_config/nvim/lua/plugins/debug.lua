return {
  -- debuggers
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mason.nvim",
      "jayp0521/mason-nvim-dap.nvim",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      -- stylua: ignore
      -- keymap
      vim.keymap.set("n", "<leader>db", "DapToggleBreakpoint", { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dc", "DapContinue", { desc = "Continue" })
      vim.keymap.set("n", "<leader>do", "DapStepOver", { desc = "Step Over" })
      vim.keymap.set("n", "<leader>di", "DapStepInto", { desc = "Step Into" })
      vim.keymap.set("n", "<leader>dO", "DapStepOut", { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dr", "DapToggleRepl", { desc = "Repl" })
      vim.keymap.set("n", "<leader>dw", require("dap.ui.widgets").hover, { desc = "Widgets" })
      vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "Dap UI" })

      require("mason-nvim-dap").setup({
        ensure_installed = { "python" },
        automatic_setup = true,
      })
      require("telescope").load_extension("dap")
    end,
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
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
}
