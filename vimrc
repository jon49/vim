set nocompatible
filetype off      " required!
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set rtp+=~/vimfiles/bundle/Vundle.vim/
let path='~/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle
" required!
" run it with
" :PluginInstall
Bundle 'gmarik/vundle'

" file manager using netrw
Bundle 'rking/ag.vim'
" commenting code
Bundle 'tomtom/tcomment_vim'
Bundle 'bronson/vim-visual-star-search'
Bundle 'tpope/vim-vinegar'
Bundle 'tpope/vim-repeat'
Bundle 'vim-pandoc/vim-pantondoc'
" Bundle 'vim-pandoc/vim-pandoc-syntax'
Bundle 'sukima/xmledit'
" fancy find/replace, change casing for words.
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-surround'
" Bundle 'mrtazz/simplenote.vim'
" Javascript writing
" See http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Bundle 'Lokaltog/vim-distinguished'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'wavded/vim-stylus'
Bundle 'pangloss/vim-javascript'
Bundle 'Raimondi/delimitMate'
" Extra items need to be installed for YouCompleteMe
Bundle 'scrooloose/syntastic'
" Extra items need to be installed for YouCompleteMe
" Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
" Bundle 'vim-scripts/backup.vim'
Bundle 'terryma/vim-multiple-cursors'
" livescript
Bundle 'gkz/vim-ls'
Bundle 'mattn/emmet-vim'
" allows for parallel mult-key shortcuts
Bundle 'kana/vim-arpeggio'
" snippets (powerful)
Bundle 'SirVer/ultisnips'

call vundle#end()
filetype plugin indent on

" Simplenote
" source ~/.simplenoterc

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
" let g:ycm_add_preview_to_completeopt=0
" let g:ycm_confirm_extra_conf=0
" set completeopt-=preview
" let g:ycm_seed_identifiers_with_syntax=1
" let g:ycm_collect_identifiers_from_tags_files=1

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
" Goes with Syntactic bundle
let g:syntastic_check_on_open=1

filetype plugin indent on  " required!

" Color scheme
" set t_Co=256
" TERM=xterm-256color
syntax enable
set background=dark
" set background=light
"let g:solarized_termcolors=256
let g:solarized_contrast="low"
" call togglebg#map("<F5>")
colorscheme solarized

" Adds line (for Javascript) when doing curling brackets ^c to add line.
let mapleader = "\<space>"
imap <C-c> <CR><Esc>O
imap <C-v> <Esc>A {<Esc>li<CR><Esc>O
nnoremap <silent> <leader>b :ls<CR>:b<space>
nnoremap <silent> <leader>w <C-w>w
nnoremap <silent> <leader>W <C-w>W
nnoremap <silent> <leader>f :find<space>
nnoremap <silent> <leader>h :<C-u>nohlsearch<CR><C-l>
nnoremap <silent> <leader>! :w !sudo tee %<CR>
nnoremap <silent> <leader>r :so %<CR>
nmap <S-Down> :.m.+1<CR>
nmap <S-Up> :call feedkeys( line('.')==1 ? '' : 'ddkP' )<CR>
nnoremap j gj
nnoremap k gk
" Shift+Insert for pasting instead of "+p
" nmap <S-Insert> <MiddleMouse>

" Arpeggio commands
" must call arpeggio#load() first
call arpeggio#load()
" execute emmet
Arpeggio imap emt <C-y>,
" append comma
Arpeggio inoremap a, <END>,<Esc>:w<CR>
" append semicolon
Arpeggio inoremap a; <END>;<Esc>:w<CR>
" append brace maps from above.
Arpeggio imap ab <C-v>
" execute ultisnip
Arpeggio imap sn <C-j>
Arpeggio imap je <Esc>A
" create a function
Arpeggio imap fn function<C-j>
" copy in visual mode
Arpeggio xmap yc "+y

" ultisnips commands
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="horizontal"

" Turn row numbers on
set number
" Turn column numbers always on
set ruler

" http://stackoverflow.com/a/21406581/632495
silent! call matchdelete(4)
highlight ColorColumn ctermbg=White guibg=White
call matchadd("ColorColumn",  "\\%81v", 100)

" Change location of swap files - // at end is to create 
" directories of backups
set dir=$TEMP

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

let g:pantondoc_disabled_modules=["folding"]

" LiveScript
au BufWritePost *.ls silent LiveScriptMake! -b | cwindow | redraw!

set autoread
set autowriteall
set nofoldenable    " disable folding
set smartcase
set incsearch
set hlsearch
set suffixesadd=.yaml,.json,.ls,.js,.styl

autocmd VimEnter * set path+=** 
autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en_au
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_au

" Autoreload vimrc
" augroup reload_vimrc
"     autocmd!
"     autocmd BufWritePost $MYVIMRC source $MYVIMRC
" augroup END

" show tabs and trailing spaces
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

" backup files
" if !isdirectory($HOME . "/source/.bak")
"   call mkdir($HOME . "/source/.bak", "p")
" endif
set backupdir=$HOME/source/.bak//
set backup
set writebackup

" let currentTime = substitute(strftime('%FT%T%z'), ':', '', 'g')
let currentTime = strftime('%FT%T%z')
let bkDirectory = substitute(substitute(substitute(expand('%:p:h'), '/', '%', 'g'), '\', '%', 'g'), ':', '', 'g')
let backUpName = "let &backupext='".bkDirectory."-".currentTime."'"
execute backUpName

if has('win32')
  " Avoid mswin.vim making Ctrl-v act as paste
  noremap <C-V> <C-V>
endif

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

if has('gui_running')
  set guifont=Consolas:h11
endif

set nf=octal,hex,alpha
