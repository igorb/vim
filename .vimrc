call pathogen#runtime_append_all_bundles()
filetype off
syntax on
filetype plugin indent on
colorscheme desert
hi Comment guifg=Grey
set expandtab ts=2 sw=2 ai
set number
set guifont=Menlo:h14
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
:map tp :tabprevious<cr>:map tn :tabnext<cr>:map tl :Tablisttoggle<cr>:map tc :tabclose<cr>:map tt :tabnew<cr>
set hlsearch
set incsearch

" to start vim MAXIMIZED
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

" :::::==- Plugins -==:::::
" pathogen
" nerdtree
" autoclose
" command-t
" comments
" grep
" snipmate
" vim-rails

" nerdtree plugin
:map <F2> :NERDTreeToggle ~/work/Beanstock-Marketplace<cr>
:map ntf :NERDTreeFind<cr>

" CommandT plugin settings
set wildignore+=*.sql,*.log,*.git,*.apk,*.png,*.pdf
:map <C-f> :CommandT<cr>
let g:CommandTCursorRightMap=['<C-r>']
let g:CommandTAcceptSelectionTabMap=['<C-l>']
let g:CommandTMatchWindowAtTop=1
map <F9> :CommandTFlush<cr>

" Rgrep
let s:os = system("uname") 
if s:os =~ "Darwin" 
    let g:Grep_Xargs_Options='-0' 
endif
:map <S-f> :Rgrep<cr>
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
:let Grep_Default_Filelist = '*.*' 
:let Grep_Skip_Files = '*.log all.css all.js all.sql all.git all.apk all.png all.pdf all.svg' 
set nocompatible

" Rails.vim plugin settings
" reload all snippets
 :map <F7> :call ReloadAllSnippets()<cr>
 :map gv :Rview<cr>
 :map gc :Rcontroller<cr>
 :map gm :Rmodel<cr>