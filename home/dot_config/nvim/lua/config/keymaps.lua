local wk = require("which-key")

wk.register({
  mode = { "n", "v" },
  ["<leader>n"] = { name = "+generate" },
})

-- Enable modeline if mode line is safe
wk.register({
  ["cM"] = {
    "<cmd>setlocal modeline <bar> doautocmd BufRead<cr>",
    "Enable Modeline",
  }
})
