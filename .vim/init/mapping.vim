nnoremap j gj
nnoremap k gk
xnoremap j gj
xnoremap k gk
nnoremap J 5j
nnoremap K 5k
xnoremap J 5j
xnoremap K 5k

inoremap <silent> jj <ESC>
inoremap <silent> ;; <ESC>A;

nnoremap <Leader><CR> A<CR><ESC>
nnoremap <Leader>w :<C-u>w<CR>
nnoremap <silent><Leader>l :noh<CR>


inoremap <C-l> <Right>
inoremap <C-u> <ESC>cc

nnoremap ; <C-^>
nnoremap <silent>]q :<C-u>cnext<CR>
nnoremap <silent>[q :<C-u>cprevious<CR>
nnoremap <silent>]Q :<C-u>clast<CR>
nnoremap <silent>[Q :<C-u>cfirst<CR>
nnoremap <silent><C-h> <cmd>bp<CR>
nnoremap <silent><C-l> <cmd>bn<CR>
nnoremap <silent>]b :blast<CR>
nnoremap <silent>[b :bfirst<CR>
nnoremap <silent>]a :<C-u>next<CR>
nnoremap <silent>[a :<C-u>previous<CR>
nnoremap <silent>]A :<C-u>last<CR>
nnoremap <silent>[A :<C-u>first<CR>

nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $
xnoremap <Tab> >

nnoremap m cc
nnoremap + <C-a>
nnoremap - <C-x>

cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" terminal
augroup TermGroup
  autocmd TermOpen * :startinsert
  autocmd TermOpen * setlocal norelativenumber
  autocmd TermOpen * setlocal nonumber
augroup END

tnoremap <ESC> <C-\><C-n>
tnoremap <C-W>n       <cmd>new<cr>
tnoremap <C-W><C-N>   <cmd>new<cr>
tnoremap <C-W>q       <cmd>quit<cr>
tnoremap <C-W><C-Q>   <cmd>quit<cr>
tnoremap <C-W>c       <cmd>close<cr>
tnoremap <C-W>o       <cmd>only<cr>
tnoremap <C-W><C-O>   <cmd>only<cr>
tnoremap <C-W><Down>  <cmd>wincmd j<cr>
tnoremap <C-W><C-J>   <cmd>wincmd j<cr>
tnoremap <C-W>j       <cmd>wincmd j<cr>
tnoremap <C-W><Up>    <cmd>wincmd k<cr>
tnoremap <C-W><C-K>   <cmd>wincmd k<cr>
tnoremap <C-W>k       <cmd>wincmd k<cr>
tnoremap <C-W><Left>  <cmd>wincmd h<cr>
tnoremap <C-W><C-H>   <cmd>wincmd h<cr>
tnoremap <C-W><BS>    <cmd>wincmd h<cr>
tnoremap <C-W>h       <cmd>wincmd h<cr>
tnoremap <C-W><Right> <cmd>wincmd l<cr>
tnoremap <C-W><C-L>   <cmd>wincmd l<cr>
tnoremap <C-W>l       <cmd>wincmd l<cr>
tnoremap <C-W>w       <cmd>wincmd w<cr>
tnoremap <C-W><C-W>   <cmd>wincmd w<cr>
tnoremap <C-W>W       <cmd>wincmd W<cr>
tnoremap <C-W>t       <cmd>wincmd t<cr>
tnoremap <C-W><C-T>   <cmd>wincmd t<cr>
tnoremap <C-W>b       <cmd>wincmd b<cr>
tnoremap <C-W><C-B>   <cmd>wincmd b<cr>
tnoremap <C-W>p       <cmd>wincmd p<cr>
tnoremap <C-W><C-P>   <cmd>wincmd p<cr>
tnoremap <C-W>P       <cmd>wincmd P<cr>
tnoremap <C-W>r       <cmd>wincmd r<cr>
tnoremap <C-W><C-R>   <cmd>wincmd r<cr>
tnoremap <C-W>R       <cmd>wincmd R<cr>
tnoremap <C-W>x       <cmd>wincmd x<cr>
tnoremap <C-W><C-X>   <cmd>wincmd x<cr>
tnoremap <C-W>K       <cmd>wincmd K<cr>
tnoremap <C-W>J       <cmd>wincmd J<cr>
tnoremap <C-W>H       <cmd>wincmd H<cr>
tnoremap <C-W>L       <cmd>wincmd L<cr>
tnoremap <C-W>T       <cmd>wincmd T<cr>
tnoremap <C-W>=       <cmd>wincmd =<cr>
tnoremap <C-W>-       <cmd>wincmd -<cr>
tnoremap <C-W>+       <cmd>wincmd +<cr>
tnoremap <C-W>z       <cmd>pclose<cr>
tnoremap <C-W><C-Z>   <cmd>pclose<cr>
