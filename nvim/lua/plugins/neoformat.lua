-- Access to global vars
g = vim.g

---------------------------------

return function()
    --- Enable basic formatting when a ft is not found
    -- Enable alignment
    g.neoformat_basic_format_align = true
    -- Enable tab to spaces conversion
    g.neoformat_basic_format_retab = true
    -- Enable trimming of trailing whitespace
    g.neoformat_basic_format_trim = true
    -- Run all the formatters if the defined below fails
    g.neoformat_run_all_formatters = true
    -- Only message when there is an error
    g.neoformat_only_msg_on_error = true
    --- Enabled formatters for different filetypes
    g.neoformat_enabled_toml = {"prettier"}
    g.neoformat_enabled_python = {"yapf"}
    g.neoformat_enabled_javascript = {"javascript"}
end
