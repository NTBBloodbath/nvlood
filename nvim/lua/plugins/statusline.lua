return function()
    -- Disable built-in tabline
    vim.g.bubbly_tabline = 0

    vim.g.bubbly_palette = {
        background = "#111219",
        foreground = "#c5cdd9",
        black = "#111219",
        red = "#c2616b",
        green = "#63876f",
        yellow = "#deb974",
        blue = "#5d8fac",
        purple = "#6f78be",
        cyan = "#5dbbc1",
        white = "#898da6",
        lightgrey = "#57595e",
        darkgrey = "#404247",
    }
    vim.g.bubbly_colors = {
        total_buffer_number = 'red',
    }
    vim.g.bubbly_styles = {
        total_buffer_number = 'bold',
    }

    vim.g.bubbly_statusline = {
        'mode',
        'filetype',
        'path',

        'truncate',
        'builtinlsp.diagnostic_count',
        'builtinlsp.current_function',
        'divisor',

        'branch',
        'signify',

        'total_buffer_number',
        'progress',
    }
end
