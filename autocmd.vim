"general autocmds {{{
augroup GenericFileAutocmds
    autocmd!
    autocmd TermOpen * setlocal listchars= nonumber norelativenumber
    autocmd Filetype java,scala,cpp,c setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=81
    autocmd Filetype tex,text,textile,mkd,markdown setlocal spell
    autocmd FileType json syntax match Comment +\/\/.\+$+
    autocmd FileType gitcommit set bufhidden=delete
augroup end
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
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup end
"}}}

" vim: set fdm=marker:
