if IsInstalled('morhetz/gruvbox')
  function! SetColors()
    highlight TermCursor ctermfg=Red guifg=Red
    highlight link StartifyFooter GruvboxOrange
    highlight Pmenu ctermfg=223 ctermbg=239 guifg=#ebdbb2 guibg=#282828
    highlight CursorLine ctermbg=239 guibg=#282828
    highlight CursorLineNr ctermbg=239 guibg=#282828
    highlight TerminalNormal cterm=reverse gui=reverse ctermfg=Blue guifg=Blue
    highlight TerminalInsert cterm=reverse gui=reverse ctermfg=Red guifg=Red

    highlight! link gitmessengerHeader GruvboxBlue
    highlight! link gitmessengerHash GruvboxYellow
    highlight! link gitmessengerHistory GruvboxRed
    highlight! link gitmessengerPopupNormal Pmenu
    highlight! link gitmessengerEndOfBuffer Pmenu
  endfunction

  augroup ColorSets
    autocmd!
    autocmd ColorScheme * call SetColors()
  augroup end
  
  call SetColors()
endif
