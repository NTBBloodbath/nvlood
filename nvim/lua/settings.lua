---[[----------------------]]---
--    Vim-related wrappers    --
---]]----------------------[[---
-- Access to global variables
local g = vim.g
-- Editor options like :set
local o = vim.o
-- Window-scoped options like cursorcolumn
local wo = vim.wo
-- Buffer-scoped options like buflisted
local bo = vim.bo
-- Neovim autocmds
local nvim_cmd = vim.api.nvim_command

---------------------------------------------

---[[--------------------]]---
--         Settings         --
---]]--------------------[[---

---[[------------------]]---
--     Global options     --
---]]------------------[[---
-- The encoding written to file
o.encoding = "utf-8"
-- Enable your mouse, thanks god!
o.mouse = "a"
-- We do not need to see things like -- INSERT -- anymore
o.showmode = false
-- Increased for lsp code actions
o.updatetime = 100
-- Needed for nvim-compe
o.completeopt = "menu,menuone,preview,noselect"
-- Use system clipboard by default
o.clipboard = "unnamedplus"
-- No swap files anymore
g.noswapfile = true
-- Change terminal title to name of file
o.title = true
-- Improve default splitting, C-w = normalize split sizes
o.splitright = true
o.splitbelow = true
-- Keep buffer window open, esp the terminal, toggle buffers without saving
o.hidden = true
-- Live substitution
o.inccommand = "split"

---[[------------------]]---
--     Window options     --
---]]------------------[[---
-- Set relative numbers
wo.number = true
wo.relativenumber = true
-- No wrap file content
wo.wrap = false
-- So that I can see `` in markdown files
wo.conceallevel = 0
-- Gutter space for lsp info on left
wo.signcolumn = "yes"
-- Scroll when X chars from top/bottom
wo.scrolloff = 4

---[[------------------]]---
--     Buffer options     --
---]]------------------[[---
-- File encoding
bo.fileencoding = "utf-8"
-- Stop newline continuation of comments
bo.formatoptions = bo.formatoptions .. "cro"
-- Search recursively with :find [*]part-of-filename [tab]
bo.path = "**"
-- Converts tabs to spaces
bo.expandtab = true
-- Insert 4 spaces for a tab
bo.tabstop = 4
-- Number of space characters inserted for indentation
bo.shiftwidth = 4

---[[----------------]]---
--     Autocommands     --
---]]----------------[[---
-- Automatically enter insert mode on new terminals
nvim_cmd([[
    augroup terminsert
        autocmd TermOpen * startinsert
    augroup END
]])
-- Save everytime cuz I'm lazy
nvim_cmd([[
    augroup autosave
        autocmd TextChanged,TextChangedI <buffer> silent! write
    augroup END
]])
-- Format on save, why not? Remember that I'm lazy
nvim_cmd([[
    augroup format_save
        autocmd BufWritePre * undojoin | Neoformat
    augroup END
]])
-- Preserve last editing position
nvim_cmd([[
    augroup preserve_pos
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
    augroup END
]])
