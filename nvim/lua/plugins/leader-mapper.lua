--- Require vimpeccable
-- https://github.com/svermeulen/vimpeccable
vimp = require("vimp")

---[[----------]]---
--    Wrappers    --
---]]----------[[---
-- g, access to vim global variables
g = vim.g

----------------------------------------------------

return function()
    ---- Define prefix dictionary
    lmap = {}

    --- Terminal Menu
    lmap.T = {name = "Terminal Menu"}
    lmap.T.o = "Open a new terminal"

    --- LSP Menu
    lmap.l = {name = "LSP Menu"}
    lmap.l.D = "Show type definition"
    lmap.l.e = "Show line diagnostics"
    lmap.l.q = "Diagnostics into location list"

    --- Git Menu
    lmap.g = {name = "Git Menu"}
    lmap.g.o = "Open LazyGit"
    lmap.g.P = "Pull"
    lmap.g.p = "Push"
    lmap.g.s = "Status"

    --- Plugin Menu
    lmap.p = {name = "Plugin Menu"}
    lmap.p.C = "Run when you make changes to your plugins"
    lmap.p.c = "Clean disabled or unused plugins"
    lmap.p.i = "Install missing plugins"
    lmap.p.s = "Performs PackerClean and then PackerUpdate"
    lmap.p.u = "Update your plugins"
    lmap.p.r = "Reload your plugins, useful when modifying configs"

    --- Buffer Menu
    lmap.b = {name = "Buffer Menu"}
    lmap.b["1"] = "Buffer 1"
    lmap.b["2"] = "Buffer 2"
    lmap.b["3"] = "Buffer 3"
    lmap.b["4"] = "Buffer 4"
    lmap.b["5"] = "Buffer 5"
    lmap.b["6"] = "Buffer 6"
    lmap.b["7"] = "Buffer 7"
    lmap.b["8"] = "Buffer 8"
    lmap.b["9"] = "Last buffer"
    lmap.b.c = "Close buffer"
    lmap.b.f = "Format buffer"
    lmap.b.n = "Next buffer"
    lmap.b.P = "Pick buffer"
    lmap.b.p = "Previous buffer"

    --- Order Buffer Menu
    lmap.o = {name = "Order Buffer Menu"}
    lmap.o.d = "Sort by directory"
    lmap.o.l = "Sort by language"
    lmap.o.n = "Re-order buffer to next"
    lmap.o.p = "Re-order buffer to previous"

    --- File Menu
    lmap.f = {name = "File Menu"}
    lmap.f.b = "Bookmarks"
    lmap.f.c = "Edit Neovim configuration"
    lmap.f.f = "Find file"
    lmap.f.g = "Find word"
    lmap.f.t = "Help Tags"
    lmap.f.w = "Write file with sudo permissions (For unwritable files)"
    lmap.f.r = "Re-open file with sudo permissions (For unreadable files only!)"
    lmap.f.h = "Recently opened files"
    lmap.f.n = "Create a new unnamed buffer"

    --- Window Menu
    lmap.w = {name = "Window Menu"}
    lmap.w.C = "Close all other windows"
    lmap.w.c = "Close current window"
    lmap.w.h = "Split horizontally"
    lmap.w.v = "Split vertically"

    --- Runner Menu
    lmap.r = {name = "Runner Menu"}
    lmap.r.b = "Run the selected block"
    lmap.r.c = "Clear the REPL memory, useful when memory is corrupted by bad code"
    lmap.r.h = "Run dot-http on the line that the cursor is currently on"
    lmap.r.i = "Display available interpreters information"
    lmap.r.R = "Reset SnipRun, useful when you did an infinite loop or it takes longer"
    lmap.r.r = "Run the entire buffer content"
    lmap.r.t = "Same as Reset but does not cleans the cache directory"

    --- Toggle Menu
    lmap.t = {name = "Toggle Menu"}
    lmap.t.c = "Change colorscheme"
    lmap.t.M = "Toggle Markdown preview"
    lmap.t.m = "Toggle Minimap"
    lmap.t.n = "Toggle Line Numbers"
    lmap.t.q = "Auto toggle nvim-bqf"
    lmap.t.s = "Open start screen"
    lmap.t.T = "Toggle Tags view"
    lmap.t.t = "Toggle Tree Explorer"

    --- Register the dictionary
    g.lmap = lmap
    vim.api.nvim_exec(
    [[
        call leaderGuide#register_prefix_descriptions('<Space>', 'g:lmap')
	nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
	vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>
    ]], true)
end
