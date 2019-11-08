" ~/AppData/Local/nvim/init.vim      ~~~/.config/nvim/init.vim~~
call plug#begin('~/AppData/Local/nvim/plugged')

" Easily align code
Plug 'junegunn/vim-easy-align'

" Just push tab!
" Plug 'ervandew/supertab'

" https://github.com/neoclide/coc.nvim
" Intellisense using extensions from VS Code
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'tpope/vim-vinegar'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-repeat'
" Not needed in NeoVim
" Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'

Plug 'sukima/xmledit'
Plug 'bronson/vim-visual-star-search'

" auto close quotes, ect
Plug 'Raimondi/delimitMate'

Plug 'mattn/emmet-vim', {'for': ['javascript', 'typescript', 'html']}
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake', {
\  'for': ['javascript', 'typescript', 'stylus']
\} " show errors inline

" Plug 'fsharp/vim-fsharp', {
"       \ 'for': 'fsharp',
"             \ 'do':  'make fsautocomplete',
"                   \}
"
"                   " " JavaScript
"                   " " JS syntax, supports ES6
"                   " Plug 'othree/yajs.vim', {
"                   " \   'for': ['javascript']
"                   " \}
"                   " " Tern auto-completion engine for JS (requires node/npm)
"                   " if executable('node')
"                   "   Plug 'marijnh/tern_for_vim', {
"                   " \     'do': 'npm install',
"                   " \     'for': ['javascript', 'coffee']
"                   " \   }
"                   " endif

call plug#end()

" Color scheme
" set termguicolors
" TERM=xterm-256color
syntax enable
" set background=dark
set background=light
" let g:solarized_termcolors=256
" let g:solarized_contrast="low"
" " call togglebg#map("<F5>")
" colorscheme solarized

" " delimit mate
" let delimitMate_expand_cr = 1

" mappings
let mapleader = "\<space>"
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap gt <Plug>(EasyAlign)ip*
nmap gtc <Plug>(EasyAlign)ip<Enter><Enter>*
nmap gtr <Plug>(EasyAlign)ip<Enter>*
imap <C-c> <CR><Esc>O
imap <C-v> <Esc>A {<Esc>li<CR><Esc>O
imap <C-e> <Esc>A
imap <C-;> <Esc>A;<Esc>
nnoremap <C-;> A;<Esc>
" imap xp <C-x><C-p>
" imap xo <C-x><C-o>
nnoremap <silent> <Leader>b :ls<CR>:b<space>
nnoremap <silent> <Leader>w <C-w>w
nnoremap <silent> <Leader>W <C-w>W
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>f :find<space>
nnoremap <silent> <Leader>nh :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <Leader>! :w !sudo tee %<CR>
nnoremap <silent> <Leader>r :so %<CR>
nmap <Down> <C-w>-
nmap <Up> <C-w>+
nmap <Right> <C-w>>
nmap <Left> <C-w><
nmap <S-Down> :.m.+1<CR>
nmap <S-Up> :call feedkeys( line('.')==1 ? '' : 'ddkP')<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>c 0wC
nnoremap j gj
nnoremap k gk

set number " Turn row numbers on
set ruler " Turn column numbers always on

" show tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" Change location of swap files - // at end is to create 
" directories of backups
set dir=$HOME/vimfiles/swapfiles//

" tabs
set expandtab " Insert spaces when TAB is pressed.
set tabstop=4 " size of a hard tabstop
set shiftwidth=4 " Indentation amount for < and > commands.

" set softtabstop=2
set smarttab " make "tab" insert indents instead of tabs at the beginning of a line

set autochdir " change directory for whatever file you are in.
set autoread
set autowriteall
set nofoldenable    " disable folding
set smartcase
set incsearch
set hlsearch
set suffixesadd=.ts,.js,.styl
set textwidth=80
set nowrap

" first time may need to run command
" `:set spell` which will prompt for download.
" set path to current file
autocmd VimEnter * set path+=** 
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_au
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_au
au BufNewFile,BufRead *.md setlocal textwidth=80

" exit terminal
tnoremap <Esc> <C-\><C-n>


