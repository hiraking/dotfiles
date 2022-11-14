nnoremap j gj
nnoremap k gk

inoremap <silent> jj <ESC>
inoremap <silent> ;; <ESC>A;

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

nnoremap :clip :Clip<CR><CR>

" ノーマルモードで改行
nnoremap <CR> A<CR><Esc>

nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $

nnoremap <silent><Leader>j :noh<CR>

nnoremap <silent><Leader>c :%y<CR>
