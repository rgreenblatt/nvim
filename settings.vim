set viminfo='19,<1000,s1000
set undofile
set viewoptions=cursor,folds,slash,unix
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,globals
set relativenumber
set number
set lazyredraw
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set wildmode=longest,list,full
set wildmenu
set conceallevel=2
set colorcolumn=81
let $GIT_EDITOR = 'nvr -cc split --remote-wait'
set iskeyword+=-
set termguicolors
set pumblend=20
try
  set floatblend=20
catch /E518/
endtry
set ignorecase
set smartcase
set hidden
set cmdheight=3
set updatetime=100
set shortmess+=c
set signcolumn=yes
set autowrite
set gdefault
set cursorline
set cursorcolumn
set noshowmode
set foldmethod=syntax

" vim: set fdm=marker:
