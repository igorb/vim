set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundlendles here:
Bundle 'vim-scripts/L9'
Bundle 'vim-scripts/comments.vim'
Bundle 'vim-scripts/grep.vim'
Bundle 'vim-scripts/Tabular'
Bundle 'vim-scripts/FuzzyFinder'

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/snipmate-snippets'

Bundle 'wincent/Command-T'
Bundle 'Townk/vim-autoclose'
Bundle 'edsono/vim-matchit'
"Bundle 'ecomba/vim-ruby-refactoring'

filetype plugin indent on     " required!


colorscheme desert
hi Comment guifg=Grey
set expandtab ts=2 sw=2 ai
set number
set guifont=Menlo:h14
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
:map tp :tabprevious<cr>
:imap tn :tabnext<cr>
:map tl :Tablisttoggle<cr>
:map tc :tabclose<cr>
:map tt :tabnew<cr>
set hlsearch
set incsearch
:map <C-l> :%s/\s\+$//<cr>
set list
set listchars=trail:.
autocmd BufWritePre *.* :%s/\s\+$//e
:set nocindent
set nohidden
nnoremap <esc> :noh<return><esc>


" nerdtree plugin
 :map <F2> :NERDTreeToggle ~/work/Beanstock-Marketplace<cr>
 :map ntf :NERDTreeFind<cr>

" CommandT plugin settings
 set wildignore+=*.sql,*.log,*.git,*.apk,*.png,*.pdf,*.svg
 :map <C-f> :CommandT<cr>
 let g:CommandTCursorRightMap=['<C-r>']
 let g:CommandTAcceptSelectionTabMap=['<C-l>']
 let g:CommandTMatchWindowAtTop=1
 map <F9> :CommandTFlush<cr>

" FuzzyFinder
 let g:fuzzy_ignore = "*.png;*.jpeg;*.jpg;*.gif;*.log;public/**/*;log/**/*;coverage/**/*;tmp/**/*;.git/**/*;.sass-cache/**/*;"

" Rgrep
 let s:os = system("uname")
 if s:os =~ "Darwin"
    let g:Grep_Xargs_Options='-0'
 endif
 :map <S-f> :Rgrep<cr>
 let g:ackprg="ack-grep -H --nocolor --nogroup --column"
 :let Grep_Default_Filelist = '*.*'
 :let Grep_Skip_Files = '*.log *.css *.js *.sql *.git *.apk *.png *.pdf *.svg'
 set nocompatible

:vnoremap <tab> :Tabulariz /

" Rails.vim plugin settings
" reload all snippets
 :map <F7> :call ReloadAllSnippets()<cr>
 :map gv :Rview<cr>
 :map gc :Rcontroller<cr>
 :map gm :Rmodel<cr>

" to start vim maximized
function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
au GUIEnter * call Maximize_Window()