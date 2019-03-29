"colorscheme
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italic = 1
colorscheme gruvbox

"enhanced jumps
let g:EnhancedJumps_CaptureJumpMessages = 0
let g:EnhancedJumps_UseTab = 0

let g:tex_conceal="abdgm"

let b:lion_squeeze_spaces = 1

"cleverf options
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 3000

let g:wordmotion_prefix = ';'

if exists("g:headless")
else
    "startify
    let g:startify_bookmarks = [{'z': '~/.zshrc'}, {'v': '~/.config/nvim/'},
                \ {'w': '~/.config/i3/config'}, {'b': '~/.config/qutebrowser/config.py'},
                \ {'T': '~/Documents/efficiency/TODO/TODO_LIST.txt'}, {'s': '~/.config/i3status/config'},
                \ {'K': '~/Documents/keyboard/src/layers.py'}] 
    
    let g:startify_commands = [{'m': 'te neomutt'}, {'t': 'te'}, 
                \ {'c': 'Calendar -position=here'}, {'f': 'Files'}]
    
    let g:startify_lists = [
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ { 'type': 'commands',  'header': ['   Commands']       },
                \ { 'type': 'files',     'header': ['   Recent']            },
                \ ]
    
    "possible additonal entry
    "      \ { 'type': 'dir',       'header': ['   Recent: '. getcwd()] },
    
    let g:startify_skiplist = [
                \ 'init.vim',
                \ 'config',
                \ 'config.py'
                \ ]
    
    let g:startify_custom_header =
                \ map(split(system('cat /home/ryan/Documents/efficiency/TODO/TODO_LIST.txt'), '\n'), 
                \'"   ". v:val')

    "calender.vim
    let g:calendar_google_task = 1
    let g:calendar_google_calendar = 1
    let g:calendar_view = 'week'
    let g:calendar_cyclic_view = 1
    
    augroup calendar-mappings
        autocmd!
        autocmd FileType calendar nunmap <buffer> <space>
    augroup END
    
    "vimtex
    let g:vimtex_compiler_method = 'latexmk'
    let g:vimtex_fold_enabled = 1
    let g:vimtex_view_method = 'zathura'
    let g:vimtex_compiler_progname = 'nvr'
endif

let g:windowswap_map_keys = 0

" limelight/goyo
let g:limelight_conceal_ctermfg = 'DarkGray'

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

let g:mwAutoLoadMarks = 1

let g:codi#interpreters = {
            \ 'python': {
            \ 'bin': 'python3',
            \ },
            \ }

let g:gutentags_cache_dir = '~/.tags'

let g:fold_options = {
            \ 'fallback_method' : { 'line_threshold' : 2000, 'method' : 'syntax' },
            \ 'fold_blank': 0,
            \ 'fold_includes': 1,
            \ 'max_foldline_length': 'win',
            \ 'merge_comments' : 1,
            \ 'show_if_and_else': 1,
            \ 'strip_namespaces': 1,
            \ 'strip_template_arguments': 1
            \ }

let g:highlightedyank_highlight_duration = 100

let g:sneak#s_next = 1

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
