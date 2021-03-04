-- Access global vars
g = vim.g

----------------------------

return function()
-- How each level is indented and what to prepend
-- g.vista_icon_indent = ['╰─▸ ', '├─▸ ']
-- Position to open the vista sidebar only
g.vista_sidebar_position = 'vertical topleft'
-- How to show the detailed information of current cursor symbol
g.vista_echo_cursor_strategy = 'both'
-- Close the vista window automati when you jump to a symbol
g.vista_close_on_jump = true
-- Executive used when opening vista sidebar without specifying it
g.vista_default_executive = 'nvim_lsp'

--[[ vim.api.nvim_exec(
[[
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
    \ "function": "\uf794",
    \ "variable": "\uf71b",
    \ }
\]\], true) ]]
end
