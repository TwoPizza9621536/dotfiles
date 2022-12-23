if not vim.g.vscode then
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system{
          "git",
          "clone",
          "--filter=blob:none",
          "--single-branch",
          "git@github.com:folke/lazy.nvim.git",
          lazypath,
        }
    end

    vim.opt.runtimepath:prepend(lazypath)

    require('lazy').setup('config.plugins', {
        defaults = { lazy = true },
        performance = {
            rtp = {
                disabled_plugins = {
                    'gzip',
                    'matchparen',
                    'netrwPlugin',
                    'tarPlugin',
                    'tohtml',
                    'tutor',
                    'zipPlugin',
                },
            },
        },
    })
end
