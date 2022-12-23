-- Leader Key
vim.g.mapleader = ' '

-- Disable Modeline
vim.opt.modeline = false

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true

-- Line Numbers and Rulers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '80,120'

-- Disable Wrapping
vim.opt.wrap = false

-- Virtual Edit
vim.opt.virtualedit = 'all'

-- Terminal Colors
vim.opt.termguicolors = true

-- Show Whitespace
vim.opt.list = true
vim.opt.listchars:append('space:·,eol:↓,extends:>,precedes:<,nbsp:+')

-- Mouse Support
vim.opt.mouse = 'a'
vim.opt.mousemoveevent = true

-- Cursor
vim.opt.cursorline = true

-- Cues
vim.opt.errorbells = true
vim.opt.visualbell = true

-- Title
vim.opt.title = true
vim.opt.titlestring = '%F'

-- Update Time
vim.opt.updatetime = 300

-- Sign Column
vim.opt.signcolumn = 'yes'
