" # Vim Configuration File

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
