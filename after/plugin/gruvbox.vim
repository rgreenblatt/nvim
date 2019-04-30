if IsInstalled('morhetz/gruvbox')
  function! OverrideColors()
    highlight TermCursor ctermfg=Red guifg=Red
    highlight link StartifyFooter GruvboxOrange
    " highlight Pmenu ctermfg=223 ctermbg=239 guifg=#ebdbb2 guibg=#FFFFFF blend=90
    highlight Pmenu ctermfg=223 ctermbg=239 guifg=#ebdbb2 guibg=#282828
    "TODO
    try
      highlight CursorLine ctermbg=239 guibg=#FFFFFF blend=95
      " highlight ColorColumn ctermbg=239 guibg=#FFFFFF blend=95
    catch
    endtry
    highlight CursorLineNr ctermfg=214 ctermbg=239 guifg=#fabd2f guibg=#282828
    highlight TerminalNormal cterm=reverse gui=reverse ctermfg=Blue guifg=Blue
    highlight TerminalInsert cterm=reverse gui=reverse ctermfg=Red guifg=Red
  endfunction

  augroup ColorOverrides
    autocmd!
    autocmd ColorScheme * call OverrideColors()
  augroup end
  
  call OverrideColors()
endif
