return {
  -- debuggers
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "mason.nvim",
      "jayp0521/mason-nvim-dap.nvim",
    },
    config = function(_, opts)
      require("mason-nvim-dap").setup({
        automatic_setup = true,
      })

      local servers = opts.servers
      require("mason-nvim-dap").setup_handlers({
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
      })
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
