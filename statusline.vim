"file type devicons helper {{{1
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? 
        \ &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 
        \'no ft') : ''
endfunction

"wintabs {{{1
let s:win_tabs_installed = IsInstalled('rgreenblatt/vim-wintabs')
function! WinTabBefore()
  if s:win_tabs_installed
    return "%{wintabs#get_tablist(0)}"
  else
    return ''
  endif
endfunction

function! WinTabCurrent()
  if s:win_tabs_installed
    return "%{wintabs#get_tablist(1)}"
  else
    return ''
  endif
endfunction

function! WinTabAfter()
  if s:win_tabs_installed
    return "%{wintabs#get_tablist(2)}"
  else
    return ''
  endif
endfunction

let g:wintabs_marker_modified = "!"
let g:wintabs_marker_current = ""
let g:wintabs_separator = " "
let g:wintabs_number_separator = " "
let g:wintabs_only_basename = 1
let g:wintabs_show_number = 1
let g:wintabs_not_current_character_limit = 7

" macro mode info {{{1 
function! MacroModeInfo()
  if g:macro_mode == 1
    return "M"
  else
    return ""
  endif
endfunction

"short pwd {{{1
"requires shell script
function! ShortPwd()
  let out = substitute(system("cd ". getcwd() . " && short_pwd"), "\n", "", "")
  if v:shell_error
    return "error"
  else
    return out
  endif
endfunction

function! ShortPwdWrapper()
  return "%{ShortPwd()}"
endfunction

"FugitiveStatusline wrapper to reduce noise {{{1
let s:fugitive_installed = IsInstalled('tpope/vim-fugitive')

function! FugitiveStatuslineWrapper()
  if s:fugitive_installed
    let out = FugitiveStatusline()
    if out == '[Git(master)]'
      return ''
    else
      return out
    endif
  else
    return ''
  endif
endfunction

"status line {{{1
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'percent' ],
      \             [ 'cocstatus', 'gitstatus', 'short_pwd',
      \               'readonly', 'macromode' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'wintab_after', 'wintab_current', 
      \               'wintab_before' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'percent', 'gitstatus', 'short_pwd'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'wintab_after', 'wintab_current', 
      \               'wintab_before' ] ],
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitstatus': 'FugitiveStatuslineWrapper',
      \   'filetype': 'MyFiletype',
      \ },
      \ 'component_expand': {
      \   'wintab_before': 'WinTabBefore',
      \   'wintab_current': 'WinTabCurrent',
      \   'wintab_after': 'WinTabAfter',
      \   'macromode': 'MacroModeInfo',
      \   'short_pwd': 'ShortPwdWrapper'
      \ },
      \ 'component_type': {
      \   'wintab_current': 'error',
      \   'macromode': 'error'
      \ }
      \ }
"}}}1
" vim: set fdm=marker:
