iabbrev cosnt const

"command abbreviation {{{
function! SetupCommandAbbrs(from, to)
    execute 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

call SetupCommandAbbrs('T', 'tabedit')
call SetupCommandAbbrs('R', 'CocRestart')
call SetupCommandAbbrs('PI', 'PlugInstall')
call SetupCommandAbbrs('PU', 'PlugUpdate')
"}}}

" vim: set fdm=marker:
