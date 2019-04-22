set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')
"plugins for a headed install {{{
if !exists("g:headless")
  Plug 'Carpetsmoker/xdg_open.vim'
  Plug 'rgreenblatt/i3-vim-focus'
  Plug 'szw/vim-g'
endif
"}}}

"languages {{{
" Plug 'dansomething/vim-eclim'
if !exists("g:disable_coc")
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  Plug 'liuchengxu/vista.vim'
  Plug 'Shougo/neco-vim'
  Plug 'neoclide/coc-neco'
  Plug 'honza/vim-snippets'
endif
Plug 'arakashic/chromatica.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-apathy'
Plug 'rgreenblatt/c-conceal'
Plug 'kana/vim-textobj-function'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'ehamberg/vim-cute-python'
Plug 'sheerun/vim-polyglot'
Plug 'LucHermitte/VimFold4C'
Plug 'tmhedberg/SimpylFold'
Plug 'metakirby5/codi.vim'
"}}}

"appearance {{{
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
" Plug 'TaDaa/vimade'
Plug 'machakann/vim-highlightedyank'
Plug 'ryanoasis/vim-devicons'
Plug 'RRethy/vim-hexokinase'
"}}}

"general editing {{{
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'unblevable/quick-scope'
Plug 'justinmk/vim-sneak'
Plug 'rgreenblatt/sneak-quick-scope'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-CountJump'
Plug 'inkarkat/vim-EnhancedJumps'
Plug 'markonm/traces.vim'
Plug 'rgreenblatt/vim-ninja-feet'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-repeat'
Plug 'tommcdo/vim-lion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'inkarkat/vim-mark'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire'
Plug 'buztard/vim-rel-jump'
Plug 'chaoren/vim-wordmotion'
Plug 'bfredl/nvim-miniyank'
Plug 'chrisbra/NrrwRgn'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kshenoy/vim-signature'
Plug 'simnalamburt/vim-mundo'
Plug 'romainl/vim-cool'
Plug 'Konfekt/FastFold'
Plug 'machakann/vim-sandwich'
Plug 'terryma/vim-expand-region'
Plug 'matze/vim-move'
Plug 'wsdjeg/vim-fetch'
Plug 'thinca/vim-visualstar'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
"}}}

"navigation/setup {{{
Plug 'mhinz/vim-startify'
Plug 'rgreenblatt/vim-wintabs'
" Plug 'vim-scripts/restore_view.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'rgreenblatt/fzf.vim'
Plug 'wesQ3/vim-windowswap'
Plug 'justinmk/vim-dirvish'
Plug 'kristijanhusak/vim-dirvish-git'
Plug 'rgreenblatt/scratch.vim'
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'
Plug 'airblade/vim-rooter'
Plug 'romainl/vim-qf'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'skywind3000/asyncrun.vim'
"}}}

"integrations {{{
Plug 'itchyny/calendar.vim'
Plug 'makerj/vim-pdf'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'esneider/YUNOcommit.vim'
Plug 'tpope/vim-eunuch'
Plug 'ron89/thesaurus_query.vim'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
Plug 'neomutt/neomutt.vim'
Plug 'mhinz/vim-signify'
Plug 'lambdalisue/suda.vim'
Plug 'vhdirk/vim-cmake'
"}}}

"misc {{{
Plug 'wikitopian/hardmode'
Plug 'rgreenblatt/vim-unimpaired'

"TODO
Plug 'zenbro/mirror.vim'
"}}}
call plug#end()
filetype plugin indent on

" vim: set fdm=marker:
