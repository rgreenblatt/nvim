iabbrev cosnt const

"command abbreviation {{{
function! SetupCommandAbbrs(from, to)
    execute 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('T', 'tabedit')
"}}}

" vim: set fdm=marker:
