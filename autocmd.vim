"general filetype autocmds {{{
augroup FiletypeAutocmds
  autocmd!
  autocmd TermOpen * setlocal listchars=
  autocmd TermOpen * setlocal signcolumn=no
  autocmd Filetype tex,text,textile,mkd,markdown setlocal spell
  autocmd FileType json syntax match Comment +\/\/.\+$+
  autocmd BufRead,BufNewFile *.sbt set filetype=scala
augroup end
"}}}

" secure modeline work around {{{
" Since NVIM v0.4.0-464-g5eaa45547, commit 5eaa45547975c652e594d0d6dbe34c1316873dc7
" 'secure' is set when 'modeline' is set, which will cause a lot of commands
" cannot run in autocmd when opening help page.
augroup secure_modeline_conflict_workaround
  autocmd!
  autocmd FileType help setlocal nomodeline
augroup END
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

"cursorline and relativenumber only in current window {{{
function! EnterWin()
  set cursorline
  if &number 
    set relativenumber
  endif
endfunction

augroup BgHighlight
  autocmd!
  autocmd WinEnter,TabEnter,BufWinEnter * call EnterWin()
  autocmd WinLeave,TabLeave  * set nocursorline norelativenumber
augroup END
"}}}

"clean up no names {{{
function! CleanNoNameEmptyBuffers()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && '.
        \ 'empty(bufname(v:val)) && bufwinnr(v:val) < 0 && ' .
        \ '(getbufline(v:val, 1, "$") == [""])')
  if !empty(buffers)
    exe 'bd '.join(buffers, ' ')
  endif
endfunction

augroup CleanBuffers
  autocmd!
  autocmd BufLeave * call CleanNoNameEmptyBuffers()
augroup END
"}}}

" vim: set fdm=marker:
