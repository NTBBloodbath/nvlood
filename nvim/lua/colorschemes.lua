---[[----------------------]]---
--    Vim-related wrappers    --
---]]----------------------[[---
-- Access to global variables
local g = vim.g
-- Editor options like :set
local o = vim.o
-- Vim commands like 'colorscheme X'
local cmd = vim.cmd
-- Vim functions like has()
local fn = vim.fn

---[[-----------------]]---
--      Colorscheme      --
---]]-----------------[[---
-- Important
if fn.has('nvim') == 1 then
    o.termguicolors = true
end

-- Sonokai configuration
g.sonokai_style = "andromeda"
g.sonokai_enable_italic = false
g.sonokai_italic_comment = false
g.sonokai_current_word = 'bold'
g.sonokai_better_performance = true
g.sonokai_transparent_background = true

-- Onedark configuration
g.onedark_hide_endofbuffer = true
g.onedark_terminal_italics = false

-- Tokyonight configuration
g.tokyonight_style = 'storm'
g.tokyonight_enable_italic = false


--- Custom colorschemes:
-- dogrun
-- sonokai
-- onedark
-- gruvbox
-- palenight
-- tokyonight
cmd('colorscheme tokyonight')
