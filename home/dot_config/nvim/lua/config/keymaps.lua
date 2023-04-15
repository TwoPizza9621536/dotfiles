require("which-key").register({
  mode = { "n", "v" },
  ["<leader>d"] = { name = "+debug" },
  ["<leader>n"] = { name = "+generate" },
})

-- Enable modeline if mode line is safe
vim.keymap.set(
  "n",
  "<leader>cM",
  ":setlocal modeline <bar> doautocmd BufRead<cr>",
  { desc = "Enable Modeline"}
)
