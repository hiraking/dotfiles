function! MyHighlights() abort
    highlight GitSignsAdd guifg=#41bdbf
    highlight GitSignsChange guifg=#c9c542
    highlight GitSignsDelete guifg=#bd3c56
    highlight CocInlayHint guifg=#627985 guibg=#222436
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme * call MyHighlights()
augroup END

colorscheme tokyonight-moon
