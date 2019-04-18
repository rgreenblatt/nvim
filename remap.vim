"remaps which override defaults {{{
map Y y$

noremap "m "_
noremap "j "+

map <space> <leader>
map <space><space> <leader><leader>

noremap <BS> -
nnoremap z<BS> z-

xnoremap <leader>i :<c-u>'<,'>normal ^i
xnoremap <leader>a :<c-u>'<,'>normal $a

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
nnoremap ,p <Cmd>tablast<cr>
"}}}

"macros {{{
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

noremap Q @@
"}}}

"conceal toggle {{{
nnoremap ;vc :<c-u>set <C-R>=&conceallevel ?
      \ 'conceallevel=0' : 'conceallevel=2'<CR><CR>
"}}}

"command mode navigation{{{
cnoremap <C-A> <Home>
"}}}

"fix spelling mistake {{{
inoremap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <c-f> ms[s1z=`s
"}}}

"window maps {{{
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

function! MapWinCmd(key, command, ...)
  if a:0 && a:1
    let suffix = ""
  else
    let suffix = "<CR>"
  endif

  "silent?
  execute "nnoremap <leader>h".a:key." :<c-u>aboveleft vnew <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>j".a:key." :<c-u>belowright new <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>k".a:key." :<c-u>aboveleft new <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>l".a:key." :<c-u>belowright vnew <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>;".a:key." :<c-u>call FloatingBuffer()<CR>:".
        \ a:command.suffix
  execute "nnoremap <leader>,".a:key." :<c-u>tabnew <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>.".a:key." :<c-u>".
        \ a:command.suffix
  execute "nnoremap <leader>H".a:key." :<c-u>topleft vnew <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>J".a:key." :<c-u>botright new <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>K".a:key." :<c-u>topleft new <bar>".
        \ a:command.suffix
  execute "nnoremap <leader>L".a:key." :<c-u>botright vnew <bar>".
        \ a:command.suffix
endfunction
"}}}

"general leader/semicolon/alt maps {{{
nnoremap <silent> <leader>p :<c-u>cd %:p:h<CR>
nnoremap <leader>P :<c-u>cd<space>
nnoremap <silent> <leader>,p :<c-u>tcd %:p:h<CR>
nnoremap <leader>,P :<c-u>tcd<space>
nnoremap <silent> <leader>.p :<c-u>lcd %:p:h<CR>
nnoremap <leader>.P :<c-u>lcd<space>

"not sure if I really need these mappings...
nnoremap <leader>,D :<c-u>tabdo<space>
nnoremap <leader>;D :<c-u>windo<space>
nnoremap <leader>kD :<c-u>cdo<space>
nnoremap <leader>jD :<c-u>ldo<space>
nnoremap <leader>KD :<c-u>cfdo<space>
nnoremap <leader>JD :<c-u>lfdo<space>
nnoremap <leader>lD :<c-u>bufdo<space>
nnoremap <leader>hD :<c-u>argdo<space>

nnoremap <silent> <a-n> :<c-u>set invrelativenumber<CR>
nnoremap <silent> <a-w> :<c-u>%s/\s\+$//<CR>:let @/=''<CR>
nnoremap <silent> <leader>z :<c-u>noh<CR>

nnoremap <silent> <leader>q :<c-u>q<CR>
nnoremap <silent> <leader>A :<c-u>qa<CR>
nnoremap <silent> <leader>b :<c-u>w<CR>
nnoremap <silent> <a-d> :<c-u>w<CR> :<c-u>bd<CR>

nnoremap <leader>ww <C-w><bar>
nnoremap <leader>wt <C-w>_
nnoremap <leader>we <C-w>=
nnoremap <leader>wm <C-w><bar><C-w>_
nmap <leader>w <C-w>

xnoremap <leader>t <C-]>
xnoremap <leader>T <C-T>
xnoremap ;t g<C-]>

nnoremap <leader>t <C-]>
nnoremap <leader>T <C-T>
nnoremap ;t g<C-]>

nnoremap <Leader>s *``cgn
nnoremap <Leader>S #``cgN

nnoremap <leader>Q :bp\|bd #<CR>

nnoremap <leader>f gq
xnoremap <leader>f gq

nnoremap <leader>F gggqG<c-o>

nnoremap <leader>! :%s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <leader>& :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
xnoremap <leader>! y:%s/<C-r>"/
xnoremap <leader>& y:'{,'}s/<C-r>"/

nnoremap <a-p> :<c-u>pwd<cr>
nnoremap <a-r> :<c-u>registers<cr>
nnoremap <a-c> :<c-u>changes<cr>
nnoremap <a-z> :<c-u>help<space>
nnoremap <a-s> :<c-u>source %<cr>
"}}}

"navigate indents {{{
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

nnoremap <silent> <leader>' <Cmd>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> <leader>" <Cmd>call <SID>go_indent(v:count1, -1)<cr>
"}}}

"better cmd line {{{
cnoremap <esc> <c-f>z1<cr>

augroup CmdWin
  autocmd!
  autocmd CmdwinEnter * cnoremap <buffer> <esc> <C-c>
  autocmd CmdwinEnter * nnoremap <esc> <C-c><C-c>
  autocmd CmdwinEnter * nnoremap <expr><buffer><silent> k 'kz7<cr>:nnoremap k k<cr>'
  autocmd CmdwinEnter * au InsertEnter <buffer> :call feedkeys("\<C-c>")
  autocmd CmdwinEnter * set cmdheight=1
  autocmd CmdwinLeave * set cmdheight=3
augroup END
"}}}

"terminal {{{
tnoremap <C-Space> <C-\><C-n>


call MapWinCmd("t", "GlobalSharedTerm")
call MapWinCmd("T", "terminal")
"}}}

"arbitrary command in new window {{{
call MapWinCmd("e", " ", 1)
"}}}

"arrow key window resize {{{
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W><
noremap <right> 3<C-W>>
"}}}

"insert word of the line above/below {{{
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
			\:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
			\:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yiw')<CR>
			\`zp:let @" = @z<CR>a
inoremap <C-E> <C-C>:let @z = @"<CR>mz
			\:exec 'normal!' (col('.')==1 && col('$')==1 ? 'j' : 'jl')<CR>
			\:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yiw')<CR>
			\`zp:let @" = @z<CR>a

"}}}

"select last inserted text {{{
nnoremap gV `[v`]h
"}}}

"line text object {{{
xnoremap il ^og_
onoremap il <Cmd>normal vil<CR>
"}}}

"view text object {{{
xnoremap iv HoL
onoremap iv <Cmd>exec "normal! HVL"<cr>
"}}}

"no ctrl z, I don't typically use vim in a shell, I run it standalone {{{
nnoremap <c-z> <nop>
"}}}

" vim: set fdm=marker:
