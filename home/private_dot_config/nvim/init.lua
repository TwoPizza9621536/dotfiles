-- Condition for lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

-- Load the rest of the config
require("util").lazy_notify()

require("config").load("options")
require("config").setup()
