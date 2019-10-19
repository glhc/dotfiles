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
" Include .erb support for vim-surround
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-%')} = "<% \r %>"

" ## Keybindings ##

" Bind Ctrl + e to NERDTree toggle
nnoremap <C-n> <Cmd>NERDTreeToggle<CR>
inoremap <C-n> <Cmd>NERDTreeToggle<CR>


"" ############## BEGIN COC VIM EXAMPLE CONFIG ###################

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <S-F2> <Plug>(coc-diagnostic-prev)
nmap <silent> <F2> <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


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
" inoremap jk
" inoremap kj
"
" Ideas:
" Ctrl + Shift + M - Go to CocList Diagnostics
" (Optional): Ctrl + Tab and Ctrl + Shift + Tab for switching buffers