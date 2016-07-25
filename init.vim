" ~/.config/nvim/init.vim
call plug#begin('~/.nvim/plugged')

" typescript plugins
" Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
" Plug 'Shougo/unite.vim', {'for': 'typescript'}
" Plug 'Shougo/vimproc.vim', {'do': 'sudo make', 'for': 'typescript'} | Plug 'Quramy/tsuquyomi', {'for': 'typescript'}

Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-easy-align'
Plug 'tomtom/tcomment_vim', {'for': ['javascript', 'typescript', 'stylus', 'vim', 'html']}
Plug 'mattn/emmet-vim', {'for': ['javascript', 'typescript', 'html']}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'altercation/vim-colors-solarized'
Plug 'wavded/vim-stylus', {'for': 'stylus'}
Plug 'Raimondi/delimitMate' " auto close quotes, ect
Plug 'benekastah/neomake', {
\  'for': ['javascript', 'typescript', 'stylus']
\} " show errors inline
Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}

" " JavaScript
" " JS syntax, supports ES6
" Plug 'othree/yajs.vim', {
" \   'for': ['javascript']
" \}
" " Tern auto-completion engine for JS (requires node/npm)
" if executable('node')
"   Plug 'marijnh/tern_for_vim', {
" \     'do': 'npm install',
" \     'for': ['javascript', 'coffee']
" \   }
" endif

call plug#end()

" typescript
" let g:tsuquyomi_tsserver_path = '~/.node/bin/tsserver.js'
" let g:tsuquyomi_use_local_typescript=0

" Color scheme
set t_Co=256
" TERM=xterm-256color
syntax enable
" set background=dark
set background=light
let g:solarized_termcolors=256
let g:solarized_contrast="low"
" call togglebg#map("<F5>")
colorscheme solarized

" delimit mate
let delimitMate_expand_cr = 1

" mappings
let mapleader = "\<space>"
imap <C-c> <CR><Esc>O
imap <C-v> <Esc>A {<Esc>li<CR><Esc>O
imap xp <C-x><C-p>
imap xo <C-x><C-o>
nnoremap <silent> <leader>b :ls<CR>:b<space>
nnoremap <silent> <leader>w <C-w>w
nnoremap <silent> <leader>W <C-w>W
nnoremap <silent> <leader>j <C-w>j
nnoremap <silent> <leader>k <C-w>k
nnoremap <silent> <leader>l <C-w>l
nnoremap <silent> <leader>h <C-w>h
nnoremap <silent> <leader>f :find<space>
nnoremap <silent> <leader>nh :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <leader>! :w !sudo tee %<CR>
nnoremap <silent> <leader>r :so %<CR>
nmap <Down> <C-w>-
nmap <Up> <C-w>+
nmap <Right> <C-w>>
nmap <Left> <C-w><
nmap <S-Down> :.m.+1<CR>
nmap <S-Up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
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
set dir=/var/tmp//

" tabs
set expandtab " Insert spaces when TAB is pressed.
set tabstop=4 " size of a hard tabstop
set shiftwidth=4 " Indentation amount for < and > commands.
" set softtabstop=2 
set smarttab " make "tab" insert indents instead of tabs at the beginning of a line

set autoread
set autowriteall
set nofoldenable    " disable folding
set smartcase
set incsearch
set hlsearch
set suffixesadd=.ts,.js,.styl

" set path to current file
autocmd VimEnter * set path+=** 
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_au
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_au

" exit terminal
tnoremap <Esc> <C-\><C-n>
