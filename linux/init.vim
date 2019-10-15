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

" Use autocmd to force lightline update upon Coc diagnostics.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" ## Syntax, Formatting, Keybindings:

" Address the delay on escape waiting for 1 second before entering Normal mode
set timeout
set timeoutlen=1000
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
call coc#add_extension('coc-css', 'coc-eslint', 'coc-gitignore', 'coc-highlight', 'coc-html', 'coc-json', 'coc-lists', 'coc-python', 'coc-solargraph', 'coc-snippets', 'coc-tsserver', 'coc-sql')

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Jump to definition
inoremap <silent><expr> <F2> CocCurrentFunction('jumpDefinition')

" Bind Ctrl + e to NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>
inoremap <C-n> <C-\><C-O>:NERDTreeToggle<CR>

" Include .erb support for vim-surround
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-%')} = "<% \r %>"

" Work in progress
" inoremap <F8><Plug>(coc-diagnostic-next)
" inoremap <S-F8> <Plug>(coc-diagnostic-prev) <-- this won't work.. shift
" doesn't go on escape chars in terminals?
" inoremap <F2> <Plug>(coc-rename)
" inoremap <Plug>(coc-format)
