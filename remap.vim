"remaps which override defaults {{{1
map Y y$

noremap , "
noremap " ,

noremap ,m "_
noremap ,j "+

map <space> <leader>
map <space><space> <leader><leader>

noremap <BS> -
nnoremap z<BS> z-

nnoremap U <C-r>

nnoremap "a 1gt
nnoremap "s 2gt
nnoremap "d 3gt
nnoremap "f 4gt
nnoremap "g 5gt
nnoremap "h 6gt
nnoremap "j 7gt
nnoremap "k 8gt
nnoremap "l 9gt
nnoremap "; <Cmd>tablast<cr>

xnoremap > >gv
xnoremap < <gv

"macros {{{1
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

noremap Q @@

"conceal toggle {{{1
nnoremap ;vc :<c-u>set <C-R>=&conceallevel ?
      \ 'conceallevel=0' : 'conceallevel=2'<CR><CR>

"command mode navigation{{{1
cnoremap <C-A> <Home>

"fix spelling mistake {{{1
inoremap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u

function! FixSpellingMistake() abort
  let orig_spell_pos = getcurpos()
  normal! [s1z=
  call setpos('.', orig_spell_pos)
endfunction

nnoremap <c-f> <Cmd>call FixSpellingMistake()<cr>

 
"window maps {{{1
function! FloatingOverWindow(path)
  let buf = nvim_create_buf(v:false, v:true)
  
  "window size
  let height = winheight(0)
  let width = winwidth(0)

  let opts = {
        \ 'relative': 'win',
        \ 'row': 0,
        \ 'col': 0,
        \ 'width': width,
        \ 'height': height
        \ }

  " not sure why before and after is required
  set winhighlight=NormalFloat:Normal
  let handle = nvim_open_win(buf, v:true, opts)
  set winhighlight=NormalFloat:Normal
  echo handle 
  let win_id = nvim_get_current_win()
  execute "edit " . a:path

  return win_id
endfunction

function! FloatingFullscreen()
  let buf = nvim_create_buf(v:false, v:true)
  "full size
  let height = &lines - 1 - &cmdheight
  let width = &columns

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 0,
        \ 'col': 0,
        \ 'width': width,
        \ 'height': height
        \ }

  " not sure why before and after is required
  set winhighlight=NormalFloat:Normal
  let win_id = nvim_open_win(buf, v:true, opts)
  set winhighlight=NormalFloat:Normal

  return win_id
endfunction

function! MapWinCmd(key, command, ...)
  if a:0 && a:1
    let suffix = ""
  else
    let suffix = "<CR>"
  endif

  "silent?
  execute "nnoremap <space>h".a:key." :<c-u>aboveleft vnew <bar>".
        \ a:command.suffix
  execute "nnoremap <space>j".a:key." :<c-u>belowright new <bar>".
        \ a:command.suffix
  execute "nnoremap <space>k".a:key." :<c-u>aboveleft new <bar>".
        \ a:command.suffix
  execute "nnoremap <space>l".a:key." :<c-u>belowright vnew <bar>".
        \ a:command.suffix
  execute "nnoremap <space>;".a:key." :<c-u>call FloatingFullscreen()<CR>:".
        \ a:command.suffix
  execute "nnoremap <space>,".a:key." :<c-u>tabnew <bar>".
        \ a:command.suffix
  execute "nnoremap <space>.".a:key." :<c-u>".
        \ a:command.suffix
  execute "nnoremap <space>H".a:key." :<c-u>topleft vnew <bar>".
        \ a:command.suffix
  execute "nnoremap <space>J".a:key." :<c-u>botright new <bar>".
        \ a:command.suffix
  execute "nnoremap <space>K".a:key." :<c-u>topleft new <bar>".
        \ a:command.suffix
  execute "nnoremap <space>L".a:key." :<c-u>botright vnew <bar>".
        \ a:command.suffix
endfunction

"general space/semicolon/alt maps {{{1
nnoremap <silent> <space>p <Cmd>cd %:p:h<CR>
nnoremap <space>P :<c-u>cd<space>
nnoremap <silent> <space>,p <Cmd>tcd %:p:h<CR>
nnoremap <space>,P :<c-u>tcd<space>
nnoremap <silent> <space>.p <Cmd>lcd %:p:h<CR>
nnoremap <space>.P :<c-u>lcd<space>

nnoremap <silent> <a-n> <Cmd>set invrelativenumber<CR>
nnoremap <silent> <a-w> <Cmd>%s/\s\+$//<CR>:let @/=''<CR>

nnoremap <silent> <space>q <Cmd>q<CR>
nnoremap <silent> <space>A <Cmd>qa<CR>
nnoremap <silent> <space>b <Cmd>w<CR>
nnoremap <silent> <a-d> <Cmd>bd!<CR>

xnoremap ;i :'<,'>normal ^i
xnoremap ;a :'<,'>normal $a

nnoremap <space>ww <C-w><bar>
nnoremap <space>wt <C-w>_
nnoremap <space>we <C-w>=
nnoremap <space>wm <C-w><bar><C-w>_
nmap <space>w <C-w>

xnoremap <space>t <C-]>
xnoremap <space>T <C-T>
xnoremap ;t g<C-]>

nnoremap <space>t <C-]>
nnoremap <space>T <C-T>
nnoremap ;t g<C-]>

nnoremap <space>s *``cgn
nnoremap <space>S #``cgN

nnoremap <space>Q <Cmd>bp\|bd #<CR>
nnoremap <space><space>Q <Cmd>bp\|bd! #<CR>

nnoremap <space>f gq
xnoremap <space>f gq

nnoremap <space>F gggqG<c-o>

nnoremap <a-p> <Cmd>pwd<cr>
nnoremap <a-s> <Cmd>source %<cr>

nnoremap <space>z :<c-u>s/\C<left><left><left><left>
vnoremap <space>z :s/\C<left><left><left><left>
nnoremap <space><space>c <Cmd>let @+=@@<cr>

"navigate indents {{{1
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

nnoremap <silent> <space>' <Cmd>call <SID>go_indent(v:count1, 1)<cr>
nnoremap <silent> <space>" <Cmd>call <SID>go_indent(v:count1, -1)<cr>

"better cmd line {{{1
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

"terminal {{{1
tnoremap <C-Space> <C-\><C-n>

call MapWinCmd("t", "terminal")
call MapWinCmd("T", "GlobalSharedTerm")

"arbitrary command in new window and scratch {{{1
call MapWinCmd("e", " ", 1)
call MapWinCmd("w", "setlocal bufhidden=hide nobuflisted buftype=nofile")

"arrow key window resize {{{1
noremap <up>    <C-W>+
noremap <down>  <C-W>-
noremap <left>  3<C-W>>
noremap <right> 3<C-W><

"insert word of the line above/below {{{1
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
			\:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
			\:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yiw')<CR>
			\`zp:let @" = @z<CR>a
inoremap <C-E> <C-C>:let @z = @"<CR>mz
			\:exec 'normal!' (col('.')==1 && col('$')==1 ? 'j' : 'jl')<CR>
			\:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yiw')<CR>
			\`zp:let @" = @z<CR>a


"select last inserted/yank/etc text {{{1
nnoremap gV `[v`]h

"fold {{{1
nnoremap zJ zczjzo
nnoremap zK zczkzo

"no ctrl z, I don't typically use vim in a shell, I run it standalone {{{1
nnoremap <c-z> <nop>
"}}}

" vim: set fdm=marker:
