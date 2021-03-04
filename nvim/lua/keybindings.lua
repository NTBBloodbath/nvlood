--- Require vimpeccable
-- https://github.com/svermeulen/vimpeccable
vimp = require('vimp')

---[[----------]]---
--    Wrappers    --
---]]----------[[---
-- g, access to vim global variables
g = vim.g
-- fn, call vim functions
fn = vim.fn
-- wo, Window options
wo = vim.wo
-- Neovim autocmds
nvim_cmd = vim.api.nvim_command
-- nnoremap
-- e.g. nnoremap('<leader>n', function() [...] end)
nnoremap = vimp.nnoremap
-- inoremap
-- e.g. same as nnoremap but using i for insert mode
inoremap = vimp.inoremap
-- vnoremap
-- e.g. same as nnoremap but using v for visual mode
vnoremap = vimp.vnoremap

---------------------------------------------

-- escape terminal codes and Vim keycodes
-- extracted from nanotee/nvim-lua-guide
-- https://github.com/nanotee/nvim-lua-guide#vimapinvim_replace_termcodes
local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
end

---------------------------------------------

-- Define leader key to space
-- and call leader mapper
vim.api.nvim_set_keymap("n", "<Space>", "<Nop>", { noremap = true })
g.mapleader = " "

---------------------------------------------

---[[----------------------------------]]---
--                                        --
--         Custom Key Mappings            --
--                                        --
--  <leader>b  = Buffer Menu              --
--  <leader>f  = File Menu                --
--  <leader>g  = Git Menu                 --
--  <leader>p  = Plugin Menu              --
--  <leader>r  = Runner Menu              --
--  <leader>T  = Toggle Menu              --
--  <leader>t  = Terminal Menu            --
--  <leader>w  = Window Menu              --
--                                        --
--         TAB = Cycle buffers            --
--         ESC = Search highlighting off  --
--          F2 = Toggle Tagbar            --
--          F3 = Toggle Tree Explorer     --
--          F4 = Toggle Minimap           --
--          F5 = Toggle distraction-free  --
--          F6 = Run dot-http             --
--          F7 = Toggle markdown preview  --
--                                        --
---]]----------------------------------[[---

---------------------------------------------

---[[-------------------]]---
--     LSP Keybindings     --
---]]-------------------[[---
-- https://github.com/hrsh7th/nvim-compe#mappings
inoremap("<silent><expr> <C-Space>", function()
    vim.fn["compe#complete"]()
end)
inoremap("<silent><expr> <CR>", function()
    vim.fn["compe#confirm"]("<CR>")
end)
inoremap("<silent><expr> <C-e>", function()
    vim.fn["compe#close"]("<C-e>")
end)
inoremap("<silent><expr> <TAB>", "v:lua.smart_tab()")
inoremap("<expr><S-TAB>", "v:lua.smart_tab()")


---[[----------------------]]---
--     Leader Keybindings     --
---]]----------------------[[---
--- Terminal Menu
-- Avoid having line numbers inside the terminal buffer
-- because that is not from God lmao
function toggle_term()
    wo.number = false
    wo.relativenumber = false
    fn.execute("ToggleTerm")
end
-- Open a new terminal
nnoremap("<leader>To", ":lua toggle_term()<CR>")

--- LSP Menu
-- Show type definition
nnoremap("<leader>lD", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
-- Show line diagnostics
nnoremap("<leader>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
-- Diagnostics into location list
nnoremap("<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")

--- Git Menu
-- Open LazyGit
nnoremap("<leader>go", ":LazyGit")
-- Pull
nnoremap("<leader>gP", ":TermExec git pull<CR>")
-- Push
nnoremap("<leader>gp", ":TermExec git push<CR>")
-- Status
nnoremap("<leader>gs", ":TermExec git status<CR>")

--- Plugins Menu
-- PackerCompile, run when you make changes to your plugins
nnoremap("<leader>pC", ":PackerCompile<CR>")
-- Clean disabled or unused plugins
nnoremap("<leader>pc", ":PackerClean<CR>")
-- Install missing plugins
nnoremap("<leader>pi", ":PackerInstall<CR>")
-- Performs PackerClean and then PackerUpdate
nnoremap("<leader>ps", ":PackerSync<CR>")
-- Update your plugins
nnoremap("<leader>pu", ":PackerUpdate<CR>")
-- Reload your plugins, useful when modifying configs
nnoremap("<leader>pr", ":Telescope reloader<CR>")

--- Buffer Menu
-- Go to buffer 1
nnoremap("<leader>b1", ":BufferGoto 1<CR>")
-- Go to buffer 2
nnoremap("<leader>b2", ":BufferGoto 2<CR>")
-- Go to buffer 3
nnoremap("<leader>b3", ":BufferGoto 3<CR>")
-- Go to buffer 4
nnoremap("<leader>b4", ":BufferGoto 4<CR>")
-- Go to buffer 5
nnoremap("<leader>b5", ":BufferGoto 5<CR>")
-- Go to buffer 6
nnoremap("<leader>b6", ":BufferGoto 6<CR>")
-- Go to buffer 7
nnoremap("<leader>b7", ":BufferGoto 7<CR>")
-- Go to buffer 8
nnoremap("<leader>b8", ":BufferGoto 8<CR>")
-- Go to last buffer
nnoremap("<leader>b9", ":BufferLast<CR>")
-- Close current buffer
nnoremap("<leader>bc", ":BufferClose<CR>")
-- Format buffer
nnoremap("<leader>bf", ":Neoformat<CR>")
-- Next buffer
nnoremap("<leader>bn", ":BufferNext<CR>")
-- Pick buffer
nnoremap("<leader>bP", ":BufferPick<CR>")
-- Previous buffer
nnoremap("<leader>bp", ":BufferPrevious<CR>")

--- Order buffer menu
-- Sort by directory
nnoremap("<leader>od", ":BufferOrderByDirectory<CR>")
-- Sort by language
nnoremap("<leader>ol", ":BufferOrderByLanguage<CR>")
-- Re-order buffer to next
nnoremap("<leader>on", ":BufferMoveNext<CR>")
-- Re-order buffer to previous
nnoremap("<leader>op", ":BufferMovePrevious<CR>")

--- File Menu
-- Bookmarks
nnoremap("<leader>fb", ":Telescope marks<CR>")
-- Edit Neovim configuration
nnoremap("<leader>fc", ":e $MYVIMRC<CR>")
-- Find file
nnoremap("<leader>ff", ":Telescope find_files<CR>")
-- Find word
nnoremap("<leader>fg", ":Telescope live_grep<CR>")
-- Help tags
nnoremap("<leader>ft", ":Telescope help_tags<CR>")
-- Write file with sudo permissions (For unwritable files)
nnoremap("<leader>fw", ":SudaWrite<CR>")
-- Re-open file with sudo permissions (For unreadable files only!)
nnoremap("<leader>fr", ":SudaRead<CR>")
-- Override existing telescope <leader>fh mapping
nvim_cmd([[
    autocmd VimEnter * noremap <leader>fh :Telescope oldfiles<CR>
]])
-- Recently opened files
nnoremap("<leader>fh", ":Telescope oldfiles<CR>")
-- Create a new unnamed buffer
nnoremap("<leader>fn", ":new<CR>")

--- Window Menu
-- Close all other windows
nnoremap("<leader>wC", ":only<CR>")
-- Close current window
nnoremap("<leader>wc", ":close<CR>")
-- Split horizontally
nnoremap("<leader>wh", ":split<CR>")
-- Split vertically
nnoremap("<leader>wv", ":vsplit<CR>")

--- Runner Menu
-- Run the selected block
vnoremap("<leader>rb", ":SnipRun<CR>")
-- Clear the REPL memory, useful when memory is corrupted by bad code
nnoremap("<leader>rc", ":SnipReplMemoryClean<CR>")
--- rh is not SnipRun-related!
-- Run dot-http on the line that the cursor is currently on
nnoremap("<leader>rh", ":DotHttp<CR>")
-- Display available interpreters information
nnoremap("<leader>ri", ":SnipInfo<CR>")
-- Reset SnipRun, useful when you did an infinite loop or it takes longer
nnoremap("<leader>rR", ":SnipReset<CR>")
-- Run the entire buffer content
nnoremap("<leader>rr", ":%SnipRun<CR>")
-- Same as Reset but does not cleans the cache directory
nnoremap("<leader>rt", ":SnipTerminate<CR>")

--- Toggle Menu
-- Change colorscheme
nnoremap("<leader>tc", ":Telescope colorscheme<CR>")
-- Toggle Markdown preview
nnoremap("<leader>tM", ":call mkdp#util#toggle_preview()<CR>")
-- Toggle Minimap
nnoremap("<leader>tm", ":MinimapToggle<CR>")
-- Toggle Line Numbers
nnoremap("<leader>tn", ":set number! relativenumber!<CR>")
-- Auto toggle nvim-bqf
nnoremap("<leader>tq", ":BqfToggle<CR>")
-- Open start screen
nnoremap("<leader>ts", ":Dashboard<CR>")
-- Toggle Tags view
nnoremap("<leader>tT", ":Vista!!<CR>")
-- Toggle Tree Explorer
nnoremap("<leader>tt", ":NvimTreeToggle<CR>")

-- tab to cycle buffers too, why not?
vim.api.nvim_exec(
[[
nnoremap <silent><Tab> :bnext<CR>
nnoremap <silent><S-Tab> :bprevious<CR>

" esc to turn off search highlighting
nnoremap <silent><esc> :noh<CR>
]], true)

-- F<N> keybindings
nnoremap("<F2>", ":Vista!!<CR>")
nnoremap("<F3>", ":NvimTreeToggle<CR>")
nnoremap("<F4>", ":MinimapToggle<CR>")
nnoremap("<F5>", ":Goyo<CR>")
nnoremap("<F6>", ":DotHttp<CR>")
nnoremap("<F7>", ":call mkdp#util#toggle_preview()<CR>")

---[[--------------]]---
--    Disable keys    --
---[[--------------]]---
-- disable accidentally pressing ctrl-z and suspending
nnoremap("<c-z>", "<Nop>")

-- disable recording
nnoremap("q", "<Nop>")

-- Set-up vim_buffer_ previewer
nvim_cmd(
[[
    autocmd User TelescopePreviewerLoaded setlocal wrap
]]
)
