function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'cocstatus', 'gitstatus', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'cocstatus': 'coc#status',
            \   'gitstatus': 'FugitiveStatusline',
            \   'filetype': 'MyFiletype',
            \   'fileformat': 'MyFileformat'
            \ }
            \ }
