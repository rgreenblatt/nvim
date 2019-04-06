"general filetype autocmds {{{
augroup FiletypeAutocmds
    autocmd!
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber
    autocmd TermOpen * setlocal signcolumn=no
    autocmd Filetype tex,text,textile,mkd,markdown setlocal spell
    autocmd FileType json syntax match Comment +\/\/.\+$+
    autocmd FileType gitcommit set bufhidden=delete
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
augroup end
"}}}

"mkdir as needed {{{
function! s:MkDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkDir(expand('<afile>'), +expand('<abuf>'))
augroup end
"}}}

"cursorline/column only in current window {{{
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline cursorcolumn
    autocmd WinLeave * set nocursorline nocursorcolumn
augroup END
"}}}

" vim: set fdm=marker:
