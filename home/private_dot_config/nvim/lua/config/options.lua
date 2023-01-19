-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.colorcolumn = "80,120" -- Rulers for max line column
opt.listchars:append("space:·,eol:↓,nbsp:+") -- Characters for whitespace
opt.modeline = false -- Disable modelines
opt.shiftwidth = 4 -- Size of an indent
opt.virtualedit = "all" -- Enable the editing of all columns
opt.visualbell = true -- Enable visual cues
