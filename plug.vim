" autoinstall vim-plug {{{
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
" }}}
set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')
"plugins {{{
"plugins for a headed install {{{
if !exists("g:headless")
  Plug 'Carpetsmoker/xdg_open.vim'
  Plug 'rgreenblatt/i3-vim-focus'
  Plug 'szw/vim-g'
endif
"}}}
" Plug 'dansomething/vim-eclim'
if !exists("g:disable_coc")
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
endif
Plug 'makerj/vim-pdf'
Plug 'liuchengxu/vista.vim'
Plug 'arakashic/chromatica.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'Chiel92/vim-autoformat'
Plug 'lervag/vimtex'
Plug 'mhinz/vim-startify'
Plug 'itchyny/calendar.vim'
Plug 'wikitopian/hardmode'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-CountJump'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-EnhancedJumps'
Plug 'wellle/targets.vim'
Plug 'rgreenblatt/vim-wintabs'
"Plug 'rgreenblatt/vim-insert-char'
Plug 'rgreenblatt/scratch.vim'
Plug 'rgreenblatt/vim-ninja-feet'
Plug 'rgreenblatt/c-conceal'
Plug 'rgreenblatt/vim-unimpaired'
Plug 'rgreenblatt/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'markonm/traces.vim'
Plug 'tommcdo/vim-lion'
Plug 'tommcdo/vim-exchange'
" Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" Plug 'neomake/neomake'
" Plug 'vim-scripts/restore_view.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/gv.vim'
" Plug 'TaDaa/vimade'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rhysd/clever-f.vim'
Plug 'unblevable/quick-scope'
" Plug 'rgreenblatt/sneak-quick-scope'
" Plug 'deris/vim-shot-f'
Plug 'chaoren/vim-wordmotion'
Plug 'wesQ3/vim-windowswap'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-function'
Plug 'bfredl/nvim-miniyank'
Plug 'ehamberg/vim-cute-python'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-signify'
Plug 'chrisbra/NrrwRgn'
Plug 'kien/rainbow_parentheses.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'derekwyatt/vim-scala'
Plug 'neomutt/neomutt.vim'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'lambdalisue/suda.vim'
Plug 'LucHermitte/VimFold4C'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'tmhedberg/SimpylFold'
Plug 'justinmk/vim-dirvish'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'romainl/vim-cool'
Plug 'machakann/vim-highlightedyank'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'justinmk/vim-sneak'
Plug 'RRethy/vim-hexokinase'
Plug 'ron89/thesaurus_query.vim'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'Konfekt/FastFold'
Plug 'thinca/vim-visualstar'
" Plug 'rgreenblatt/nuake'
Plug 'matze/vim-move'
Plug 'wsdjeg/vim-fetch'
Plug 'machakann/vim-sandwich'
Plug 'terryma/vim-expand-region'
Plug 'sheerun/vim-polyglot'
Plug 'buztard/vim-rel-jump'
"TODO
Plug 'zenbro/mirror.vim'
Plug 'esneider/YUNOcommit.vim'
Plug 'kshenoy/vim-signature'
"}}}
call plug#end()
filetype plugin indent on

" vim: set fdm=marker:
