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
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 3000
"}}}

let g:wordmotion_prefix = ';'

"coc {{{
augroup CocGenericAutocmds
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType c,cpp,cuda,json,java,rust,tex,go,yaml,python setlocal 
        \ formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"}}}

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

"vista {{{
let g:vista_fzf_preview = ['right:50%']
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
let g:sneak#absolute_dir = 1
" let g:sneak#label = 1
" let g:sneak#target_labels = ";sftunq/SFGHLTUNRMQZ?0"
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S

" let g:sqs_within_lines = 5
"}}}

"floating fzf window {{{
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
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

let g:neomake_open_list = 2

"wintabs {{{
let g:wintabs_display = 'none'
let g:wintabs_delete_buffers = 0 
let g:wintabs_autoclose_vimtab = 1
"}}}

""autoformat {{{
"noremap <F5> :AutoFormat<CR>
"let g:formatdef_scalafmt = "'scalafmt --stdin'"
"let g:formatters_scala = ['scalafmt'] 
""}}}

let g:polyglot_disabled = ['latex']

" vim: set fdm=marker:
