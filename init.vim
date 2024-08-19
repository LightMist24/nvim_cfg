" init loading
lua require("core.init")
lua vim.cmd("colorscheme nightfly")

" 矢车菊的蓝色'#6495ED'
highlight Normal guifg='#F0FFF0'
highlight Cursor guifg='#FFB6C1'

" Neovide setting
"lua vim.g.neovide_transparency = 0.8
"lua vim.g.neovide_cursor_vfx_mode = "railgun"
"""vim.g.neovide_cursor_vfx_mode = "ripple"
"lua vim.g.neovide_profiler=false

" set guifont=Delugia:h12
let g:neovide_scale_factor = 0.8
command! HI echo "Hello Neovim!"

" you can change in order to fit you system
if has('win32') || has('win64') || has('win95') || has('win16')
    source ~/AppData/Local/nvim/lua/Auto-Pairs.vim
else
    source ~/.config/nvim/lua/Auto-Pairs.vim
endif
