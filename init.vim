" ~/AppData/Local/nvim/init.vim      ~~~/.config/nvim/init.vim~~
call plug#begin('~/AppData/Local/nvim/plugged')

" Easily align code
Plug 'junegunn/vim-easy-align'

" Theme
Plug 'mhartington/oceanic-next'

" Just push tab!
" Plug 'ervandew/supertab'

" https://github.com/neoclide/coc.nvim
" Intellisense using extensions from VS Code
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme OceanicNext

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

"**************** COC Intellisense ****************"
"
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
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

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
nmap <leader>rn <Plug>(coc-rename)

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
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

