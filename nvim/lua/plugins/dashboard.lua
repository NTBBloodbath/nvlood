return function()
    -- Default fuzzy search plugin
    vim.g.dashboard_default_executive = "telescope"
    -- Get Neovim version
    nvim_version = string.gsub(string.match(vim.fn.execute("version"), "v.-\n"), "\n", "")
    -- Custom dashboard header
    vim.g.dashboard_custom_header = {
	    "",
	    "       ▄▄        ▄▄                                                    ",
	    "     ▄████       ███▄                               ▄▄                 ",
	    "   ▄ ▀█████▄     █████                              ▀▀                 ",
	    "   ▌ ▀▄██████    █████  ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄  ",
	    "   ▌    ▀█████▄  █████ ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██ ",
	    "   ▌   ▐  ██████ █████ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██ ",
	    "   ▌   ▐   ▀█████▄████ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██ ",
	    "   ▌   ▐    ▀█████▄▀██  ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀ ",
	    "   ▀   ▐      ▀█████ █                                                 ",
	    "     ▀▄▐       ▀████                                                   ",
	    "       ▀         ▀                                                     ",
	    "                            version: " .. nvim_version .. "            "
    }

    --- Custom dashboard footer
    -- See how much plugins are there
    plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
    vim.g.dashboard_custom_footer = {"Neovim loaded " .. plugins_count .. " plugins"}
    -- Headercolor
    vim.cmd("hi! dashboardHeader   guifg=#c3e88d")
    vim.cmd("hi! dashboardCenter   guifg=#89ddff")
    vim.cmd("hi! dashboardShortcut guifg=#c792ea")
    vim.cmd("hi! dashboardFooter   guifg=#676E95")
end
