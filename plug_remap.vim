"better jumping (uses vim-EnhancedJumps) {{{
if exists("g:disable_coc")
  nmap <TAB> <Plug>EnhancedJumpsOlder
  nmap <S-TAB> <Plug>EnhancedJumpsNewer
else
  nmap <silent><expr> <TAB>
        \ coc#expandableOrJumpable() ? 
        \ coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
        \ "\<Plug>EnhancedJumpsOlder"
  nmap <silent><expr> <S-TAB>
        \ coc#expandableOrJumpable() ? 
        \ coc#rpc#request('snippetPrev', []) :
        \ "\<Plug>EnhancedJumpsNewer"
endif

nmap g<Tab> <Plug>EnhancedJumpsLocalOlder
nmap g<S-Tab> <Plug>EnhancedJumpsLocalNewer

nmap <space><Tab> <Plug>EnhancedJumpsRemoteOlder
nmap <space><S-Tab> <Plug>EnhancedJumpsRemoteNewer

"langmap related
nnoremap g"  g,

nmap z;  <Plug>EnhancedJumpsFarFallbackChangeOlder
nmap z,  <Plug>EnhancedJumpsFarFallbackChangeNewer

call MapWinCmd("c", "if bufname('') == '' <bar> call EnhancedJumps#Go(".
      \ "'EnhancedJumps#Jump', 0, 'remote') <bar> endif")
"}}}

"fzf maps {{{
call MapWinCmd("f", "Files")
call MapWinCmd("F", "Files ", 1)
call MapWinCmd("g", "GFiles")
call MapWinCmd("G", "GFiles", 1)
call MapWinCmd("r", "Rg", 1)
call MapWinCmd("R", "Rg ")
call MapWinCmd("l", "BLines")
call MapWinCmd("L", "Lines")
call MapWinCmd(";t", "Tags")
call MapWinCmd(";T", "BTags")
call MapWinCmd("m", "call fzf#vim#marks()")
call MapWinCmd("h", "History")
call MapWinCmd("q", "Commits")
call MapWinCmd("Q", "BCommits")
call MapWinCmd("o", "commands")
call MapWinCmd("b", "Buffers")

nnoremap <M-C-B> <Cmd>Buffers<cr>
nnoremap <M-C-N> <Cmd>GFiles<cr>
nnoremap <M-C-A> <Cmd>Maps<cr>
nnoremap <M-C-F> <Cmd>Files<cr>
nnoremap <M-C-G> :<c-u>Rg<space>
nnoremap <M-C-H> <Cmd>History/<cr>
nnoremap <M-C-P> <Cmd>:Helptags<cr>
nnoremap <leader>: <Cmd>History:<cr>
"}}}

"dirvish in new window {{{
call MapWinCmd("d", "Dirvish")
"}}}

"startify in new window {{{
call MapWinCmd("s", "Startify")
"}}}

"thesaurus {{{
nnoremap <a-t> <Cmd>ThesaurusQueryReplaceCurrentWord<CR>
xnoremap <a-t> y<Cmd>ThesaurusQueryReplace <C-r>"<CR>
"}}}

"coc remaps {{{
if !exists("g:disable_coc")
  " use <tab> for trigger completion and navigate to next complete item
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ coc#expandableOrJumpable() ? 
        \ coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr> <S-Tab>
        \ pumvisible() ? "\<C-p>" :
        \ coc#expandableOrJumpable() ?
        \ coc#rpc#request('snippetPrev', []) : "\<S-Tab>"

  snoremap <silent><expr> <TAB>
        \ coc#expandableOrJumpable() ?
        \ coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
        \ "\<TAB>"
  snoremap <silent><expr> <S-TAB>
        \ coc#expandableOrJumpable() ?
        \ coc#rpc#request('snippetPrev', []) :
        \ "\<S-TAB>"

  "pum close/break undo
  inoremap <c-space> <c-g>u

  "snippet trigger
  imap <C-s> <Plug>(coc-snippets-expand)

  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  nnoremap <leader>I <Cmd>CocCommand python.sortImports<cr>
  nnoremap <leader>R <Cmd>CocCommand python.sortImports<cr>
  nnoremap ;L :<c-u>CocList<space>
  nnoremap ;S <Cmd>CocList -I symbols<cr>
  nnoremap ;S <Cmd>CocList -I symbols<cr>

  nnoremap ;S <Cmd>CocList -I symbols<cr>

  " Use `[g` and `]g` for navigate diagnostics
  nmap [g <Plug>(coc-diagnostic-prev)
  nmap ]g <Plug>(coc-diagnostic-next)

  nmap <leader>O <Plug>(coc-openlink)
  nmap <leader>E <Plug>(coc-codelens-action)

  " Remap keys for gotos
  nmap <leader>D <Plug>(coc-declaration)
  nmap <leader>d <Plug>(coc-definition)
  nmap <leader>o <Plug>(coc-type-definition)

  nmap <leader>i <Plug>(coc-implementation)
  nmap <leader>u <Plug>(coc-references)

  nmap <leader>e <Plug>(coc-rename)

  nmap <leader>c <Plug>(coc-fix-current)

  nmap <leader>C <Plug>(coc-codeaction)

  nmap <leader>a <Plug>(coc-codeaction-selected)
  xmap <leader>a <Plug>(coc-codeaction-selected)

  nmap <leader>Z <Plug>(coc-float-jump)

  "show documentation in preview window
  nnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>
  xnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
endif
"}}}

"vista {{{
call MapWinCmd("v", "if bufname('') == '' <bar> call EnhancedJumps#Go(".
      \ "'EnhancedJumps#Jump', 0, 'remote') <bar> endif <bar> Vista finder")
nnoremap <silent> <leader>V <Cmd>Vista!!<cr>
"}}}

"vimtex {{{
nmap  <leader>xi   <plug>(vimtex-info)
nmap  <leader>xI   <plug>(vimtex-info-full)
nmap  <leader>xt   <plug>(vimtex-toc-open)
nmap  <leader>xT   <plug>(vimtex-toc-toggle)
nmap  <leader>xq   <plug>(vimtex-log)
nmap  <leader>xv   <plug>(vimtex-view)
nmap  <leader>xr   <plug>(vimtex-reverse-search)
nmap  <leader>xl   <plug>(vimtex-compile)
nmap  <leader>xL   <plug>(vimtex-compile-selected)
nmap  <leader>xL   <plug>(vimtex-compile-selected)
nmap  <leader>xk   <plug>(vimtex-stop)
nmap  <leader>xK   <plug>(vimtex-stop-all)
nmap  <leader>xe   <plug>(vimtex-errors)
nmap  <leader>xo   <plug>(vimtex-compile-output)
nmap  <leader>xg   <plug>(vimtex-status)
nmap  <leader>xG   <plug>(vimtex-status-all)
nmap  <leader>xc   <plug>(vimtex-clean)
nmap  <leader>xC   <plug>(vimtex-clean-full)
nmap  <leader>xm   <plug>(vimtex-imaps-list)
nmap  <leader>xx   <plug>(vimtex-reload)
nmap  <leader>xX   <plug>(vimtex-reload-state)
nmap  <leader>xs   <plug>(vimtex-toggle-main)
"}}}

"plugin remaps for a headed install {{{
if !exists("g:headless")
  "google {{{
  nnoremap <a-g> :<c-u>Google<space>
  nnoremap <a-f> :<c-u>Googlef<space>

  xnoremap <a-g> :<c-u>Google<space>
  xnoremap <a-f> :<c-u>Googlef<space>
  "}}}

  "window navigation (requires keyboard remaping and i3-vim-focus {{{
  nnoremap <silent> gzl <Cmd>call Focus('right', 'l')<CR>
  nnoremap <silent> gzh <Cmd>call Focus('left', 'h')<CR>
  nnoremap <silent> gzk <Cmd>call Focus('up', 'k')<CR>
  nnoremap <silent> gzj <Cmd>call Focus('down', 'j')<CR>
  "}}}
endif
"}}}

""insertchar options {{{
"let g:insert_char_no_default_mapping = 1
"nmap <leader>s <Plug>InsertChar
"nmap <leader>S <Plug>InsertCharAfter
""}}}

"scratch {{{
let g:scratch_no_mappings = 1

nmap zs <plug>(scratch-reuse)
nmap zS <plug>(scratch-clear)

xmap zs <plug>(scratch-selection-reuse)
xmap zS <plug>(scratch-selection-clear)
"}}}

"yankring {{{
nmap p <Plug>(miniyank-autoput)
nmap P <Plug>(miniyank-autoPut)
xmap p <Plug>(miniyank-autoput)
xmap P <Plug>(miniyank-autoPut)
xnoremap <expr> p v:register=='"'?'pgvy':'p'

nmap ;n <Plug>(miniyank-cycle)
nmap ;N <Plug>(miniyank-cycleback)
"}}}

" vimade {{{
"  nnoremap <silent> ;vt <Cmd>VimadeToggle<cr>
"  nnoremap <expr><silent> ;vb  exists("b:vimade_disabled") ? 
"        \ "<Cmd>VimadeBufEnable<cr>" : 
"        \"<Cmd>VimadeBufDisable<cr>" 
"  nnoremap <expr><silent> ;vw  exists("w:vimade_disabled") ? 
"        \ "<Cmd>VimadeWinEnable<cr>" : "<Cmd>VimadeWinDisable<cr>" 
" }}}

"NarrowRegion {{{
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

xmap ;r <Plug>NrrwrgnDo
xmap ;R <Plug>NrrwrgnBangDo
"}}}

nnoremap <silent> <a-u> <Cmd>MundoToggle<cr>

"custom operators TODO {{{
nmap _  <Plug>(operator-select)
call operator#user#define('select', 'Op_select_region')
function! Op_select_region(window_heightmotion_wiseness)
  normal! `[v`]
endfunction

nmap ;_  <Plug>(operator-select-block)
call operator#user#define('select-block', 'Op_select_block')
function! Op_select_block(window_heightmotion_wiseness)
  exe "normal `[\<c-v>`]"
endfunction

nmap <leader>_  <Plug>(operator-select-line)
call operator#user#define('select-line', 'Op_select_line')
function! Op_select_line(window_heightmotion_wiseness)
  normal! `[V`]
endfunction

nmap <leader>wa  <Plug>(operator-adjust)
xmap <leader>wa  <Plug>(operator-adjust)
call operator#user#define('adjust', 'Op_adjust_window_height')
function! Op_adjust_window_height(motion_wiseness)
  execute (line("']") - line("'[") + 1) 'wincmd' '_'
  normal! `[zt
endfunction
"}}}

nnoremap <a-i> <Cmd>Codi<cr>

nnoremap <silent> ;vh <Cmd>HexokinaseToggle<cr>

nnoremap <silent> <leader>v <Cmd>call WindowSwap#EasyWindowSwap()<CR>

"goyo {{{
nnoremap <silent> ;vg <Cmd>Goyo<cr>

function! SetupGoyo()
  Limelight
  nnoremap <silent> ;vg <Cmd>Goyo!<cr>
  setlocal nocursorline nocursorcolumn
endfunction

function! SetupNoGoyo()
  Limelight!
  nnoremap <silent> ;vg <Cmd>Goyo<cr>
  setlocal cursorline cursorcolumn
endfunction

autocmd! User GoyoEnter call SetupGoyo()
autocmd! User GoyoLeave call SetupNoGoyo()
"}}}

"git {{{
nnoremap <silent> ;gs <Cmd>Gstatus<cr>
nnoremap ;gd :<c-u>Gvdiff<space>

"when bug gets fixed, switch back to builtin commands
nnoremap ;gp <Cmd>Git pull<cr>
nnoremap ;gh <Cmd>Git push<cr>

nnoremap ;gcc <Cmd>Gcommit -v<cr>
nnoremap ;gca <Cmd>Gcommit -v -a<cr>
nnoremap ;gcA <Cmd>Gcommit --amend -v -a<cr>
nnoremap ;go :<c-u>Gcheckout<space>
nnoremap ;gr :<c-u>Gremove<space>
nnoremap ;gm :<c-u>Gmove<space>
"}}}

"ninja-feet overides mappings {{{
nnoremap ;i [i
nnoremap ;I [I
"}}}

"sideways maps {{{
nnoremap <silent> ;h <Cmd>SidewaysJumpLeft<cr>
nnoremap <silent> ;l <Cmd>SidewaysJumpRight<cr>
nnoremap <silent> ;y <Cmd>SidewaysLeft<cr>
nnoremap <silent> ;o <Cmd>SidewaysRight<cr>
"}}}

"nvimgdb {{{
let g:nvimgdb_disable_start_keymaps = 1

nnoremap ;dp :<c-u>SetDebugPath<space>
nnoremap <expr> ;dsg exists('g:debug_path') ? 
      \'<Cmd>GdbStart gdb -q<space>'.expand(g:debug_path).'<cr>' : 
      \':<c-u>GdbStart gdb -q<space>'
nnoremap <expr> ;dsl exists('g:debug_path') ? 
      \'<Cmd>GdbStartLLDB lldb <space>'.expand(g:debug_path).'<cr>' : 
      \':<c-u>GdbStartLLDB lldb<space>'
nnoremap <expr> ;dsp exists('g:debug_path') ? 
      \'<Cmd>GdbStartPDB python -m pdb <space>'.expand(g:debug_path).'<cr>' : 
      \':<c-u>GdbStartPDB python -m pdb<space>'
nnoremap ;dq <Cmd>GdbDebugStop<cr>
nnoremap ;dr <Cmd>GdbBreakpointClearAll<cr>
nnoremap ;di <Cmd>GdbInterrupt<cr>

let g:nvimgdb_config_override = {
      \ 'key_until':         ';du',
      \ 'key_continue':      ';dc',
      \ 'key_next':          ';dn',
      \ 'key_step':          ';ds',
      \ 'key_finish':        ';df',
      \ 'key_breakpoint':    ';db',
      \ 'key_frameup':       ';dk',
      \ 'key_framedown':     ';dj',
      \ 'key_eval':          ';de'
      \ }
"}}}

"visual star search and replace {{{
xmap <Leader>s <Plug>(visualstar-*)``cgn
xmap <Leader>S <Plug>(visualstar-#)``cgN
"}}}

"dispatch {{{
nnoremap <a-m> <Cmd>Make<cr>
nnoremap <a-,> <Cmd>Make!<cr>
"}}}

"sandwich {{{
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

nmap <silent> ;sd <Plug>(operator-sandwich-delete)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <silent> ;sr <Plug>(operator-sandwich-replace)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <silent> ;ss <Plug>(operator-sandwich-delete)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> ;se <Plug>(operator-sandwich-replace)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

nmap ;sa <Plug>(operator-sandwich-add)
xmap ;sa <Plug>(operator-sandwich-add)
omap ;sa <Plug>(operator-sandwich-g@)
xmap ;sd <Plug>(operator-sandwich-delete)
xmap ;sr <Plug>(operator-sandwich-replace)

" omap ib <Plug>(textobj-sandwich-auto-i)
" xmap ib <Plug>(textobj-sandwich-auto-i)
" omap ab <Plug>(textobj-sandwich-auto-a)
" xmap ab <Plug>(textobj-sandwich-auto-a)

" omap is <Plug>(textobj-sandwich-query-i)
" xmap is <Plug>(textobj-sandwich-query-i)
" omap as <Plug>(textobj-sandwich-query-a)
" xmap as <Plug>(textobj-sandwich-query-a)
"}}}

"wintabs {{{
nmap <c-h> <Plug>(wintabs_previous)
nmap <c-l> <Plug>(wintabs_next)
nmap <leader>q <Plug>(wintabs_close)
nmap ;u <Plug>(wintabs_undo)
nmap <c-w>o <Plug>(wintabs_only)
nmap ;q <Plug>(wintabs_close_window)
nmap <c-w>O <Plug>(wintabs_only_window)
nmap ;Q <Plug>(wintabs_close_vimtab)
nmap ;a <Plug>(wintabs_all)
nmap <leader>.D <Cmd>WintabsDo<space>

nmap <leader><leader>h <Plug>(wintabs_move_to_window_left)
nmap <leader><leader>j <Plug>(wintabs_move_to_window_right)
nmap <leader><leader>k <Plug>(wintabs_move_to_window_above)
nmap <leader><leader>l <Plug>(wintabs_move_to_window_below)
nmap <leader><leader>p <Plug>(wintabs_move_to_window_next)
nmap <leader><leader>m <Plug>(wintabs_maximize)

nmap <leader><leader>q <Plug>(wintabs_tab_1)
nmap <leader><leader>w <Plug>(wintabs_tab_2)
nmap <leader><leader>e <Plug>(wintabs_tab_3)
nmap <leader><leader>r <Plug>(wintabs_tab_4)
nmap <leader><leader>t <Plug>(wintabs_tab_5)
nmap <leader><leader>y <Plug>(wintabs_tab_6)
nmap <leader><leader>u <Plug>(wintabs_tab_7)
nmap <leader><leader>i <Plug>(wintabs_tab_8)
nmap <leader><leader>o <Plug>(wintabs_tab_9)
nmap <leader><leader>p <Plug>(wintabs_last)

nmap <leader>Q <Cmd>Startify<cr><Plug>(wintabs_only)

augroup CmdWinQ
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <leader>q <Cmd>q<CR>
augroup END
"}}}

"ToggleMacroMode {{{
noremap <silent> ;m <Cmd>ToggleMacroMode<CR><Cmd>call lightline#update()<cr>
"}}}

" vim: set fdm=marker:
