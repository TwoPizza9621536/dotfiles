return {
  -- Add debuggers
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "python",
      },
    },
  },

  {
    "nvim-telescope/telescope-dap.nvim",
    dependencies = "nvim-dap",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
}
