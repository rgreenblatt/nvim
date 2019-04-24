inoreabbrev cosnt const

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
call SetupCommandAbbrs('PC', 'PlugClean')
call SetupCommandAbbrs('TC', 'WintabsCloseVimtab')
call SetupCommandAbbrs('WD', 'WintabsDo')

cnoreabbrev ehco echo
"}}}

" vim: set fdm=marker:
