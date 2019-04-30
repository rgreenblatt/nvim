let g:athame_var = system("echo ${ATHAME_USE_JOBS+1}")
let g:athame_running = g:athame_var == "1\n"

source ~/.vim_machine_specific.vim

function s:Set(var, default)
  if !exists(a:var)
    execute "let " . a:var . " = " . a:default
  endif
endfunction

"default plug installs {{{
call s:Set("g:headless", 0)
call s:Set("g:no_language_plugins", 0)
call s:Set("g:no_coc", 0)
call s:Set("g:no_appearance_plugins", 0)
call s:Set("g:no_language_plugins", 0)
call s:Set("g:no_editing_plugins", 0)
call s:Set("g:no_setup_plugins", 0)
call s:Set("g:no_integration_plugins", 0)
call s:Set("g:no_misc_plugins", 0)
"}}}

let g:no_language_plugins = g:no_language_plugins || g:athame_running
let g:no_appearance_plugins = g:no_appearance_plugins || g:athame_running
let g:no_setup_plugins = g:no_setup_plugins || g:athame_running
let g:no_integration_plugins = g:no_integration_plugins || g:athame_running

source ~/.config/nvim/remap.vim
source ~/.config/nvim/settings.vim
source ~/.config/nvim/autocmd.vim
source ~/.config/nvim/command.vim
source ~/.config/nvim/abbr.vim
source ~/.config/nvim/plug.vim
source ~/.config/nvim/plug_settings.vim
source ~/.config/nvim/plug_remap.vim
source ~/.config/nvim/coc_fzf.vim
source ~/.config/nvim/statusline.vim
source ~/.config/nvim/langmap.vim
