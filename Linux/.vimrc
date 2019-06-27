" config from https://github.com/dzeban/dotfiles/blob/76467fe2b4a6354937ae40831d57b96fa12dcb34/.vimrc#L281
" neovim is always nocompatible but for Vim set nocompatible
if !has('nvim')
    set nocompatible
endif

autocmd! BufWritePost ~/.vimrc source $MYVIMRC
autocmd! BufWritePost .vimrc source $MYVIMRC " Editing in dotfiles repo

autocmd BufRead,BufNewFile *.conf setfiletype config
autocmd BufRead,BufNewFile *.pp setfiletype ruby
autocmd BufRead,BufNewFile alert.rules setfiletype yaml "prometheus alert rules are yaml
autocmd FileType yaml set tabstop=2 shiftwidth=2

" Install plugins with vim-plug
call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
    " Deoplete and its completion sources
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neco-syntax'
    Plug 'ujihisa/neco-look'
    Plug 'Shougo/neoinclude.vim'
    Plug 'Shougo/deoplete-clangx'
    Plug 'zchee/deoplete-go', { 'do': 'make'}
    Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
    Plug 'zchee/deoplete-jedi'
    Plug 'wellle/tmux-complete.vim'
call plug#end()

" Colorscheme is installed as a plugin and so it's available only after plug#end
set termguicolors
syntax enable
set background=dark
colorscheme solarized

" Default text width is 80
set textwidth=80

" Show matching bracket
set showmatch

" searches are case insensitive...
set ignorecase

" ... unless they contain at least one capital letter
set smartcase

" Highlight column after textwidth
" set colorcolumn=+1
" highlight ColorColumn ctermbg=darkgrey

