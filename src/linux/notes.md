# Notes

#### Resources:



#### Need to:
- [ ] write script to deploy solarized
- https://github.com/dzeban/dotfiles/blob/76467fe2b4a6354937ae40831d57b96fa12dcb34/.vimrc#L281
^ example

Possible plugins to install:
call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-sensible'
        " Deoplete and its completion sources
	    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	        Plug 'Shougo/neco-syntax'
		    Plug 'ujihisa/neco-look'
		        Plug 'Shougo/neoinclude.vim'
			    Plug 'Shougo/deoplete-clangx'
			        Plug 'zchee/deoplete-go', { 'do': 'make'}
				    Plug 'stamblerre/gocode', { 'rtp': 'vim',
				    'do': '~/.vim/plugged/gocode/vim/symlink.sh'
				    }
				        Plug 'zchee/deoplete-jedi'
					    Plug 'wellle/tmux-complete.vim'
					    call plug#end()
