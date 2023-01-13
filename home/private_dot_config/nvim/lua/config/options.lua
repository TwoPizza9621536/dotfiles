-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
local opt = vim.opt

opt.clipboard = 'unnamedplus' -- sync with system clipboard
opt.cmdheight = 1
opt.colorcolumn = '80,120' -- Rulers for max line column
opt.completeopt = 'menu,menuone,noselect'
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.errorbells = true -- Show cues on error
opt.expandtab = true -- Use spaces instead of tabs
opt.hidden = true -- Enable modified buffers in background
opt.ignorecase = true -- Ignore case
opt.inccommand = 'nosplit' -- preview incremental substitute
opt.joinspaces = false -- No double spaces with join after a dot
opt.laststatus = 0
opt.list = true -- Show invisible and whitespace characters
opt.listchars:append('space:·,eol:↓,nbsp:+') -- Characters for whitespace
opt.mouse = 'a' -- enable mouse mode
opt.modeline = false -- Disable modelines
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { 'buffers', 'curdir', 'tabpages', 'winsize' }
opt.shiftround = true -- Round indent
opt.shiftwidth = 4 -- Size of an indent
opt.showmode = false -- dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = 'yes' -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { 'en' }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 4 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- save swap file and trigger CursorHold
opt.virtualedit = 'all' -- Enable the editing of all columns
opt.visualbell = true -- Enable visual cues
opt.wildmode = 'longest:full,full' -- Command-line completion mode
opt.winminwidth = 5 -- minimum window width
opt.wrap = false -- Disable line wrap

if vim.fn.has('nvim-0.9.0') == 1 then
    opt.splitkeep = 'screen'
    opt.shortmess = 'filnxtToOFWIcC'
end

-- fix markdown indentation settings
vim.g.markdown_recommended_style = 0
