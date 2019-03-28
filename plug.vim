function! InstallDeps(info)
    if a:info.status == 'installed' || a:info.force
        let extensions = ['coc-word'       \
                          'coc-tag'        \
                          'coc-lists'      \
                          'coc-syntax'     \
                          'coc-emoji'      \
                          'coc-dictionary' \
                          'coc-pyls'       \
                          'coc-json'       \
                          'coc-java'       \
                          'coc-vimtex'     \
                          'coc-ccls'       \
                          'coc-yaml'       \
                          'coc-rls'        \
                          'coc-snippets'   \
                          'coc-gocode'     \ 
                          ]
        call coc#util#install()
        call coc#util#install_extension(extensions)
    endif
endfunction

set nocompatible
filetype off
call plug#begin('~/.local/share/nvim/plugged')
if exists("g:headless")
else
    Plug 'neoclide/coc.nvim', {'do': function('InstallDeps')}
    Plug 'mhinz/vim-startify'
    Plug 'itchyny/calendar.vim'
    Plug 'Carpetsmoker/xdg_open.vim'
    Plug 'makerj/vim-pdf'
    Plug 'lervag/vimtex'
    Plug 'rgreenblatt/i3-vim-focus'
    " Plug 'dansomething/vim-eclim'
endif
Plug 'wikitopian/hardmode'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-CountJump'
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-EnhancedJumps'
Plug 'wellle/targets.vim'
Plug 'itchyny/lightline.vim'
" Plug 'rgreenblatt/vim-insert-char'
Plug 'rgreenblatt/scratch.vim'
Plug 'rgreenblatt/vim-ninja-feet'
Plug 'rgreenblatt/c-conceal'
Plug 'rgreenblatt/vim-unimpaired'
Plug 'markonm/traces.vim'
Plug 'tommcdo/vim-lion'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-apathy'
Plug 'tpope/vim-git'
Plug 'vim-scripts/restore_view.vim'
Plug 'unblevable/quick-scope'
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'TaDaa/vimade'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rhysd/clever-f.vim'
Plug 'chaoren/vim-wordmotion'
Plug 'wesQ3/vim-windowswap'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-fold'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-textobj-entire'
Plug 'bfredl/nvim-miniyank'
Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
Plug 'ehamberg/vim-cute-python'
Plug 'metakirby5/codi.vim'
Plug 'mhinz/vim-signify'
Plug 'chrisbra/NrrwRgn'
Plug 'kien/rainbow_parentheses.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'derekwyatt/vim-scala'
Plug 'neomutt/neomutt.vim'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'sakhnik/nvim-gdb'
Plug 'lambdalisue/suda.vim'
Plug 'LucHermitte/VimFold4C'
Plug 'LucHermitte/lh-vim-lib'
Plug 'tmhedberg/SimpylFold'
Plug 'justinmk/vim-dirvish'
Plug 'honza/vim-snippets'
Plug 'ryanoasis/vim-devicons'
Plug 'romainl/vim-cool'
Plug 'morhetz/gruvbox'
Plug 'junegunn/vim-peekaboo'
Plug 'machakann/vim-highlightedyank'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'szw/vim-g'
Plug 'justinmk/vim-sneak'
Plug 'RRethy/vim-hexokinase'
Plug 'ron89/thesaurus_query.vim'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'
Plug 'Konfekt/FastFold'
Plug 'thinca/vim-visualstar' 
" Plug 'liuchengxu/vista.vim'
call plug#end()
filetype plugin indent on
