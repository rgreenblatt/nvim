"fzf maps {{{
nnoremap ;j :<c-u>Files %:p:h<cr>
nnoremap ;k :<c-u>GFiles %:p:h<cr>
nnoremap ;s :<c-u>GFiles? %:p:h<cr>

nnoremap <leader>gf :<c-u>Files<space>
nnoremap <leader>gg :<c-u>GFiles<space>
nnoremap <leader>gs :<c-u>GFiles?<space>
nnoremap <leader>gb :<c-u>Buffers<cr>
nnoremap <leader>gr :<c-u>Rg<cr>
nnoremap <leader>gL :<c-u>BLines<cr>
nnoremap <leader>gl :<c-u>Lines<cr>
nnoremap <leader>gT :<c-u>BTags<cr>
nnoremap <leader>gt :<c-u>Tags<cr>
nnoremap <leader>gm :<c-u>Marks<cr>
nnoremap <leader>gw :<c-u>Windows<cr>
nnoremap <leader>gh :<c-u>History<cr>
nnoremap <leader>g: :<c-u>History:<cr>
nnoremap <leader>g/ :<c-u>History/<cr>
nnoremap <leader>gp :<c-u>Snippets<cr>
nnoremap <leader>gC :<c-u>BCommits<cr>
nnoremap <leader>gc :<c-u>Commits<cr>
nnoremap <leader>go :<c-u>Commands<cr>
nnoremap <leader>gn :<c-u>Maps<cr>
nnoremap <leader>gk :<c-u>Helptags<cr>
nnoremap <leader>gF :<c-u>Filetypes<cr>

nnoremap <leader>Gf :<c-u>Files<cr>
nnoremap <leader>Gg :<c-u>GFiles<cr>
nnoremap <leader>Gs :<c-u>GFiles?<cr>
"}}}

"better jumping (uses vim-EnhancedJumps) {{{
nmap <silent><expr> <TAB>
            \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
            \ "\<Plug>EnhancedJumpsOlder"
nmap <silent><expr> <S-TAB>
            \ coc#expandableOrJumpable() ? coc#rpc#request('snippetPrev', []) :
            \ "\<Plug>EnhancedJumpsNewer"

nmap g<Tab> <Plug>EnhancedJumpsLocalOlder
nmap g<S-Tab> <Plug>EnhancedJumpsLocalNewer

nmap <space><Tab> <Plug>EnhancedJumpsRemoteOlder
nmap <space><S-Tab> <Plug>EnhancedJumpsRemoteNewer

nmap z;  <Plug>EnhancedJumpsFarFallbackChangeOlder
nmap z,  <Plug>EnhancedJumpsFarFallbackChangeNewer
"}}}

"dirvish in new window {{{
nnoremap <silent> <leader>kd :<c-u>sp<CR>:Dirvish %<CR>
nnoremap <silent> <leader>ld :<c-u>vs<CR>:Dirvish %<CR>
nnoremap <silent> <leader>,d :<c-u>tabe<CR>:Dirvish %<CR>
nnoremap <silent><expr> <leader>;d ':<c-u>call FloatingBuffer()<cr>:Dirvish<space>'.expand('%').'<CR>'
"}}}

"plugin remaps for a heavier install {{{
if exists("g:headless")
else
    "startify in new window {{{
    nnoremap <silent> <leader>ks :<c-u>sp<CR>:Startify<CR>
    nnoremap <silent> <leader>ls :<c-u>vs<CR>:Startify<CR>
    nnoremap <silent> <leader>,s :<c-u>tabe<CR>:Startify<CR>
    nnoremap <silent> <leader>.s :<c-u>Startify<CR>
    nnoremap <silent> <leader>;s :<c-u>call FloatingBuffer()<cr>:Startify<cr>
    "}}}

    "google {{{
    nnoremap <leader><leader>o :Google
    nnoremap <leader><leader>O :Googlef

    xnoremap <leader><leader>o :Google
    xnoremap <leader><leader>O :Googlef
    "}}}

    "thesaurus {{{
    nnoremap ;t :<c-u>ThesaurusQueryReplaceCurrentWord<CR>
    xnoremap ;t y:ThesaurusQueryReplace <C-r>"<CR>
    "}}}

    "window navigation (requires keyboard remaping and i3-vim-focus {{{
    nnoremap <silent> gzl :<c-u>call Focus('right', 'l')<CR>
    nnoremap <silent> gzh :<c-u>call Focus('left', 'h')<CR>
    nnoremap <silent> gzk :<c-u>call Focus('up', 'k')<CR>
    nnoremap <silent> gzj :<c-u>call Focus('down', 'j')<CR>
    "}}}

    "coc remaps {{{
    " use <tab> for trigger completion and navigate to next complete item
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()
    inoremap <expr> <S-Tab>
                \ pumvisible() ? "\<C-p>" :
                \ coc#expandableOrJumpable() ? coc#rpc#request('snippetPrev', []) : "\<S-Tab>"

    snoremap <silent><expr> <TAB>
                \ coc#expandableOrJumpable() ? coc#rpc#request('doKeymap', ['snippets-expand-jump','']) :
                \ "\<TAB>"
    snoremap <silent><expr> <S-TAB>
                \ coc#expandableOrJumpable() ? coc#rpc#request('snippetPrev', []) :
                \ "\<S-TAB>"

    "pum close/break undo
    inoremap <c-space> <c-g>u

    "snippet trigger
    imap <C-s> <Plug>(coc-snippets-expand)

    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    nmap <leader>L :<c-u>CocList<space>

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

    " format
    nmap <leader>f <Plug>(coc-format-selected)
    xmap <leader>f <Plug>(coc-format-selected)

    nmap <leader>F <Plug>(coc-format)

    nmap <leader>e <Plug>(coc-rename)

    nmap <leader>c <Plug>(coc-fix-current)

    nmap <leader>C <Plug>(coc-codeaction)

    nmap <leader>a <Plug>(coc-codeaction-selected)
    xmap <leader>a <Plug>(coc-codeaction-selected)

    nmap <leader>j <Plug>(coc-float-jump)

    "show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if &filetype == 'vim'
            execute 'h '.expand('<cword>')
        else
            call CocAction('doHover')
        endif
    endfunction
    "}}}


    "java doc commenting (requires eclim/eclipse workspace) {{{
    "nnoremap <silent> <leader><leader>j <esc>:<c-u>JavaDocComment<CR>
    "}}}

    "vimtex {{{
    map  <leader>xi   <plug>(vimtex-info)
    map  <leader>xI   <plug>(vimtex-info-full)
    map  <leader>xt   <plug>(vimtex-toc-open)
    map  <leader>xT   <plug>(vimtex-toc-toggle)
    map  <leader>xq   <plug>(vimtex-log)
    map  <leader>xv   <plug>(vimtex-view)
    map  <leader>xr   <plug>(vimtex-reverse-search)
    map  <leader>xl   <plug>(vimtex-compile)
    map  <leader>xL   <plug>(vimtex-compile-selected)
    xmap <leader>xL   <plug>(vimtex-compile-selected)
    map  <leader>xk   <plug>(vimtex-stop)
    map  <leader>xK   <plug>(vimtex-stop-all)
    map  <leader>xe   <plug>(vimtex-errors)
    map  <leader>xo   <plug>(vimtex-compile-output)
    map  <leader>xg   <plug>(vimtex-status)
    map  <leader>xG   <plug>(vimtex-status-all)
    map  <leader>xc   <plug>(vimtex-clean)
    map  <leader>xC   <plug>(vimtex-clean-full)
    map  <leader>xm   <plug>(vimtex-imaps-list)
    map  <leader>xx   <plug>(vimtex-reload)
    map  <leader>xX   <plug>(vimtex-reload-state)
    map  <leader>xs   <plug>(vimtex-toggle-main)
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
"nmap p <Plug>(miniyank-autoput)
"nmap P <Plug>(miniyank-autoPut)
"xmap p <Plug>(miniyank-autoput)
"xmap P <Plug>(miniyank-autoPut)
"xnoremap <expr> p v:register=='"'?'pgvy':'p'

"nmap ;;p p;n
"nmap ;;P P;n
"xmap <expr> ;;p v:register=='"'?'p;ngvy':'p;n'
"xmap ;;P P;n

""total hack:
"nmap ;p0 p
"nmap ;p1 p;n
"nmap ;p2 p;n;n
"nmap ;p3 p;n;n;n
"nmap ;p4 p;n;n;n;n
"nmap ;p5 p;n;n;n;n;n
"nmap ;p6 p;n;n;n;n;n;n
"nmap ;p7 p;n;n;n;n;n;n;n
"nmap ;p8 p;n;n;n;n;n;n;n;n
"nmap ;p9 p;n;n;n;n;n;n;n;n;n

"xmap ;p0 p
"xmap ;p1 p;n
"xmap ;p2 p;n;n
"xmap ;p3 p;n;n;n
"xmap ;p4 p;n;n;n;n
"xmap ;p5 p;n;n;n;n;n
"xmap ;p6 p;n;n;n;n;n;n
"xmap ;p7 p;n;n;n;n;n;n;n
"xmap ;p8 p;n;n;n;n;n;n;n;n
"xmap ;p9 p;n;n;n;n;n;n;n;n;n

"nmap ;P0 P
"nmap ;P1 P;n
"nmap ;P2 P;n;n
"nmap ;P3 P;n;n;n
"nmap ;P4 P;n;n;n;n
"nmap ;P5 P;n;n;n;n;n
"nmap ;P6 P;n;n;n;n;n;n
"nmap ;P7 P;n;n;n;n;n;n;n
"nmap ;P8 P;n;n;n;n;n;n;n;n
"nmap ;P9 P;n;n;n;n;n;n;n;n;n

"xmap ;P0 P
"xmap ;P1 P;n
"xmap ;P2 P;n;n
"xmap ;P3 P;n;n;n
"xmap ;P4 P;n;n;n;n
"xmap ;P5 P;n;n;n;n;n
"xmap ;P6 P;n;n;n;n;n;n
"xmap ;P7 P;n;n;n;n;n;n;n
"xmap ;P8 P;n;n;n;n;n;n;n;n
"xmap ;P9 P;n;n;n;n;n;n;n;n;n

"nmap ;n <Plug>(miniyank-cycle)
"nmap ;N <Plug>(miniyank-cycleback)
"}}}

"vimade {{{
" nnoremap <silent> ;vt :<c-u>VimadeToggle<cr>
" nnoremap <silent> ;vb :<c-u>VimadeBufDisable<cr>
" nnoremap <silent> ;vw :<c-u>VimadeWinDisable<cr>

" augroup VimadeCmdLine
"     au!
"     au CmdLineEnter * VimadeBufDisable
"     au CmdlineLeave * VimadeBufEnable
" augroup END
"}}}

"NarrowRegion {{{
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

map ;r <Plug>NrrwrgnDo
xmap ;R <Plug>NrrwrgnBangDo
"}}}

nnoremap <silent> <leader><leader>u :<c-u>MundoToggle<cr>

"custom operators {{{
map _  <Plug>(operator-select)
call operator#user#define('select', 'Op_select_region')
function! Op_select_region(window_heightmotion_wiseness)
    normal! `[v`]
endfunction

map ;_  <Plug>(operator-select-block)
call operator#user#define('select-block', 'Op_select_block')
function! Op_select_block(window_heightmotion_wiseness)
    exe "normal `[\<c-v>`]"
endfunction

map <leader>_  <Plug>(operator-select-line)
call operator#user#define('select-line', 'Op_select_line')
function! Op_select_line(window_heightmotion_wiseness)
    normal! `[V`]
endfunction

map <leader>wa  <Plug>(operator-adjust)
call operator#user#define('adjust', 'Op_adjust_window_height')
function! Op_adjust_window_height(motion_wiseness)
    execute (line("']") - line("'[") + 1) 'wincmd' '_'
    normal! `[zt
endfunction
"}}}

nnoremap <leader><leader>s :<c-u>Codi<cr>

nnoremap <silent> ;vc :<c-u>HexokinaseToggle<cr>

nnoremap <silent> <leader>v :<c-u>call WindowSwap#EasyWindowSwap()<CR>

"goyo {{{
nnoremap <silent> ;vg :Goyo<cr>

function! SetupGoyo()
    Limelight
    nnoremap <silent> ;vg :Goyo!<cr>
endfunction

function! SetupNoGoyo()
    Limelight!
    nnoremap <silent> ;vg :Goyo<cr>
endfunction

autocmd! User GoyoEnter call SetupGoyo()
autocmd! User GoyoLeave call SetupNoGoyo()
"}}}

"git {{{
nnoremap <silent> ;gs :<c-u>Gstatus<cr>
nnoremap ;gd :<c-u>Gvdiff<space>

"when bug gets fixed, switch back to builtin commands
nnoremap ;gp :<c-u>Git pull<cr>
nnoremap ;gh :<c-u>Git push<cr>

nnoremap ;gcc :<c-u>Gcommit -v<cr>
nnoremap ;gca :<c-u>Gcommit -v -a<cr>
nnoremap ;gcA :<c-u>Gcommit --amend -v -a<cr>
nnoremap ;go :<c-u>Gcheckout<space>
nnoremap ;gr :<c-u>Gremove<space>
nnoremap ;gm :<c-u>Gmove<space>
"}}}

"ninja-feet overides mappings {{{
nnoremap ;i [i
nnoremap ;I [I
"}}}

"sideways maps {{{
nnoremap <silent> ;h :<c-u>SidewaysJumpLeft<cr>
nnoremap <silent> ;l :<c-u>SidewaysJumpRight<cr>
nnoremap <silent> ;y :<c-u>SidewaysLeft<cr>
nnoremap <silent> ;o :<c-u>SidewaysRight<cr>
"}}}

"fzf terminal remap {{{
"tnoremap <c-a> <a-c>
"}}}

"nvimgdb {{{
let g:nvimgdb_disable_start_keymaps = 1
nnoremap ;dp :<c-u>SetDebugPath<space>
nnoremap <expr> ;dsg exists('g:debug_path') ? ':<c-u>GdbStart gdb -q<space>'.expand(g:debug_path).'<cr>' : 
            \':<c-u>GdbStart gdb -q<space>'
nnoremap <expr> ;dsl exists('g:debug_path') ? ':<c-u>GdbStart lldb <space>'.expand(g:debug_path).'<cr>' : 
            \':<c-u>GdbStart lldb<space>'
nnoremap <expr> ;dsp exists('g:debug_path') ? 
            \':<c-u>GdbStart python -m pdb <space>'.expand(g:debug_path).'<cr>' : 
            \':<c-u>GdbStart python -m pdb<space>'
nnoremap ;dq :<c-u>GdbDebugStop<cr>
nnoremap ;dr :<c-u>GdbBreakpointClearAll<cr>
nnoremap ;di :<c-u>GdbInterrupt<cr>
nnoremap ;dE :<c-u>GdbEvalWord<home>
let g:nvimgdb_config = {
            \ 'key_until':         ';du',
            \ 'key_continue':      ';dc',
            \ 'key_next':          ';dn',
            \ 'key_step':          ';ds',
            \ 'key_finish':        ';df',
            \ 'key_breakpoint':    ';db',
            \ 'key_frameup':       ';dk',
            \ 'key_framedown':     ';dj',
            \ 'key_eval':          ';de',
            \ 'set_tkeymaps':      'function("GdbCallAsync", "keymaps.setT")',
            \ 'set_keymaps':       'function("GdbCallAsync", "keymaps.set")',
            \ 'unset_keymaps':     'function("GdbCallAsync", "keymaps.unset")',
            \ 'sign_current_line': '▶',
            \ 'sign_breakpoint':   [ '●', '●²', '●³', '●⁴', '●⁵', '●⁶', '●⁷', '●⁸', '●⁹', '●ⁿ' ],
            \ 'split_command':     'split'
            \ }
"}}}

" vim: set fdm=marker:
