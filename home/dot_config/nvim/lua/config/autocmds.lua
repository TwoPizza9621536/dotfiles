-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("set_two_space_indent"),
  pattern = {
    "javascript",
    "javascriptreact",
    "json",
    "jsonc",
    "lua",
    "typescript",
    "typescriptreact",
  },
  callback = function()
    vim.opt_local.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup("set_eight_space_indent"),
  pattern = { "markdown" },
  callback = function()
    vim.opt_local.shiftwidth = 8
  end,
})
