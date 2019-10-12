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
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
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

" ## Syntax, Formatting, Keybindings:

" Address the delay on escape waiting for 1 second before entering Normal mode
set timeout timeoutlen=0 ttimeoutlen=0

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

set colorcolumn=80
set number
set relativenumber

" ### vim-javascript
"
let g:javascript_plugin_jsdoc = 1

" ## Coc.nvim

" Install Coc.nvim extensions
call coc#add_extension('coc-css', 'coc-eslint', 'coc-gitignore', 'coc-highlight', 'coc-html', 'coc-json', 'coc-lists', 'coc-python', 'coc-solargraph', 'coc-snippets', 'coc-tsserver')


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

" Make <CR> auto-select the first completion item and notify coc.nvim to format on enter
"	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"enable Shift + TAB to cycle backwards"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <F2> CocCurrentFunction('jumpDefinition')
