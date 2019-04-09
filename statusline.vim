"file type devicons helper {{{
function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? 
        \ &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 
        \'no ft') : ''
endfunction
"}}}

"vista nearestmethod {{{
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
"}}}

"wintabs {{{
function! GetWinTabs(type)

  if exists("w:wintabs_buflist")
    let s:list = ''

    let l:buftabs_show_number = 1
    let l:buftabs_marker_modified = "!"
    let l:buftabs_separator = " "

    let l:reached = 0

    let l:index = 0

    for l:i in w:wintabs_buflist
      let l:index = l:index + 1

      if winbufnr(0) == l:i
        let l:reached = 1
        if a:type == 0
          break
        elseif a:type == 2
          continue
        endif
      else
        if a:type == 1
          if l:reached == 1 
            break
          else
            continue
          endif
        elseif a:type == 2
          if l:reached == 0 
            continue
          endif
        endif
      endif
      
      let s:list = s:list . ' '

      if exists("g:buftabs_only_basename") && !g:buftabs_only_basename
        let l:name = bufname(l:i)
      else
        let l:name = fnamemodify(bufname(l:i), ":t")
      endif
      let l:name = substitute(l:name, "%", "%%", "g")
      if l:name == ""
        let l:name = "[No Name]"
      endif
        
      if l:buftabs_show_number == 1
        let s:list = s:list . l:index . l:buftabs_separator
      endif
      let s:list = s:list . l:name

      if getbufvar(l:i, "&modified") == 1
        let s:list = s:list . l:buftabs_marker_modified
      endif
      
      if winbufnr(winnr()) == l:i
        let l:end = strlen(s:list)
      else
        let s:list = s:list . ' '
      endif
    endfor

    return trim(s:list)
  else
    return ""
  endif
endfunction

function! WinTabBefore() abort
  return "%{GetWinTabs(0)}"
endfunction

function! WinTabCurrent() abort
  return "%{GetWinTabs(1)}"
endfunction

function! WinTabAfter() abort
  return "%{GetWinTabs(2)}"
endfunction

let g:buftabs_show_number = 0
"}}}

set statusline+=%{()}

"status line {{{
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'percent' ],
      \             [ 'nearestmethod', 'cocstatus', 'gitstatus',
      \               'readonly' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'wintab_after', 'wintab_current', 
      \               'wintab_before' ] ],
      \ },
      \ 'inactive': {
      \   'left': [ [ 'percent' , 'nearestmethod', 'gitstatus'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'wintab_after', 'wintab_current', 
      \               'wintab_before' ] ],
      \ },
      \ 'component_function': {
      \   'nearestmethod': 'NearestMethodOrFunction',
      \   'cocstatus': 'coc#status',
      \   'gitstatus': 'FugitiveStatusline',
      \   'filetype': 'MyFiletype'
      \ },
      \ 'component_expand': {
      \   'wintab_before': 'WinTabBefore',
      \   'wintab_current': 'WinTabCurrent',
      \   'wintab_after': 'WinTabAfter'
      \ },
      \ 'component_type': {
      \   'wintab_current': 'error'
      \ }
      \ }
"}}}

" vim: set fdm=marker:
