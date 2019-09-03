" # Vim Configuration File
"
" config from https://github.com/dzeban/dotfiles/blob/76467fe2b4a6354937ae40831d57b96fa12dcb34/.vimrc#L281
" neovim is always nocompatible but for Vim set nocompatible
if !has('nvim')
    set nocompatible
endif


" ## Automatic Installation of vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
	  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ## vim-plug
" ### Install plugins with vim-plug
call plug#begin('~/.vim/plugged')


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

