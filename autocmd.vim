"general autocmds {{{
"au TermOpen * setlocal listchars= nonumber norelativenumber
au Filetype java,scala,cpp,c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=81
au Filetype tex,text,textile,mkd,markdown setlocal spell
au FileType json syntax match Comment +\/\/.\+$+
au FileType gitcommit set bufhidden=delete
"}}}

"mkdir as needed {{{
"https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save
function! s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction

augroup BWCCreateDir
    au!
    au BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
"}}}

" vim: set fdm=marker:
