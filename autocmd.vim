au TermOpen * setlocal listchars= nonumber norelativenumber
au Filetype java setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=80
au Filetype scala setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 colorcolumn=80
autocmd Filetype tex,text,textile,mkd,markdown setlocal spell
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType gitcommit set bufhidden=delete
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

