"colorscheme{{{
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italic = 1
colorscheme gruvbox
"}}}

"enhanced jumps{{{
let g:EnhancedJumps_CaptureJumpMessages = 0
let g:EnhancedJumps_UseTab = 0
"}}}

let g:tex_conceal="abdgm"

let g:lion_squeeze_spaces = 1

"cleverf options{{{
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 0
let g:clever_f_timeout_ms = 3000
"}}}

let g:wordmotion_prefix = ';'

if !exists("g:disable_coc")
  "coc {{{
  let g:coc_global_extensions = [
        \ 'coc-word',
        \ 'coc-tag',
        \ 'coc-lists',
        \ 'coc-syntax',
        \ 'coc-emoji',
        \ 'coc-dictionary',
        \ 'coc-python',
        \ 'coc-json',
        \ 'coc-java',
        \ 'coc-vimtex',
        \ 'coc-ccls',
        \ 'coc-yaml',
        \ 'coc-rls',
        \ 'coc-snippets',
        \ 'coc-gocode']
  augroup CocGenericAutocmds
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType,BufWrite c,cpp,cuda,json,java,rust,tex,go,yaml,python  
          \ setlocal formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  "}}}


  "vista {{{
  let g:vista_fzf_preview = ['right:50%']
  "}}}
endif

"startify {{{
let g:startify_files_number = 5
let g:startify_session_sort = 1


let g:startify_lists = [
      \ {'type': 'sessions',  'header': [' Sessions']},
      \ {'type': 'bookmarks', 'header': [' Bookmarks']},
      \ {'type': 'commands',  'header': [' Commands']},
      \ {'type': 'files',     'header': [' Recent']},
      \ ]
"possible additonal entry
"      \ { 'type': 'dir',       'header': ['   Recent: '. getcwd()] },

let g:startify_skiplist = [
      \ 'init.vim',
      \ 'config',
      \ 'config.py'
      \ ]

"}}}

"calender {{{
let g:calendar_google_task = 1
let g:calendar_google_calendar = 1
let g:calendar_view = 'week'
let g:calendar_cyclic_view = 1

augroup calendar-mappings
  autocmd!
  autocmd FileType calendar nunmap <buffer> <space>
augroup end
"}}}

"vimtex {{{
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_fold_enabled = 1
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_progname = 'nvr'
"}}}

"semshi {{{
let g:semshi#error_sign = v:false
let g:semshi#simplify_markup = v:false
"}}}

"chromatica {{{
let g:chromatica#libclang_path = '/usr/lib/llvm-7/lib/libclang.so'
" augroup ChromaticaStartup
"     autocmd!
"     autocmd FileType c,cpp,cuda ChromaticaStart
" augroup end
let g:chromatica#global_args = [
      \ '-isystem /usr/lib/llvm-7/lib/clang/7.0.0/include'
      \ ]
let g:chromatica#responsive_mode = 1
"}}}

""vimade {{{
"augroup VimadeSpecial
"    autocmd!
"    autocmd CmdLineEnter * VimadeBufDisable
"    autocmd CmdlineLeave * VimadeBufEnable
"augroup END
""}}}

let g:windowswap_map_keys = 0

" limelight/goyo {{{
let g:limelight_conceal_ctermfg = 'DarkGray'

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
"}}}

let g:mwAutoLoadMarks = 1

"codi {{{
let g:codi#interpreters = {
      \ 'python': {
      \ 'bin': 'python3',
      \ },
      \ }
"}}}

let g:gutentags_cache_dir = '~/.tags'

"c/cpp folding {{{
let g:fold_options = {
      \ 'fallback_method' : { 'line_threshold' : 2000, 
      \ 'method' : 'syntax' },
      \ 'fold_blank': 0,
      \ 'fold_includes': 1,
      \ 'max_foldline_length': 'win',
      \ 'merge_comments' : 1,
      \ 'show_if_and_else': 1,
      \ 'strip_namespaces': 1,
      \ 'strip_template_arguments': 1
      \ }
"}}}

let g:highlightedyank_highlight_duration = 200

" sneak {{{
let g:sneak#s_next = 1
let g:sneak#absolute_dir = 0
" let g:sneak#label = 1
" let g:sneak#target_labels = ";sftunq/SFGHLTUNRMQZ?0"
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" let g:sqs_within_lines = 5
"}}}

"fzf {{{
function! RgPreview(args, hidden)
  call fzf#vim#grep("rg --column --line-number --no-heading " .
        \ "--color=always --smart-case " . 
        \ (a:hidden ? '--hidden --glob "!.git/*"' : '') . 
        \ shellescape(a:args), 1, {'options' : 
        \ fzf#vim#with_preview('right:50%').options})
endfunction

let s:fzf_window_option = 'call FloatingFullscreen()'

function! ZshAliases()
  call fzf#run({'source': "zsh -c 'source ~/.zshrc && paste <(print -rl -- " .
        \ "${(k)aliases}) <(print -rl -- ${aliases})'",
        \ 'window': s:fzf_window_option})
endfunction

function! ZshFunctions()
  call fzf#run({
        \ 'source': "zsh -c 'source ~/.zshrc && print -rl -- ${(k)functions}'", 
        \ 'window': s:fzf_window_option,
        \ 'options' : "--preview 'zsh -c \"export NO_COMPLETE=true && ".
        \ "source ~/.zshrc && which {}\"'"})
endfunction

function! ZshVariables()
  call fzf#run({
        \ 'source': "zsh -c 'source ~/.zshrc && paste <(print -rl -- " .
        \ " ${(k)parameters}) <(print -rl -- ${parameters}) '", 
        \ 'window': s:fzf_window_option,
        \ 'options' : "--preview 'zsh -c \"export NO_COMPLETE=true && ".
        \ "source ~/.zshrc && get_value {}\"'"})
endfunction

function! ZshExecutables()
  call fzf#run({
        \ 'source': "zsh -c 'source ~/.zshrc && whence -pm \"*\"'", 
        \ 'sink': 'e',
        \ 'window': s:fzf_window_option,
        \ 'options' : fzf#vim#with_preview('right:50%').options})
endfunction

command! -nargs=* RgPreview call RgPreview(<q-args>, 0)
command! -nargs=* RgPreviewHidden call RgPreview(<q-args>, 1)
command! ZshAliases call ZshAliases()
command! ZshFunctions call ZshFunctions()
command! ZshVariables call ZshVariables()
command! ZshExecutables call ZshExecutables()

let g:fzf_layout = { 'window': s:fzf_window_option }

"Too slow
"
" let g:fzf_preview_window = -1
"
"function! FloatingFZFPreview(path, line_num)
"  if g:fzf_window != -1 && nvim_win_is_valid(g:fzf_window)
"    echom "started_preview"
"    let win_config = nvim_win_get_config(g:fzf_window)
"    let win_config.width = float2nr(&columns / 2)
"    call nvim_win_set_config(g:fzf_window, win_config)
"    let g:orig_win = nvim_get_current_win()
"    if g:fzf_preview_window != -1 && nvim_win_is_valid(g:fzf_preview_window)
"      call nvim_win_close(g:fzf_preview_window, 0)
"      let g:fzf_preview_window = -1
"    endif
"    let buf = nvim_create_buf(v:false, v:true)
"    let orig_mode = mode()

"    "window size
"    let height = &lines - 1 - &cmdheight
"    let width = float2nr(&columns / 2)

"    let opts = {
"          \ 'relative': 'editor',
"          \ 'row': 0,
"          \ 'col': &columns - width,
"          \ 'width': width,
"          \ 'height': height
"          \ }

"    " not sure why before and after is required
"    let g:fzf_preview_window = nvim_open_win(buf, v:false, opts)
"    call win_gotoid(g:fzf_preview_window)
"    execute "edit " . a:path
"    normal! zR
"    call win_gotoid(g:orig_win)
"    call nvim_win_set_option(g:fzf_preview_window, "winhighlight", 
"          \ "NormalFloat:Normal")
"    call nvim_win_set_option(g:fzf_preview_window, "signcolumn", 
"          \ "no")
"    echom "finished_preview"
"    return g:fzf_preview_window
"  else
"    echom "not preview"
"    return -1
"  endif
"endfunction

" function! FZFCheckWindow()
"   if g:fzf_window != -1 && g:fzf_preview_window != -1  && 
"         \ !nvim_win_is_valid(g:fzf_window) && 
"         \ nvim_win_is_valid(g:fzf_preview_window)
"     call nvim_win_close(g:fzf_preview_window, 0)
"     let g:fzf_preview_window = -1
"   endif
" endfunction

" augroup FzfWindowHandler
"   autocmd!
"   autocmd WinEnter * call FZFCheckWindow()
" augroup end 

" let g:fzf_window = -1

" function! FloatingFZF()
"   let g:fzf_window = FloatingFullscreen()
" endfunction
"}}}

"rainbow parens {{{
augroup RainbowParens
  autocmd!
  autocmd VimEnter * RainbowParenthesesToggle
  autocmd Syntax   * RainbowParenthesesLoadRound
  autocmd Syntax   * RainbowParenthesesLoadSquare
  autocmd Syntax   * RainbowParenthesesLoadBraces
augroup end
"}}}

let g:local_vimrc = ['.config', 'local_init.vim']

"wintabs {{{
let g:wintabs_delete_buffers = 0 
let g:wintabs_autoclose_vimtab = 1
let g:wintabs_buffer_limit = 5
"}}}

""autoformat {{{
"noremap <F5> :AutoFormat<CR>
"let g:formatdef_scalafmt = "'scalafmt --stdin'"
"let g:formatters_scala = ['scalafmt'] 
""}}}

"polyglot and associated plugins: {{{
let g:polyglot_disabled = ['latex']
"if I ever start working with csvs some, look into plugin
let g:no_csv_maps = 1
"}}}

"sneak quick scope {{{
let g:sqs_enable = 1
nmap ;vs <plug>(SneakQuickScopeToggle)
"}}}

let g:scratch_autohide = 0

let g:YUNOcommit_after = 2000

let g:dispatch_no_maps = 1

"dirvish {{{
function! DirvishFoldHiddenText()
  let names = []
  let i = v:foldstart
  while i <= v:foldend
    call add(names, matchlist(getline(i), '\/\(\(.*\/.\)\@!.*$\)')[1])
    let i += 1
  endwhile
  return join(names, " ")
endfunction

function! DirvishSetup()
  "This assumes it is sorted with hidden at bottom which should be true
  let hidden_pattern = '\(\/\.\)\@<=\(.*\/.\)\@!'
  let line_first_hidden = search(hidden_pattern)
  if line_first_hidden
    let sort_dirs = 'sort ,^.*[\/],'
    execute string(line_first_hidden) . ',$' . sort_dirs
    if line_first_hidden > 1
      execute '1,' . string(line_first_hidden - 1) . sort_dirs
    endif
  else
    sort ,^.*[\/],
  endif
  execute 'setlocal foldexpr=' . escape("match(getline(v:lnum), '" . 
        \ hidden_pattern . "') != -1", ' \')
  setlocal foldmethod=expr
  setlocal foldtext=DirvishFoldHiddenText()
endfunction

let g:dirvish_mode = 'call DirvishSetup()'
"}}}

"rooter {{{
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1
let g:rooter_resolve_links = 1
let g:rooter_patterns = ['build.sbt', 'ccls', 'compile_commands.json', '.git',
      \ '.git/', '_darcs/', '.hg/', '.bzr/', '.svn/']
"}}}

" vim: set fdm=marker:
