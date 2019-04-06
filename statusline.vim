"file type devicons helper {{{
function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 
                \'no ft') : ''
endfunction
"}}}

"file format devicons helper {{{
function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
"}}}
 
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{()}
"
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"status line {{{
let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'gitstatus', 'nearestmethod', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'gitstatus': 'FugitiveStatusline',
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat',
            \   'nearestmethod': 'NearestMethodOrFunction'
            \ }
            \ }
"}}}

" vim: set fdm=marker:
