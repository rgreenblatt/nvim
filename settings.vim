set viminfo='19,<1000,s1000
set undofile
set viewoptions=cursor,folds,slash,unix
set relativenumber
set number
set lazyredraw
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wildmode=longest,list,full
set wildmenu
set conceallevel=2
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
highlight TermCursor ctermfg=red guifg=red
let $GIT_EDITOR = 'nvr -cc split --remote-wait'
set iskeyword+=-

"colorscheme
colorscheme gruvbox
set termguicolors
let g:gruvbox_contrast_dark = "hard"

"mkdir as needed
"https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
