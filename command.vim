"command for getting the output of another command {{{
function! Output(cmd)
    redir => message
    silent execute a:cmd
    redir END
    if empty(message)
        echoerr "no output"
    else
        " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
        new
        setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
        silent put=message
    endif
endfunction

command! -nargs=+ -complete=command Output call Output(<q-args>)
"}}}

"command for setting gdb path {{{
function! SetDebugPath(path)
    let g:debug_path = a:path
endfunction

command! -nargs=+ -complete=shellcmd SetDebugPath call SetDebugPath(<q-args>)
"}}}

" vim: set fdm=marker:
