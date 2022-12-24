local M = {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'tpope/vim-fugitive',
    },
    lazy = false,
}

function M.init()
    local vscolors = require('vscode.colors')

    require('vscode').setup {
        disable_nvimtree_bg = true,
        group_overrides = {
            Cursor = {
                fg = vscolors.vscDarkBlue,
                bg = vscolors.vscLightGreen,
                bold = true,
            },
        },
        italic_comments = true,
        transparent = true,
    }

    -- Port the bubblegum theme from vim-airlines
    local colors = {
        dark_gray = '#303030',
        med_gray_hi = '#444444',
        med_gray_lo = '#3a3a3a',
        light_gray = '#b2b2b2',
        green = '#afd787',
        blue = '#87afd7',
        purple = '#afafd7',
        orange = '#d7af5f',
        red = '#d78787',
        pink = '#d7afd7',
    }

    local bubblegum = {
        normal = {
            a = { bg = colors.green, fg = colors.dark_gray },
            b = { bg = colors.med_gray_lo, fg = colors.light_gray },
            c = { bg = colors.med_gray_hi, fg = colors.green },
        },
        insert = {
            a = { bg = colors.blue, fg = colors.med_gray_hi },
            c = { bg = colors.med_gray_hi, fg = colors.blue },
        },
        visual = {
            a = { bg = colors.pink, fg = colors.dark_gray },
            c = { bg = colors.med_gray_hi, fg = colors.pink },
        },
        replace = {
            a = { bg = colors.red, fg = colors.dark_gray },
            c = { bg = colors.med_gray_hi, fg = colors.red },
        },
        inactive = {
            a = { bg = colors.med_gray_hi, fg = colors.light_gray },
            b = { bg = colors.med_gray_hi, fg = colors.light_gray },
            c = { bg = colors.med_gray_hi, fg = colors.light_gray },
        },
    }

    require('lualine').setup {
        extensions = {
            'man',
            'fugitive',
            'nvim-dap-ui',
            'nvim-tree',
        },
        options = {
            globalstatus = true,
            theme = bubblegum,
        },
        sections = {
            -- Use vim-airline defaults for sections X, Y and Z.
            lualine_x = { 'filetype' },
            lualine_y = { 'encoding', 'fileformat' },
            lualine_z = { '%p%% :%l/%L ☰ :%v' },
        },
    }
end

return M
