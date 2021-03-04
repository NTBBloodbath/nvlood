-- https://github.com/kevinhwang91/nvim-bqf#advanced-configuration
bqf = require('bqf')

return function()
    bqf.setup({
        auto_enable = true,
        magic_window = true,
        auto_resize_height = true
        preview = {
            auto_preview = true,
            win_height = 12,
            win_vheight = 12,
            delay_syntax = 80,
            border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'}
        }
    })
end
