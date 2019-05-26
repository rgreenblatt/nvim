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

"FugitiveStatusline wrapper {{{1
let s:fugitive_installed = IsInstalled('tpope/vim-fugitive')

function! FugitiveStatuslineWrapper()
  if s:fugitive_installed
    let out = FugitiveStatusline()
    let blacklist = ['[Git(master)]', '[Git(devel)]']
    if index(blacklist, out) != -1
      return ''
    else
      return out
    endif
  else
    return ''
  endif
endfunction

"coc#status wrapper {{{1
let s:coc_installed = IsInstalled('neoclide/coc.nvim')

function! CocStatusWrapper()
  if s:coc_installed
    let out = coc#status()
    let out = substitute(out, 'Python', '', '')
    let out = substitute(out, ' 64-bit', '', '')
    let out = substitute(out, 'Analyzing in background, ', '', '')
    let out = substitute(out, 'items left...', 'left', '')
    return out
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
      \   'right': [ [ 'linter_checking', 'linter_errors', 
      \                'linter_warnings', 'linter_ok' ],
      \              [ 'filetype', 'lineinfo'],
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
      \   'cocstatus': 'CocStatusWrapper',
      \   'gitstatus': 'FugitiveStatuslineWrapper',
      \   'filetype': 'MyFiletype',
      \ },
      \ 'component_expand': {
      \   'wintab_before': 'WinTabBefore',
      \   'wintab_current': 'WinTabCurrent',
      \   'wintab_after': 'WinTabAfter',
      \   'macromode': 'MacroModeInfo',
      \   'short_pwd': 'ShortPwdWrapper',
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ },
      \ 'component_type': {
      \   'wintab_current': 'error',
      \   'macromode': 'error',
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ }
      \ }
"}}}1

" vim: set fdm=marker:
