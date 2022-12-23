local M = {
    'glepnir/dashboard-nvim',
    lazy = false,
}

function M.config()
    -- Header from https://patorjk.com/software/taag/
    local db = require('dashboard')

    db.custom_header = {
        [[    ____                  _    ___         ]],
        [[   / __ \__  ____  ______| |  / (_)___ ___ ]],
        [[  / /_/ / / / / / / / __ \ | / / / __ `__ \]],
        [[ / ____/ /_/ / /_/ / /_/ / |/ / / / / / / /]],
        [[/_/    \__,_/\__, /\____/|___/_/_/ /_/ /_/ ]],
        [[            /____/                         ]],
    }

    db.custom_center = {
        {
            action = 'DashboardNewFile',
            desc = 'New File                        ',
            icon = '   ',
            shortcut = 'SPC f n',
        },
        {
            action = 'SessionManager load_last_session',
            desc = 'Recent Session                  ',
            icon = '   ',
            shortcut = 'SPC s l',
        },
        {
            action = 'Telescope oldfiles',
            desc = 'Recent Files                    ',
            icon = '   ',
            shortcut = 'SPC f r',
        },
        {
            action = 'Telescope find_files find_command=rg,--hidden,--files',
            desc = 'Find  File                      ',
            icon = '   ',
            shortcut = 'SPC f f',
        },
        {
            action = 'Telescope file_browser',
            desc = 'File Browser                    ',
            icon = '   ',
            shortcut = 'SPC f b',
        },
    }
end

return M
