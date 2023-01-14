-- From https://github.com/LazyVim/LazyVim
-- Apache License 2.0
---@type LazyVimConfig
local M = {}

---@class LazyVimConfig
local defaults = {
    -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
    ---@type string|fun()
    colorscheme = function()
        require("vscode").setup { italic_comments = true }
    end,
}

---@type LazyVimConfig
local options

---@param opts? LazyVimConfig
function M.setup(opts)
    options = vim.tbl_deep_extend("force", defaults, opts or {})

    if vim.fn.argc() == 0 then
        -- autocmds and keymaps can wait to load
        vim.api.nvim_create_autocmd("User", {
            group = vim.api.nvim_create_augroup("NeoVim", { clear = true }),
            pattern = "VeryLazy",
            callback = function()
                M.load("autocmds")
                M.load("keymaps")
            end,
        })
    else
        -- load them now so they affect the opened buffers
        M.load("autocmds")
        M.load("keymaps")
    end

    require("lazy.core.util").try(function()
        if type(M.colorscheme) == "function" then
            M.colorscheme()
        else
            vim.cmd.colorscheme(M.colorscheme)
        end
    end, {
        msg = "Could not load your colorscheme",
        on_error = function(msg)
            require("lazy.core.util").error(msg)
            vim.cmd.colorscheme("habamax")
        end,
    })
end

---@param range? string
function M.has(range)
    local Semver = require("lazy.manage.semver")
    return Semver.range(range):matches(require("lazy.core.config").version)
end

---@param name "autocmds" | "options" | "keymaps"
function M.load(name)
    local Util = require("lazy.core.util")
    for _, mod in ipairs { "config." .. name } do
        Util.try(function()
            require(mod)
        end, {
            msg = "Failed loading " .. mod,
            on_error = function(msg)
                local modpath = require("lazy.core.cache").find(mod)
                if modpath then
                    Util.error(msg)
                end
            end,
        })
    end
    if vim.bo.filetype == "lazy" then
        -- HACK: LazyVim may have overwritten options of the Lazy ui, so reset this here
        vim.cmd([[do VimResized]])
    end
end

setmetatable(M, {
    __index = function(_, key)
        if options == nil then
            M.setup()
        end
        ---@cast options LazyVimConfig
        return options[key]
    end,
})

return M
