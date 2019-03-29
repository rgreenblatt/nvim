"remaps which override defaults:
map Y y$

noremap "m "_
noremap "j "+

map <space> <leader>
map <space><space> <leader><leader>

noremap <BS> -
nnoremap z<BS> z-

xnoremap <expr> I mode()=~'\cv' ? ':normal ^i' : 'I'
xnoremap <expr> A mode()=~'\cv' ? ':normal $a' : 'A'

noremap <C-r> R
noremap R <C-r> 
noremap gR g<C-r> 

nnoremap ,q 1gt
nnoremap ,w 2gt
nnoremap ,e 3gt
nnoremap ,r 4gt
nnoremap ,t 5gt
nnoremap ,y 6gt
nnoremap ,u 7gt
nnoremap ,i 8gt
nnoremap ,o 9gt
nnoremap ,p 10gt

"macros
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

noremap Q @@

"conceal toggle
nnoremap <leader><leader>c :<c-u>set <C-R>=&conceallevel ? 'conceallevel=0' : 'conceallevel=2'<CR><CR>

"command mode navigation
cnoremap <C-A> <Home>

function! FloatingBuffer()
  let buf = nvim_create_buf(v:false, v:true)

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

"general leader maps
nnoremap <silent> <leader>kt :<c-u>sp <bar> te<CR>
nnoremap <silent> <leader>lt :<c-u>vs <bar> te<CR>
nnoremap <silent> <leader>;t :<c-u>call FloatingBuffer()<CR>:te<CR>
nnoremap <silent> <leader>,t :<c-u>tabe <bar> te<CR>
nnoremap <silent> <leader>.t :<c-u>te<CR>

nnoremap <silent> <leader>kf :<c-u>sp<CR>
nnoremap <silent> <leader>lf :<c-u>vs<CR>
nnoremap <silent><expr> <leader>;f ':<c-u>call FloatingBuffer()<cr>:<c-u>e<space>'.expand('%').'<CR>'
nnoremap <silent> <leader>,f :<c-u>tabe %<CR>

nnoremap <silent> <leader>p :<c-u>cd %:p:h<CR>
nnoremap <silent> <leader><leader>n :<c-u>set invrelativenumber<CR>
nnoremap <silent> <leader><leader>w :<c-u>%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <silent> <leader>z :<c-u>noh<CR>

nnoremap <silent> <leader>q :<c-u>q<CR>
nnoremap <silent> <leader>a :<c-u>qa<CR>
nnoremap <silent> <leader>W :<c-u>w<CR>
nnoremap <silent> <leader><leader>d :<c-u>w<CR> :<c-u>bd<CR>

nnoremap <leader>ww <C-w><bar>
nnoremap <leader>wt <C-w>_
nnoremap <leader>we <C-w>=
nnoremap <leader>wm <C-w><bar><C-w>_
nmap <leader>w <C-w>

nnoremap <leader>t <C-]>
nnoremap <leader>T g<C-]>

nnoremap <Leader>s *``cgn
nnoremap <Leader>S #``cgN

nnoremap <leader>Q :bp\|bd #<CR>

nnoremap ;f 1z=
nnoremap ;;s :<c-u>source %<cr>

"term esc
tnoremap <C-Space> <C-\><C-n>

" Go to last active window
if !exists('g:lastwin')
    let g:lastwin = 1000
endif

nmap <silent> gb :<c-u>exe "call win_gotoid( ".g:lastwin ")"<CR>
au WinLeave * let g:lastwin = win_getid()

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

nnoremap <silent> <leader>' :<c-u>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> <leader>" :<c-u>call <SID>go_indent(v:count1, -1)<cr>

"use command line window
cnoremap <esc> <c-f>z1<cr>

augroup CmdWin
    au! 
    au CmdwinEnter * cnoremap <buffer> <esc> <C-c>
    au CmdwinEnter * nnoremap <esc> <C-c><C-c>
    au CmdwinEnter * nnoremap <expr><buffer><silent> k 'kz7<cr>:nnoremap k k<cr>'
    au CmdwinEnter * au InsertEnter <buffer> :call feedkeys("\<C-c>")
augroup END

"swap comma/quote and apostrophe/backtick
set langmap=\\,\",\"\\,,`','`
