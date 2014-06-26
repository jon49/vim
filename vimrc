set nocompatible 		" be iMproved
filetype off			" required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-vinegar'
Bundle 'vim-pandoc/vim-pantondoc'
Bundle 'vim-pandoc/vim-pandoc-syntax'
Bundle 'sukima/xmledit'
Bundle 'tpope/vim-surround'
" :PluginInstall
" Bundle 'mrtazz/simplenote.vim'
" Javascript writing
" See http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Bundle 'Lokaltog/vim-distinguished'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Raimondi/delimitMate'
" Extra items need to be installed for YouCompleteMe
Bundle 'scrooloose/syntastic'
" Extra items need to be installed for YouCompleteMe
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
" Bundle 'vim-scripts/backup.vim'
Bundle 'terryma/vim-multiple-cursors'

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

" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
" Goes with Syntactic bundle
let g:syntastic_check_on_open=1

filetype plugin indent on	" required!

" Color scheme
set t_Co=256
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" Adds line (for Javascript) when doing curling brackets ^c to add line.
imap <C-c> <CR><Esc>O
imap <C-v> <Esc>A{<Esc>li<CR><Esc>O

" Turn numbers on
set number

" Change location of swap files
set dir=D:\\soft\\installed\\Vim\\swap//,.,c:\\tmp,c:\\temp

" size of a hard tabstop
set tabstop=3

" size of an "indent"
set shiftwidth=3

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=3

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab

let g:pantondoc_disabled_modules=["folding"]
