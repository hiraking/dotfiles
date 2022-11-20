let g:fern#default_hidden=1

augroup FernGroup
  autocmd!
  autocmd FileType fern setlocal norelativenumber | setlocal nonumber
augroup END
