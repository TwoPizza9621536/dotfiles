require("which-key").register {
    mode = { "n", "v" },
    ["<leader>d"] = { name = "+debug" },
    ["<leader>n"] = { name = "+generate" },
}

-- Debugger
vim.keymap.set(
    "n",
    "<leader>db",
    "DapToggleBreakpoint",
    { desc = "Toggle Breakpoint" }
)
vim.keymap.set("n", "<leader>dc", "DapContinue", { desc = "Continue" })
vim.keymap.set("n", "<leader>do", "DapStepOver", { desc = "Step Over" })
vim.keymap.set("n", "<leader>di", "DapStepInto", { desc = "Step Into" })
vim.keymap.set("n", "<leader>dO", "DapStepOut", { desc = "Step Out" })
vim.keymap.set("n", "<leader>dr", "DapToggleRepl", { desc = "Repl" })
vim.keymap.set(
    "n",
    "<leader>dw",
    require("dap.ui.widgets").hover,
    { desc = "Widgets" }
)
vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "Dap UI" })
