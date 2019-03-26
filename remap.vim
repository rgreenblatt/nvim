"remaps which override defaults:
map Y y$

noremap ,m "_
noremap ,j "+
map , "

map <space> <leader>
map <space><space> <leader><leader>

noremap <BS> -
nnoremap z<BS> z-

inoremap <C-b> <esc>:<C-u>le<cr>A

noremap ' `
noremap ` '

xnoremap <expr> I mode()=~'\cv' ? ':normal ^i' : 'I'
xnoremap <expr> A mode()=~'\cv' ? ':normal $a' : 'A'

noremap <C-r> R
noremap R <C-r> 
noremap gR g<C-r> 

nnoremap "q 1gt
nnoremap "w 2gt
nnoremap "e 3gt
nnoremap "r 4gt
nnoremap "t 5gt
nnoremap "y 6gt
nnoremap "u 7gt
nnoremap "i 8gt
nnoremap "o 9gt
nnoremap "p 10gt

"macros
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

noremap Q @@

"better jumping (uses vim-EnhancedJumps)
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

"conceal toggle
nnoremap <leader><leader>c :<c-u>set <C-R>=&conceallevel ? 'conceallevel=0' : 'conceallevel=2'<CR><CR>

"command mode navigation
cnoremap <C-A> <Home>

"general leader maps
noremap <silent> <leader>kt :<c-u>sp <bar> te<CR>
noremap <silent> <leader>lt :<c-u>vs <bar> te<CR>
noremap <silent> <leader>,t :<c-u>tabe <bar> te<CR>
noremap <silent> <leader>.t :<c-u>te<CR>

noremap <silent> <leader>ks :<c-u>sp<CR>:Startify<CR>
noremap <silent> <leader>ls :<c-u>vs<CR>:Startify<CR>
noremap <silent> <leader>,s :<c-u>tabe<CR>:Startify<CR>
noremap <silent> <leader>.s :<c-u>Startify<CR>

noremap <silent> <leader>kf :<c-u>sp<CR>
noremap <silent> <leader>lf :<c-u>vs<CR>
noremap <silent> <leader>,f :<c-u>tabe %<CR>

noremap <silent> <leader>p :<c-u>cd %:p:h<CR>
noremap <silent> <leader><leader>n :<c-u>set invrelativenumber<CR>
noremap <silent> <leader><leader>w :<c-u>%s/\s\+$//<CR>:let @/=''<CR>
noremap <silent> <leader>z :<c-u>noh<CR>

noremap <silent> <leader>q :<c-u>q<CR>
noremap <silent> <leader>a :<c-u>qa<CR>
noremap <silent> <leader>W :<c-u>w<CR>
noremap <silent> <leader><leader>d :<c-u>w<CR> :<c-u>bd<CR>

noremap <leader>ww <C-w><bar>
noremap <leader>wt <C-w>_
noremap <leader>we <C-w>=
noremap <leader>wm <C-w><bar><C-w>_
map <leader>w <C-w>

noremap <leader>t <C-]>
noremap <leader>T g<C-]>

nnoremap <Leader>s *``cgn
nnoremap <Leader>S #``cgN

noremap <leader>Q :bp\|bd #<CR>

noremap <leader><leader>o :Google
noremap <leader><leader>O :Googlef

"general semicolon maps
nnoremap ;f 1z=
nnoremap ;t :<c-u>ThesaurusQueryReplaceCurrentWord<CR>
vnoremap ;t y:ThesaurusQueryReplace <C-r>"<CR>

"alt window navigation (uses keyboard remaping code)
map <silent> gzl :<c-u>call Focus('right', 'l')<CR>
map <silent> gzh :<c-u>call Focus('left', 'h')<CR>
map <silent> gzk :<c-u>call Focus('up', 'k')<CR>
map <silent> gzj :<c-u>call Focus('down', 'j')<CR>

"term esc
tnoremap <C-Space> <C-\><C-n>

"fzf maps
noremap <leader>gf <esc>:<c-u>Files<space>
noremap <leader>gg <esc>:<c-u>GFiles<space>
noremap <leader>gs <esc>:<c-u>GFiles?<space>
noremap <leader>gb <esc>:<c-u>Buffers<cr>
noremap <leader>gr <esc>:<c-u>Rg<cr>
noremap <leader>gL <esc>:<c-u>BLines<cr> 
noremap <leader>gl <esc>:<c-u>Lines<cr> 
noremap <leader>gT <esc>:<c-u>BTags<cr> 
noremap <leader>gt <esc>:<c-u>Tags<cr> 
noremap <leader>gm <esc>:<c-u>Marks<cr> 
noremap <leader>gw <esc>:<c-u>Windows<cr> 
noremap <leader>gh <esc>:<c-u>History<cr>
noremap <leader>g: <esc>:<c-u>History:<cr>
noremap <leader>g/ <esc>:<c-u>History/<cr>
noremap <leader>gp <esc>:<c-u>Snippets<cr>
noremap <leader>gC <esc>:<c-u>BCommits<cr>
noremap <leader>gc <esc>:<c-u>Commits<cr>
noremap <leader>go <esc>:<c-u>Commands<cr>
noremap <leader>gn <esc>:<c-u>Maps<cr>
noremap <leader>gk <esc>:<c-u>Helptags<cr>
noremap <leader>gF <esc>:<c-u>Filetypes<cr>

noremap <leader>Gf <esc>:<c-u>Files<cr>
noremap <leader>Gg <esc>:<c-u>GFiles<cr>
noremap <leader>Gs <esc>:<c-u>GFiles?<cr>

"coc remaps
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

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` for navigate diagnostics
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
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

"show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if &filetype == 'vim'
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

"java doc commenting (requires eclim/eclipse workspace)
"noremap <silent> <leader><leader>j <esc>:<c-u>JavaDocComment<CR>

" Go to last active window
if !exists('g:lastwin')
    let g:lastwin = 1000
endif

nmap <silent> gb :<c-u>exe "call win_gotoid( ".g:lastwin ")"<CR>
au WinLeave * let g:lastwin = win_getid()

""insertchar options
"let g:insert_char_no_default_mapping = 1
"nmap <leader>s <Plug>InsertChar
"nmap <leader>S <Plug>InsertCharAfter

"scratch
let g:scratch_no_mappings = 1

nmap gs <plug>(scratch-reuse)
nmap gS <plug>(scratch-clear)

xmap gs <plug>(scratch-selection-reuse)
xmap gS <plug>(scratch-selection-clear)

"yankring
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
xnoremap <expr> p v:register=='"'?'pgvy':'p'

map ;o p;n
map ;O P;n

"total hack:
map ;p0 p
map ;p1 p;n
map ;p2 p;n;n
map ;p3 p;n;n;n
map ;p4 p;n;n;n;n
map ;p5 p;n;n;n;n;n
map ;p6 p;n;n;n;n;n;n
map ;p7 p;n;n;n;n;n;n;n
map ;p8 p;n;n;n;n;n;n;n;n
map ;p9 p;n;n;n;n;n;n;n;n;n

map ;P0 P
map ;P1 P;n
map ;P2 P;n;n
map ;P3 P;n;n;n
map ;P4 P;n;n;n;n
map ;P5 P;n;n;n;n;n
map ;P6 P;n;n;n;n;n;n
map ;P7 P;n;n;n;n;n;n;n
map ;P8 P;n;n;n;n;n;n;n;n
map ;P9 P;n;n;n;n;n;n;n;n;n

map ;n <Plug>(miniyank-cycle)
map ;N <Plug>(miniyank-cycleback)

noremap <silent> <leader><leader>f :<c-u>VimadeToggle<cr>

"NarrowRegion
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

map ;r <Plug>NrrwrgnDo 
xmap ;R <Plug>NrrwrgnBangDo 

noremap <silent> <leader><leader>u :<c-u>MundoToggle<cr>

"vimtex
map <leader>xi  <plug>(vimtex-info)
map <leader>xI  <plug>(vimtex-info-full)
map <leader>xt  <plug>(vimtex-toc-open)
map <leader>xT  <plug>(vimtex-toc-toggle)
map <leader>xq  <plug>(vimtex-log)
map <leader>xv  <plug>(vimtex-view)
map <leader>xr  <plug>(vimtex-reverse-search)
map <leader>xl  <plug>(vimtex-compile)
map <leader>xL  <plug>(vimtex-compile-selected)
xmap <leader>xL  <plug>(vimtex-compile-selected)
map <leader>xk  <plug>(vimtex-stop)
map <leader>xK  <plug>(vimtex-stop-all)
map <leader>xe  <plug>(vimtex-errors)
map <leader>xo  <plug>(vimtex-compile-output)
map <leader>xg  <plug>(vimtex-status)
map <leader>xG  <plug>(vimtex-status-all)
map <leader>xc  <plug>(vimtex-clean)
map <leader>xC  <plug>(vimtex-clean-full)
map <leader>xm  <plug>(vimtex-imaps-list)
map <leader>xx  <plug>(vimtex-reload)
map <leader>xX  <plug>(vimtex-reload-state)
map <leader>xs  <plug>(vimtex-toggle-main)

"custom operators
map _  <Plug>(operator-select)
call operator#user#define('select', 'Op_select_region')
function Op_select_region(window_heightmotion_wiseness)
    normal! `[v`]
endfunction

map ;_  <Plug>(operator-select-block)
call operator#user#define('select-block', 'Op_select_block')
function Op_select_block(window_heightmotion_wiseness)
    exe "normal `[\<c-v>`]"
endfunction

map <leader>_  <Plug>(operator-select-line)
call operator#user#define('select-line', 'Op_select_line')
function Op_select_line(window_heightmotion_wiseness)
    normal! `[V`]
endfunction

map <leader>wa  <Plug>(operator-adjust)
call operator#user#define('adjust', 'Op_adjust_window_height')
function! Op_adjust_window_height(motion_wiseness)
    execute (line("']") - line("'[") + 1) 'wincmd' '_'
    normal! `[zt
endfunction

noremap <leader><leader>s :<c-u>Codi<cr>

noremap <silent> <leader><leader>h :<c-u>HexokinaseToggle<cr>

function! s:indent_len(str)
    return type(a:str) == 1 ? len(matchstr(a:str, '^\s*')) : 0
endfunction

function! s:go_indent(times, dir)
    for _ in range(a:times)
        let l = line('.')
        let x = line('$')
        let i = s:indent_len(getline(l))
        let e = empty(getline(l))
        while l >= 1 && l <= x
            let line = getline(l + a:dir)
            let l += a:dir
            if s:indent_len(line) != i || empty(line) != e
                break
            endif
        endwhile
        let l = min([max([1, l]), x])
        execute 'normal! '. l .'G^'
    endfor
endfunction

nnoremap <silent> <leader>; :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> <leader>: :<c-u>call <SID>go_indent(v:count1, -1)<cr>

nnoremap <silent> <leader>v :call WindowSwap#EasyWindowSwap()<CR>

noremap <silent> <leader><leader>g :Goyo<cr>

function SetupGoyo() 
    Limelight
    noremap <silent> <leader><leader>g :Goyo!<cr>
endfunction

function SetupNoGoyo() 
    Limelight!
    noremap <silent> <leader><leader>g :Goyo<cr>
endfunction

autocmd! User GoyoEnter call SetupGoyo()
autocmd! User GoyoLeave call SetupNoGoyo()
