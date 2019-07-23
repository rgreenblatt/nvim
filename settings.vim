" generic settings {{{1
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
set ignorecase
set smartcase
set hidden
set cmdheight=3
set updatetime=100
set shortmess+=c
set signcolumn=yes:1
set autowrite
set gdefault
set cursorline
set noshowmode
set foldmethod=syntax
set scrolloff=1
set showtabline=2
set winminwidth=0
set winminheight=0
set winwidth=1
set nomodelineexpr

" potentially available {{{1
if has('termguicolors')
  set termguicolors
endif

function! s:TrySetting(name)
  try
    execute 'set ' . a:name
  catch /E518/
  endtry
endfunction

function! s:TrySetting(name, value)
  try
    execute 'set ' . a:name . '=' . a:value
  catch /E518/
  endtry
endfunction

call s:TrySetting('pumblend', 20)
call s:TrySetting('floatblend', 20)

" misc {{{1
packadd termdebug

let g:rust_conceal = 1
let g:rust_conceal_mod_path = 1
let g:rust_conceal_pub = 1
let g:rust_fold = 2
"}}}

" vim: set fdm=marker:
