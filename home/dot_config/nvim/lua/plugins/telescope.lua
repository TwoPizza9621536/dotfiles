return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<space>fB",
        "<cmd>Telescope file_browser<cr>",
        desc = "Telescope File Browser",
        { noremap = true },
      },
    },
    dependencies = {
      {
        "benfowler/telescope-luasnip.nvim",
        config = function()
          require("telescope").load_extension("luasnip")
        end,
      },
      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-media-files.nvim",
        config = function()
          require("telescope").load_extension("media_files")
        end,
      },
      {
        "nat-418/telescope-color-names.nvim",
        config = function()
          require("telescope").load_extension("color_names")
        end,
      },
      {
        "tsakirist/telescope-lazy.nvim",
        config = function()
          require("telescope").load_extension("lazy")
        end,
      }
    },
  },
}
