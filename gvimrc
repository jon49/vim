" c:\Users\jon\_gvimrc
set nocompatible
filetype on      " required!
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" set diffexpr=MyDiff()
" function MyDiff()
"   let opt = '-a --binary '
"   if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"   if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"   let arg1 = v:fname_in
"   if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"   let arg2 = v:fname_new
"   if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"   let arg3 = v:fname_out
"   if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"   let eq = ''
"   if $VIMRUNTIME =~ ' '
"     if &sh =~ '\<cmd'
"       let cmd = '""' . $VIMRUNTIME . '\diff"'
"       let eq = '"'
"     else
"       let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"     endif
"   else
"     let cmd = $VIMRUNTIME . '\diff'
"   endif
"   silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
" endfunction

call plug#begin('~/vimfiles/plugged')

" " TypeScript plugins
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
" Plug 'Shougo/unite.vim', {'for': 'typescript'}
" Plug 'Shougo/vimproc.vim', {'for': 'typescript'} | Plug 'Quramy/tsuquyomi', {'for': 'typescript'}

" keep windows as before
Plug 'tpope/vim-obsession'

" file manager using netrw
Plug 'tpope/vim-vinegar'

Plug 'rking/ag.vim'

" commenting code
Plug 'tomtom/tcomment_vim'

Plug 'bronson/vim-visual-star-search'
Plug 'tpope/vim-repeat'
Plug 'sukima/xmledit'
" fancy find/replace, change casing for words.
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-distinguished'
Plug 'altercation/vim-colors-solarized'
Plug 'jelera/vim-javascript-syntax'
Plug 'wavded/vim-stylus'
Plug 'pangloss/vim-javascript'
Plug 'Raimondi/delimitMate'

" snippets (powerful)
" Plug 'SirVer/ultisnips'

call plug#end()

filetype plugin indent on  " required!

let g:projectDir = get(g:, 'projectDir', expand('%:p:h'))

" TyepScript ~~~~~~~~~~~~~~~~~~~
" function! CompileTypeScriptFile()
"     let filename=expand('%:p')
"     silent execute "!cd " . g:projectDir . " && cd ../js && npm run typescript -- " . filename
" endfunction
" set ballooneval
" augroup typeScriptGroup
"     autocmd!
"     autocmd FileType typescript setlocal completeopt+=menu,preview balloonexpr=tsuquyomi#balloonexpr()
"     autocmd FileType typescript inoremap <buffer> .. .<C-x><C-o>
"     autocmd BufWritePost */ts/*.ts :call CompileTypeScriptFile()
" augroup END

" let g:tsuquyomi_disable_quickfix = 1

augroup npmYaml
    autocmd!
    autocmd BufWritePost */scripts.yml silent execute "!cd ./js && node ./tasks/scriptsPackage"
augroup END

set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "right scrollbar
set guioptions-=L  "left scrollbar

" Color scheme
" set t_Co=256
" TERM=xterm-256color
syntax enable
set background=dark
"let g:solarized_termcolors=256
let g:solarized_contrast="low"
" call togglebg#map("<F5>")
colorscheme solarized

" Adds line (for Javascript) when doing curling brackets ^c to add line.
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
nnoremap <up> <C-w>-
nnoremap <down> <C-w>+
nnoremap <left> <C-w>>
nnoremap <right> <C-w><
nnoremap <Leader>= <C-w>=
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

" Turn row numbers on
set number
" Turn column numbers always on
set ruler

function! Tabs()
  if (&filetype ==? 'yaml') || (&filetype ==? 'yml')
    setlocal tabstop=2 shiftwidth=2 softtabstop=2
  else
    setlocal tabstop=4 shiftwidth=4 softtabstop=4
  endif
endfunction
autocmd! BufReadPost,BufNewFile * call Tabs()

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

set noswapfile
set autoread
set autowriteall
set nofoldenable    " disable folding
set smartcase
set incsearch
set hlsearch
set suffixesadd=.ts,.yaml,.yml,.json,.js,.styl

" autocmd VimEnter * set path+=**
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_au
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_au
autocmd BufEnter * silent! lcd %:p:h
autocmd BufNewFile,BufRead *.config setlocal ft=xml

" Autoreload vimrc
" augroup reload_vimrc
"     autocmd!
"     autocmd BufWritePost $MYVIMRC source $MYVIMRC
" augroup END

" show tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

noremap <C-V> <C-V>


if has('gui_running')
  set guifont=Consolas:h11
endif

set nobackup
set nf=octal,hex,alpha
set encoding=utf-8
set fileencoding=utf-8
set directory=$HOME/vimfiles/swapfiles//
