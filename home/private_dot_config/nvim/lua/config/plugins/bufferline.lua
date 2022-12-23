local M = {
    'akinsho/bufferline.nvim',
}

function M.init()
    local signs = require('config.plugins.lsp.diagnostics').signs

    signs = {
        error = signs.Error,
        warning = signs.Warn,
        info = signs.Info,
        hint = signs.Hint,
    }

    local severities = {
        'error',
        'warning',
        'info',
        'hint',
    }

    require('bufferline').setup {
        options = {
            buffer_close_icon = '',
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(_, _, diag)
                local s = {}
                for _, severity in ipairs(severities) do
                    if diag[severity] then
                        table.insert(s, signs[severity] .. diag[severity])
                    end
                end
                return table.concat(s, ' ')
            end,
            indicator = {
                icon = ' ',
                style = 'icon',
            },
            left_trunc_marker = '',
            modified_icon = '●',
            numbers = function(opts)
                return string.format(
                    '%s·%s',
                    opts.raise(opts.ordinal),
                    opts.lower(opts.id)
                )
            end,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'Nvim Tree',
                    highlight = 'Directory',
                    text_align = 'center',
                },
            },
            right_trunc_marker = '',
            show_close_icon = false,
        },
    }
end

return M
