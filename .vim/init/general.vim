set termguicolors
set t_ut=""

if (&term =~ '^xterm' && &t_Co == 256)
  set t_ut= |
  set ttyscroll=1
endif

" cursor
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

syntax on
" setting
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set backspace=indent,eol,start
set clipboard=unnamed
set visualbell t_vb=
set updatetime=300
set helplang=ja
set wildmode=list:longest

" visual
set number
set cursorline
set virtualedit=onemore
set showmatch
set scrolloff=5
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

" statusline
" set statusline=%F
" set statusline+=%m
" set statusline+=%r
" set statusline+=%h
" set statusline+=%w
" set statusline+=%=
" set statusline+=[ENC=%{&fileencoding}]
" set statusline+=[LOW=%l/%L]
" set laststatus=2

" Tab
set list lcs=tab:\|\
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab

" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

autocmd QuickFixCmdPost *grep* cwindow
