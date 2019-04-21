"file type devicons helper {{{
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? 
        \ &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 
        \'no ft') : ''
endfunction
"}}}

"wintabs {{{
function! WinTabBefore() abort
  return "%{wintabs#get_tablist(0)}"
endfunction

function! WinTabCurrent() abort
  return "%{wintabs#get_tablist(1)}"
endfunction

function! WinTabAfter() abort
  return "%{wintabs#get_tablist(2)}"
endfunction

let g:wintabs_marker_modified = "!"
let g:wintabs_marker_current = ""
let g:wintabs_separator = " "
let g:wintabs_number_separator = " "
let g:wintabs_only_basename = 1
let g:wintabs_show_number = 1
"}}}

" macro mode info {{{ 
function! MacroModeInfo()
  if g:macro_mode == 1
    return "M"
  else
    return ""
  endif
endfunction

set statusline+=%{()}
"}}}

"status line {{{
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'percent' ],
      \             [ 'cocstatus', 'gitstatus',
      \               'readonly', 'macromode' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'wintab_after', 'wintab_current', 
      \               'wintab_before' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'percent', 'gitstatus'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'wintab_after', 'wintab_current', 
      \               'wintab_before' ] ],
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitstatus': 'FugitiveStatusline',
      \   'filetype': 'MyFiletype'
      \ },
      \ 'component_expand': {
      \   'wintab_before': 'WinTabBefore',
      \   'wintab_current': 'WinTabCurrent',
      \   'wintab_after': 'WinTabAfter',
      \   'macromode': 'MacroModeInfo'
      \ },
      \ 'component_type': {
      \   'wintab_current': 'error',
      \   'macromode': 'error'
      \ }
      \ }
"}}}

" vim: set fdm=marker:
