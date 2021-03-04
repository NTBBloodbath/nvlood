-- Access to global vars
g = vim.g

-------------------------------------------------------------------------------

return function()
    -- set to true, nvim will open the preview window after entering
    -- the markdown buffer
    -- default: false
    g.mkdp_auto_start = false
    -- set to true, the nvim will auto close current preview window when change
    -- from markdown buffer to another buffer
    -- default: true
    g.mkdp_auto_close = true
    -- set to true, the vim will refresh markdown when save the buffer or
    -- leave from insert mode, default false is auto refresh markdown as you edit
    -- or move the cursor
    -- default: false
    g.mkdp_refresh_slow = true
    -- set to true, echo preview page url in command line when open preview page
    -- default is false
    g.mkdp_echo_preview_url = true
    -- use a custom port to start server or random for empty
    g.mkdp_port = '5000'
    -- preview page title
    -- ${name} will be replace with the file name
    g.mkdp_page_title = '「${name}」'
    -- recognized filetypes
    -- these filetypes will have MarkdownPreview... commands
    g.mkdp_filetypes = {'markdown'}
end
