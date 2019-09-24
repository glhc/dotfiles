" # Vim Configuration File

" ## Automatic Installation of vim-plug
set expandtab=on

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" ## vim-plug
" ### Install plugins with vim-plug
" call plug#begin('~/.vim/plugged')
	itchyny/lightline.vim
" call plug#end()

" Colorscheme is installed as a plugin and so it's available only after plug#end
set termguicolors
syntax enable
set background=dark
colorscheme solarized
