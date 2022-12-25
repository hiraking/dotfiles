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
nnoremap <silent><Leader>w <Cmd>write<CR>
nnoremap <silent><Leader>l :<C-u>noh<CR>
set pastetoggle=<Leader>pt

" 行を移動
nnoremap <C-Up> "zdd<Up>"zP
nnoremap <C-Down> "zdd"zp
" 複数行を移動
vnoremap <C-Up> "zx<Up>"zP`[V`]
vnoremap <C-Down> "zx"zp`[V`]
" ヴィジュアルモードで連続で置換可能にする
xnoremap p "_xP

inoremap <C-l> <Right>
inoremap <C-u> <ESC>cc

nnoremap ; <C-^>
nnoremap <silent>]q <Cmd>cnext<CR>
nnoremap <silent>[q <Cmd>cprevious<CR>
nnoremap <silent>]Q <Cmd>clast<CR>
nnoremap <silent>[Q <Cmd>cfirst<CR>
nnoremap <silent><Leader>qo <Cmd>copen<CR>
nnoremap <silent><Leader>qq <Cmd>cclose<CR>
nnoremap <silent><Leader>qp <Cmd>colder<CR>
nnoremap <silent><Leader>qn <Cmd>cnewer<CR>
nnoremap <silent>]l <Cmd>lnext<CR>
nnoremap <silent>[l <Cmd>lprevious<CR>
nnoremap <silent>]L <Cmd>llast<CR>
nnoremap <silent>[L <Cmd>lfirst<CR>
nnoremap <silent><C-h> <Cmd>bp<CR>
nnoremap <silent><C-l> <Cmd>bn<CR>
nnoremap <silent>]b <Cmd>blast<CR>
nnoremap <silent>[b <Cmd>bfirst<CR>
nnoremap <silent>]a <Cmd>next<CR>
nnoremap <silent>[a <Cmd>previous<CR>
nnoremap <silent>]A <Cmd>last<CR>
nnoremap <silent>[A <Cmd>first<CR>

nnoremap H ^
nnoremap L $
xnoremap H ^
xnoremap L $
xnoremap <Tab> >
nnoremap & :&&<CR>
xnoremap & :&&<CR>

nnoremap <C-s> cc
nnoremap + <C-a>
nnoremap - <C-x>

cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
cnoremap <C-s> <Left>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" terminal
augroup TermGroup
  autocmd TermOpen * :startinsert
  autocmd TermOpen * setlocal norelativenumber
  autocmd TermOpen * setlocal nonumber
augroup END

tnoremap <ESC> <C-\><C-n>
tnoremap <C-W>n       <Cmd>new<CR>
tnoremap <C-W><C-N>   <Cmd>new<CR>
tnoremap <C-W>q       <Cmd>quit<CR>
tnoremap <C-W><C-Q>   <Cmd>quit<CR>
tnoremap <C-W>c       <Cmd>close<CR>
tnoremap <C-W>o       <Cmd>only<CR>
tnoremap <C-W><C-O>   <Cmd>only<CR>
tnoremap <C-W><Down>  <Cmd>wincmd j<CR>
tnoremap <C-W><C-J>   <Cmd>wincmd j<CR>
tnoremap <C-W>j       <Cmd>wincmd j<CR>
tnoremap <C-W><Up>    <Cmd>wincmd k<CR>
tnoremap <C-W><C-K>   <Cmd>wincmd k<CR>
tnoremap <C-W>k       <Cmd>wincmd k<CR>
tnoremap <C-W><Left>  <Cmd>wincmd h<CR>
tnoremap <C-W><C-H>   <Cmd>wincmd h<CR>
tnoremap <C-W><BS>    <Cmd>wincmd h<CR>
tnoremap <C-W>h       <Cmd>wincmd h<CR>
tnoremap <C-W><Right> <Cmd>wincmd l<CR>
tnoremap <C-W><C-L>   <Cmd>wincmd l<CR>
tnoremap <C-W>l       <Cmd>wincmd l<CR>
tnoremap <C-W>w       <Cmd>wincmd w<CR>
tnoremap <C-W><C-W>   <Cmd>wincmd w<CR>
tnoremap <C-W>W       <Cmd>wincmd W<CR>
tnoremap <C-W>t       <Cmd>wincmd t<CR>
tnoremap <C-W><C-T>   <Cmd>wincmd t<CR>
tnoremap <C-W>b       <Cmd>wincmd b<CR>
tnoremap <C-W><C-B>   <Cmd>wincmd b<CR>
tnoremap <C-W>p       <Cmd>wincmd p<CR>
tnoremap <C-W><C-P>   <Cmd>wincmd p<CR>
tnoremap <C-W>P       <Cmd>wincmd P<CR>
tnoremap <C-W>r       <Cmd>wincmd r<CR>
tnoremap <C-W><C-R>   <Cmd>wincmd r<CR>
tnoremap <C-W>R       <Cmd>wincmd R<CR>
tnoremap <C-W>x       <Cmd>wincmd x<CR>
tnoremap <C-W><C-X>   <Cmd>wincmd x<CR>
tnoremap <C-W>K       <Cmd>wincmd K<CR>
tnoremap <C-W>J       <Cmd>wincmd J<CR>
tnoremap <C-W>H       <Cmd>wincmd H<CR>
tnoremap <C-W>L       <Cmd>wincmd L<CR>
tnoremap <C-W>T       <Cmd>wincmd T<CR>
tnoremap <C-W>=       <Cmd>wincmd =<CR>
tnoremap <C-W>-       <Cmd>wincmd -<CR>
tnoremap <C-W>+       <Cmd>wincmd +<CR>
tnoremap <C-W>z       <Cmd>pclose<CR>
tnoremap <C-W><C-Z>   <Cmd>pclose<CR>
