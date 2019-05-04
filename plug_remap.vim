"better jumping (uses vim-EnhancedJumps) {{{1
if IsInstalled('inkarkat/vim-EnhancedJumps')
  if IsInstalled('neoclide/coc.nvim')
    nmap <silent><expr> <TAB>
          \ coc#expandableOrJumpable() ?
          \ coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
          \ "\<Plug>EnhancedJumpsOlder"
    nmap <silent><expr> <S-TAB>
          \ coc#expandableOrJumpable() ?
          \ coc#rpc#request('snippetPrev', []) :
          \ "\<Plug>EnhancedJumpsNewer"
  else
    nmap <TAB> <Plug>EnhancedJumpsOlder
    nmap <S-TAB> <Plug>EnhancedJumpsNewer
  endif
endif

nmap g<Tab> <Plug>EnhancedJumpsLocalOlder
nmap g<S-Tab> <Plug>EnhancedJumpsLocalNewer

nmap <leader><Tab> <Plug>EnhancedJumpsRemoteOlder
nmap <leader><S-Tab> <Plug>EnhancedJumpsRemoteNewer

nmap z;  <Plug>EnhancedJumpsFarFallbackChangeOlder
nmap z,  <Plug>EnhancedJumpsFarFallbackChangeNewer

call MapWinCmd("c", "if bufname('') == '' <bar> call EnhancedJumps#Go(".
      \ "'EnhancedJumps#Jump', 0, 'remote') <bar> endif")

"fzf maps {{{1
call MapWinCmd("f", "Files")
call MapWinCmd("F", "Files ", 1)
call MapWinCmd("'", "GFiles?")
call MapWinCmd("g", "GFiles")
call MapWinCmd("G", "GFiles ", 1)
call MapWinCmd("r", "RgPreviewHidden ", 1)
call MapWinCmd("R", "RgPreviewHidden")
call MapWinCmd(";r", "RgPreview ", 1)
call MapWinCmd(";R", "RgPreview")
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
call MapWinCmd("B", "Wipeouts")
call MapWinCmd("E", "ZshExecutables")

nnoremap <M-C-B> <Cmd>Buffers<cr>
nnoremap <M-C-N> <Cmd>GFiles<cr>
nnoremap <M-C-A> <Cmd>Maps<cr>
nnoremap <M-C-F> <Cmd>Files<cr>
nnoremap <M-C-G> :<c-u>RgPreviewHidden<space>
nnoremap <M-C-H> <Cmd>History/<cr>
nnoremap <M-C-P> <Cmd>:Helptags<cr>
nnoremap <leader>: <Cmd>History:<cr>

"dirvish in new window {{{1
call MapWinCmd("d", "Dirvish")

"startify in new window {{{1
call MapWinCmd("s", "Startify")

"thesaurus {{{1
nnoremap <a-t> <Cmd>ThesaurusQueryReplaceCurrentWord<cr>
xnoremap <a-t> y<Cmd>ThesaurusQueryReplace <c-r>"<cr>

if IsInstalled('neoclide/coc.nvim') " {{{1
  "coc remaps {{{2
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

  inoremap <silent><expr> <cr> pumvisible() && !empty(v:completed_item) ? 
        \ coc#_select_confirm()
        \: "\<CR>"

  nnoremap <leader>I <Cmd>CocCommand python.sortImports<cr>
  nnoremap <leader>R <Cmd>CocCommand python.execInTerminal<cr>
  nnoremap ;L :<c-u>CocList<space>
  nnoremap ;A :<c-u>CocCommand<space>
  nnoremap ;S <Cmd>CocList -I symbols<cr>
  nnoremap ;D <Cmd>CocList --auto-preview diagnostics<cr>
  nnoremap ;O <Cmd>CocList --auto-preview outline<cr>
  nnoremap <leader>G <Cmd>CocList links<cr>
  nnoremap ;f <Cmd>CocList --auto-preview files<cr>


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

  " nmap <leader>a <Plug>(coc-codeaction-selected)
  " xmap <leader>a <Plug>(coc-codeaction-selected)

  nmap <leader>Z <Plug>(coc-float-jump)

  "show documentation in preview window
  nnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>
  xnoremap <silent> K <Cmd>call <SID>show_documentation()<CR>

  function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
      return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
  endfunction

  function! s:show_documentation()
    if &filetype == 'vim' || &filetype == 'help'
      if mode() == "v" || mode() == "V" || mode() == "\<c-v>"
        execute 'h '. s:get_visual_selection()
      else
        execute 'h '.expand('<cword>')
      endif
    else
      call CocAction('doHover')
    endif
  endfunction
  
  "vista {{{2
  call MapWinCmd("v", "if bufname('') == '' <bar> call EnhancedJumps#Go(".
        \ "'EnhancedJumps#Jump', 0, 'remote') <bar> endif <bar> Vista finder")
  nnoremap <silent> <leader>V <Cmd>Vista!!<cr>
  "}}}2
endif
"vimtex {{{1
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

"plugin remaps for a headed install {{{1
if !g:headless
  "google {{{2
  nnoremap <a-g> :<c-u>Google<space>
  nnoremap <a-f> :<c-u>Googlef<space>

  xnoremap <a-g> :<c-u>Google<space>
  xnoremap <a-f> :<c-u>Googlef<space>
  
  "window navigation (requires keyboard remaping and i3-vim-focus {{{2
  nnoremap <silent> gzl <Cmd>call Focus('right', 'l')<CR>
  nnoremap <silent> gzh <Cmd>call Focus('left', 'h')<CR>
  nnoremap <silent> gzk <Cmd>call Focus('up', 'k')<CR>
  nnoremap <silent> gzj <Cmd>call Focus('down', 'j')<CR>
endif

""insertchar options {{{1
"let g:insert_char_no_default_mapping = 1
"nmap <leader>s <Plug>InsertChar
"nmap <leader>S <Plug>InsertCharAfter
"
"scratch {{{1
let g:scratch_no_mappings = 1

nmap zs <plug>(scratch-reuse)
nmap zS <plug>(scratch-clear)

xmap zs <plug>(scratch-selection-reuse)
xmap zS <plug>(scratch-selection-clear)

"yankring {{{1
nmap p <Plug>(miniyank-autoput)
nmap P <Plug>(miniyank-autoPut)
xmap p <Plug>(miniyank-autoput)
xmap P <Plug>(miniyank-autoPut)
xnoremap <expr> p v:register=='"'?'pgvy':'p'

nmap ;n <Plug>(miniyank-cycle)
nmap ;N <Plug>(miniyank-cycleback)

" vimade {{{1
"  nnoremap <silent> ;vt <Cmd>VimadeToggle<cr>
"  nnoremap <expr><silent> ;vb  exists("b:vimade_disabled") ?
"        \ "<Cmd>VimadeBufEnable<cr>" :
"        \"<Cmd>VimadeBufDisable<cr>"
"  nnoremap <expr><silent> ;vw  exists("w:vimade_disabled") ?
"        \ "<Cmd>VimadeWinEnable<cr>" : "<Cmd>VimadeWinDisable<cr>"
" }}}
"NarrowRegion {{{1
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

xmap ;r <Plug>NrrwrgnDo
xmap ;R <Plug>NrrwrgnBangDo

"custom operators {{{1
if IsInstalled('kana/vim-operator-user')
  "substitute region {{{2
  xmap ;s <Plug>(substitute-region)
  xmap ;S <Plug>(subvert-region)
  nmap ;s <Plug>(substitute-region)
  nmap ;S <Plug>(subvert-region)

  xmap ;r <Plug>(substitute-region-g)
  xmap ;R <Plug>(subvert-region-g)
  nmap ;r <Plug>(substitute-region-g)
  nmap ;R <Plug>(subvert-region-g)

  xmap ;c <Plug>(substitute-region-c)
  xmap ;C <Plug>(subvert-region-c)
  nmap ;c <Plug>(substitute-region-c)
  nmap ;C <Plug>(subvert-region-c)

  xmap ;;s <Plug>(substitute-region-exact)
  xmap ;;S <Plug>(subvert-region-exact)
  nmap ;;s <Plug>(substitute-region-exact)
  nmap ;;S <Plug>(subvert-region-exact)

  xmap ;;r <Plug>(substitute-region-g-exact)
  xmap ;;R <Plug>(subvert-region-g-exact)
  nmap ;;r <Plug>(substitute-region-g-exact)
  nmap ;;R <Plug>(subvert-region-g-exact)

  xmap ;;c <Plug>(substitute-region-c-exact)
  xmap ;;C <Plug>(subvert-region-c-exact)
  nmap ;;c <Plug>(substitute-region-c-exact)
  nmap ;;C <Plug>(subvert-region-c-exact)

  xmap ;z <Plug>(substitute-region-edit)
  xmap ;Z <Plug>(subvert-region-edit)
  nmap ;z <Plug>(substitute-region-edit)
  nmap ;Z <Plug>(subvert-region-edit)

  function! SubstituteRegionMakeMap(plug_name, command, flags, pattern_alter,
        \ replace_alter, ...)

    let edit_flags = a:0 && a:1

    let start_map = "map <silent> <Plug>(" . a:plug_name .
          \ ") <Cmd>call SubstituteRegionSetup('" . a:command .
          \ "', '".  a:flags . "', '" . a:pattern_alter . "', '" .
          \ a:replace_alter .  "', '" . edit_flags . "')<cr>"
    let start_xmap = "x" . start_map
    let start_nmap = "n" . start_map
    let end_xmap = "<Plug>(substitute-region-visual-finish)"
    let end_nmap = "."
    execute start_xmap . end_xmap
    execute start_nmap . end_nmap
  endfunction

  "source:
  "https://stackoverflow.com/questions/53498121/all-the-special-characters-that-need-escaping-in-vim-pattern-searching-replacmen
  function! SubstitutePatternEscape(str)
    return '\V\C' . substitute(escape(a:str, '/\'), "\n", '\\n', 'ge')
  endfunction

  function! SubstituteReplaceEscape(str)
    return escape(a:str, '/\' . (&magic ? '&~' : ''))
  endfunction

  "note, { and } can't be effectively escaped for subvert...
  function! SubvertPatternEscape(str)
    return substitute(escape(a:str, '/\'), "\n", '\\n', 'ge')
  endfunction

  function! SubvertReplaceEscape(str)
    return a:str
  endfunction

  function! SubstitutePatternEscapeExact(str)
    return '\V\C' . '\<' . substitute(escape(a:str, '/\'), "\n", '\\n', 'ge') .
          \ '\>'
  endfunction

  call SubstituteRegionMakeMap("substitute-region", "s", "",
        \ "SubstitutePatternEscape", "SubstituteReplaceEscape")
  call SubstituteRegionMakeMap("substitute-region-g", "s", "g",
        \ "SubstitutePatternEscape", "SubstituteReplaceEscape")
  call SubstituteRegionMakeMap("substitute-region-c", "s", "c",
        \ "SubstitutePatternEscape", "SubstituteReplaceEscape")
  call SubstituteRegionMakeMap("subvert-region", "S", "",
        \ "SubvertPatternEscape", "SubvertReplaceEscape")
  call SubstituteRegionMakeMap("subvert-region-g", "S", "g",
        \ "SubvertPatternEscape", "SubvertReplaceEscape")
  call SubstituteRegionMakeMap("subvert-region-c", "S", "c",
        \ "SubvertPatternEscape", "SubvertReplaceEscape")

  call SubstituteRegionMakeMap("substitute-region-exact", "s", "",
        \ "SubstitutePatternEscapeExact", "SubstituteReplaceEscape")
  call SubstituteRegionMakeMap("substitute-region-g-exact", "s", "g",
        \ "SubstitutePatternEscapeExact", "SubstituteReplaceEscape")
  call SubstituteRegionMakeMap("substitute-region-c-exact", "s", "c",
        \ "SubstitutePatternEscapeExact", "SubstituteReplaceEscape")
  call SubstituteRegionMakeMap("subvert-region-exact", "S", "w",
        \ "SubvertPatternEscape", "SubvertReplaceEscape")
  call SubstituteRegionMakeMap("subvert-region-g-exact", "S", "gw",
        \ "SubvertPatternEscape", "SubvertReplaceEscape")
  call SubstituteRegionMakeMap("subvert-region-c-exact", "S", "cw",
        \ "SubvertPatternEscape", "SubvertReplaceEscape")


  call SubstituteRegionMakeMap("substitute-region-edit", "s", "",
        \ "SubstitutePatternEscape", "SubstituteReplaceEscape", 1)
  call SubstituteRegionMakeMap("subvert-region-edit", "S", "",
        \ "SubvertPatternEscape", "SubvertReplaceEscape", 1)

  function! GetVisCommand(line_dif)
    if a:line_dif
      return string(a:line_dif) . "j"
    else
      return "l"
    endif
  endfunction

  xmap <silent> <Plug>(substitute-region-visual-finish)
        \ <esc>'<<Cmd>execute "normal .".
        \ GetVisCommand(line("'>") - line("'<"))<cr>

  function! SubstituteRegionSetup(command, flags, pattern_alter, replace_alter,
        \ edit_flags)
    let g:to_sub = eval("@" . v:register)
    let g:substitute_region_start_insert = getpos("'[")
    let g:substitute_region_end_insert = getpos("']")
    let g:replace_alter = a:replace_alter
    let g:pattern_alter = a:pattern_alter
    "do nothing change required for some reason
    let cur_mode = mode()
    let is_visual = cur_mode == "v" || cur_mode == "V" || cur_mode == "\<c-v>"
    let g:substitute_region_edit_flags = a:edit_flags

    if !is_visual
      silent execute "normal! ia\<bs>\<esc>"
    endif

    let g:substitute_region_is_first = 1
    let g:substitute_region_command = a:command
    let g:substitute_region_flags = a:flags
    silent! call repeat#set("\<Plug>(operator-substitute-region)", v:count)
  endfunction

  call operator#user#define('substitute-region', 'SubstituteRegion')

  function! SubstituteRegion(_)
    let cursor = getcurpos()
    let g:substitute_region_orig_s = @s
    let start = getpos("'[")
    let end = getpos("']")
    if g:substitute_region_is_first
      if @. != ""
        call setpos("'[", g:substitute_region_start_insert)
        call setpos("']", g:substitute_region_end_insert)
        silent execute "normal! `[v`]h\"sy"
        let g:saved_s_reg = function(g:replace_alter)(@s)
        call setpos("'[", start)
        call setpos("']", end)
      else
        let g:saved_s_reg = ""
      endif
      call feedkeys("2u", 'ni')
    endif
    let @s = g:saved_s_reg
    let to_feed = "\<Cmd>call setpos(\"'[\", ". string(start) . ")\<cr>" .
          \ "\<Cmd>call setpos(\"']\", ". string(end) . ")\<cr>" .
          \ ":'[,']" .
          \ g:substitute_region_command . "/" .
          \ function(g:pattern_alter)(g:to_sub) .
          \ "/\<c-r>\<c-r>s/" .  g:substitute_region_flags

    let to_feed_suffix = " | let @s = g:substitute_region_orig_s | normal! '["
    let to_feed .= to_feed_suffix

    if g:substitute_region_edit_flags
      let to_feed .= repeat("\<left>", len(to_feed_suffix))
    else
      let to_feed .= "\<cr>"
    endif

    echom @s
    echom to_feed

    call feedkeys(to_feed, 'n')
    let g:substitute_region_is_first = 0
  endfunction
  
  "selection operators {{{2
  nmap ;;v  <Plug>(operator-select)
  call operator#user#define('select', 'Op_select_region')
  function! Op_select_region(window_heightmotion_wiseness)
    normal! `[v`]
  endfunction

  nmap ;;<c-v>  <Plug>(operator-select-block)
  call operator#user#define('select-block', 'Op_select_block')
  function! Op_select_block(window_heightmotion_wiseness)
    exe "normal `[\<c-v>`]"
  endfunction

  nmap ;;V  <Plug>(operator-select-line)
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
  
endif

"goyo {{{1
nnoremap <silent> ;vg <Cmd>Goyo<cr>

function! SetupGoyo()
  Limelight
  nnoremap <silent> ;vg <Cmd>Goyo!<cr>
  setlocal nocursorline
endfunction

function! SetupNoGoyo()
  Limelight!
  nnoremap <silent> ;vg <Cmd>Goyo<cr>
  setlocal cursorline
endfunction

autocmd! User GoyoEnter call SetupGoyo()
autocmd! User GoyoLeave call SetupNoGoyo()

"git {{{1
nnoremap <silent> ;gs <Cmd>Gstatus<cr>
nnoremap ;gd :<c-u>Gvdiff<space>

"when bug gets fixed, switch back to builtin commands
function! GitCheckSSH(command)
  if system("cd ". expand("%:p:h") .
        \ "&& git remote show -n origin")[29:32] == "git@"
    execute "G" . a:command
  else
    execute "Git " . a:command
  endif
endfunction

nnoremap ;gp <Cmd>call GitCheckSSH("pull")<cr>
nnoremap ;gh <Cmd>call GitCheckSSH("push")<cr>

nnoremap ;gcc <Cmd>Gcommit -v<cr>
nnoremap ;gca <Cmd>Gcommit -v -a<cr>
nnoremap ;gcA <Cmd>Gcommit --amend -v -a<cr>
nnoremap ;go :<c-u>Gcheckout<space>
nnoremap ;gr :<c-u>Gremove<space>
nnoremap ;gm :<c-u>Gmove<space>

"ninja-feet overides mappings {{{1
nnoremap ;i [i
nnoremap ;I [I

"sideways maps {{{1
nnoremap <silent> ;h <Cmd>SidewaysJumpLeft<cr>
nnoremap <silent> ;l <Cmd>SidewaysJumpRight<cr>
nnoremap <silent> ;y <Cmd>SidewaysLeft<cr>
nnoremap <silent> ;o <Cmd>SidewaysRight<cr>

"nvimgdb {{{1
let g:nvimgdb_disable_start_keymaps = 1

nnoremap ;dp :<c-u>SetDebugPath<space>
nnoremap <expr> ;dg exists('g:debug_path') ?
      \'<Cmd>GdbStart gdb -q<space>' . expand(g:debug_path) . '<cr>' :
      \':<c-u>GdbStart gdb -q<space>'
nnoremap <expr> ;dl exists('g:debug_path') ?
      \'<Cmd>GdbStartLLDB lldb <space>' . expand(g:debug_path) . '<cr>' :
      \':<c-u>GdbStartLLDB lldb<space>'
nnoremap <expr> ;dy exists('g:debug_path') ?
      \'<Cmd>GdbStartPDB python -m pdb <space>' . expand(g:debug_path) .
      \ '<cr>' : ':<c-u>GdbStartPDB python -m pdb<space>'
nnoremap ;dq <Cmd>GdbDebugStop<cr>
nnoremap ;dr <Cmd>GdbBreakpointClearAll<cr>
nnoremap ;di <Cmd>GdbInterrupt<cr>

let g:nvimgdb_config_override = {
      \ 'key_until':      ';du',
      \ 'key_continue':   ';dc',
      \ 'key_next':       ';dn',
      \ 'key_step':       ';ds',
      \ 'key_finish':     ';df',
      \ 'key_breakpoint': ';db',
      \ 'key_frameup':    ';dk',
      \ 'key_framedown':  ';dj',
      \ 'key_eval':       ';de',
      \ 'split_command':  'vsplit'
      \ }

"visual star search and replace {{{1
xmap <Leader>s <Plug>(visualstar-*)``cgn
xmap <Leader>S <Plug>(visualstar-#)``cgN

"dispatch {{{1
nnoremap <a-m> <Cmd>Make<cr>
nnoremap <a-,> <Cmd>Make!<cr>

"vim-cmake {{{1
nnoremap <a-b> <Cmd>CMake<cr>
nnoremap <a-.> <Cmd>CMake!<cr>
nnoremap <a-/> <Cmd>CMakeClean<cr>

"sandwich {{{1
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

nmap <silent> <leader>ad <Plug>(operator-sandwich-delete)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <silent> <leader>ar <Plug>(operator-sandwich-replace)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
nmap <silent> <leader>as <Plug>(operator-sandwich-delete)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
nmap <silent> <leader>ae <Plug>(operator-sandwich-replace)
      \<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

nmap <leader>aa <Plug>(operator-sandwich-add)
xmap <leader>aa <Plug>(operator-sandwich-add)
omap <leader>aa <Plug>(operator-sandwich-g@)
xmap <leader>ad <Plug>(operator-sandwich-delete)
xmap <leader>ar <Plug>(operator-sandwich-replace)

" omap ib <Plug>(textobj-sandwich-auto-i)
" xmap ib <Plug>(textobj-sandwich-auto-i)
" omap ab <Plug>(textobj-sandwich-auto-a)
" xmap ab <Plug>(textobj-sandwich-auto-a)

" omap is <Plug>(textobj-sandwich-query-i)
" xmap is <Plug>(textobj-sandwich-query-i)
" omap as <Plug>(textobj-sandwich-query-a)
" xmap as <Plug>(textobj-sandwich-query-a)

"wintabs {{{1
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

"ToggleMacroMode {{{1
let s:highlighted_yank_installed = IsInstalled('machakann/vim-highlightedyank')

function! EnterMacroMode()
  let g:clever_f_mark_cursor = 0
  let g:clever_f_mark_char = 0
  let g:qs_enable = 0
  let g:sqs_enable = 0
  let g:macro_mode= 1
  if s:highlighted_yank_installed
    HighlightedyankOff
  endif
endfunction

command! -nargs=0 EnterMacroMode call EnterMacroMode()

function! ExitMacroMode()
  let g:clever_f_mark_cursor = 1
  let g:clever_f_mark_char = 1
  let g:qs_enable = 1
  let g:sqs_enable = 1
  let g:macro_mode= 0
  if s:highlighted_yank_installed
    HighlightedyankOn
  endif
endfunction

command! -nargs=0 ExitMacroMode call ExitMacroMode()

let g:macro_mode= 0

function! ToggleMacroMode()
  if g:macro_mode == 1
    ExitMacroMode
  else
    EnterMacroMode
  endif
endfunction

command! -nargs=0 ToggleMacroMode call ToggleMacroMode()

if IsInstalled('itchyny/lightline.vim')
  noremap <silent> ;m <Cmd>ToggleMacroMode<CR><Cmd>call lightline#update()<cr>
else
  noremap <silent> ;m <Cmd>ToggleMacroMode<CR>
endif

"vim qf {{{1
nmap [q <Plug>(qf_qf_previous)
nmap ]q <Plug>(qf_qf_next)
nmap [l <Plug>(qf_loc_previous)
nmap ]l <Plug>(qf_loc_next)
nmap <c-s> <Plug>(qf_qf_switch)
nmap yoq <Plug>(qf_qf_toggle)
"overrides a unimpared mapping, but I don't use that mapping
nmap yol <Plug>(qf_loc_toggle)

"other {{{1
nnoremap <silent> <a-u> <Cmd>MundoToggle<cr>
nnoremap <a-i> <Cmd>Codi<cr>
nnoremap <silent> ;vh <Cmd>HexokinaseToggle<cr>
nnoremap <silent> <leader>v <Cmd>call WindowSwap#EasyWindowSwap()<CR>
let g:targets_nl = 'nN'
"}}}1
" vim: set fdm=marker:
