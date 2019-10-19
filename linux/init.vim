" # Vim Configuration File

:scriptencoding utf-8
set encoding=UTF-8

let g:solarized_termcolors=16


" ## Automatic Installation of vim-plug

set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=8

" ## Plugins

" ### vim-plug

" Download and install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins with vim-plug
call plug#begin('~/.vim/plugged')

  Plug 'altercation/vim-colors-solarized'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'metakirby5/codi.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'pangloss/vim-javascript'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dadbod'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'yggdroot/indentline'
  Plug 'neoclide/coc-tsserver'
  Plug 'neoclide/coc-solargraph'
  Plug 'neoclide/coc-eslint'
  Plug 'neoclide/coc-lists'
  Plug 'neoclide/coc-snippets'
  Plug 'neoclide/coc-html'
  Plug 'neoclide/coc-css'
  Plug 'neoclide/coc-highlight'
  Plug 'neoclide/coc-sql'
  Plug 'neoclide/coc-json'
  Plug 'neoclide/coc-git'
  Plug 'neoclide/coc-python'
  Plug 'neoclide/coc-tabnine'
  Plug 'neoclide/coc-yaml'
  Plug 'neoclide/coc-jest'
call plug#end()

" ## IndentLine

" Override default hiding of quotes in JSON, etc.
" let g:indentLine_setConceal = 0

" Override conceal colour set to grey.
" let g:indentLine_setColors = 0

" Change indent character to a better one.
" Left one eigth block is not supported by consolas, stored here for future
" use: '▏'
" Use left half block for now.
" let g:indentLine_char = '▌'
let g:indentLine_char = '▏'

" ## Color

syntax enable
set background=dark
colorscheme solarized

" ## Statusline

" Add Coc to statusline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

" Use autocmd to force lightline update upon Coc diagnostics.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" ## Syntax, Formatting, Keybindings:

" Address the delay on escape waiting for 1 second before entering Normal mode
set timeout
set timeoutlen=800
set ttimeoutlen=0

" Set margin at 80 characters
set colorcolumn=80

" Set line-number column
set number

" Set line-numbering relative to current line
set relativenumber

" Make diagnostic gutter consistent with theme color instead of default grey.
highlight clear SignColumn

" ### vim-javascript
let g:javascript_plugin_jsdoc = 1

" ## Coc.nvim

" Install Coc.nvim extensions

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ### Keybindings

" Map <tab> for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() :
  \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Include .erb support for vim-surround
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-%')} = "<% \r %>"

" ## Keybindings ##

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')


" Bind Ctrl + e to NERDTree toggle
nnoremap <C-n> <Cmd>NERDTreeToggle<CR>
inoremap <C-n> <Cmd>NERDTreeToggle<CR>

" Jump to definition
inoremap <silent><expr> <F12> CocCurrentFunction('jumpDefinition')
" Use <C-O> to return to code position after jumping to definition




"" ############## BEGIN COC VIM EXAMPLE CONFIG ###################




"" ############## END COC VIM EXAMPLE CONFIG ###################



" Work in progress
" Bind F8/Shift + F8 to browsing diagnostic messages
" inoremap <F8><Plug>(coc-diagnostic-next)
" inoremap <S-F8> <Plug>(coc-diagnostic-prev)
"
"
" Bind F2 to Rename Symbol
" inoremap <F2> <Plug>(coc-rename)
"
" Bind format document to Ctrl + Alt + f
" inoremap <Plug>(coc-format)
" (Optional): Create binding for formatting selection
"
" Bind jk and kj to entering normal mode
:inoremap jk <Esc>
" inoremap kj
"
" Ideas:
" Ctrl + Shift + M - Go to CocList Diagnostics
" (Optional): Ctrl + Tab and Ctrl + Shift + Tab for switching buffers
