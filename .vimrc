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
"Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/xml.vim'

Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/snipmate-snippets'

" Bundle 'wincent/Command-T'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Townk/vim-autoclose'

Bundle 'slim-template/vim-slim'
"Bundle 'digitaltoad/vim-jade'

Bundle 'kchmck/vim-coffee-script'
"Bundle 'ecomba/vim-ruby-refactoring'

filetype plugin indent on     " required!


colorscheme desert
hi Comment guifg=Grey
set expandtab ts=2 sw=2 ai
set number
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
:map tp :tabprevious<cr>
:map tn :tabnext<cr>
":map tl :Tablisttoggle<cr>
:map tt :tabnew<cr>
:map tc :tabclose<cr>
"
:map te :tabedit<cr>
:map to :tabonly<cr>
:map tf :tabfirst<cr>
:map tl :tablast<cr>
:map tm :tabmove<cr>
set hlsearch
set incsearch
:map <C-l> :%s/\s\+$//<cr>
set list
set listchars=trail:.
autocmd BufWritePre *.* :%s/\s\+$//e
:set nocindent
set nohidden
nnoremap <esc> :noh<return><esc>
nnoremap <C-A> ggVG
au BufNewFile,BufRead *.ahcx set filetype=xml
au BufNewFile,BufRead *.view set filetype=xml
au BufNewFile,BufRead *.erb set filetype=xml

" nerdtree plugin
 :map <F2> :NERDTreeToggle
 :map ntf :NERDTreeFind<cr>


" FuzzyFinder
" https://github.com/ctrlpvim/ctrlp.vim
" https://sourcediving.com/better-fuzzy-finding-in-vim-2f1e8597b3b9
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co - exclude-standard', 'find %s -type f']

" set wildignore+=coverage/**,downloads/**,node_modules/**,tmp/**,*.sql,*.log*,*.git,*.apk,*.png,*.pdf,*.svg,*.csv
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }

let g:ctrlp_user_command = {
      \    'types': {
      \      1: [
      \        '.git',
      \        'cd %s &&
      \         git ls-files . -co --exclude-standard
      \         | awk ''{ print length, $0 }''
      \         | sort -n -s
      \         | cut -d" " -f2-'
      \      ],
      \    },
      \    'fallback': 'find %s -type f'
      \  }


" Rgrep
 let s:os = system("uname")
 if s:os =~ "Darwin"
    let g:Grep_Xargs_Options='-0'
 endif
 :map <S-f> :Rgrep<cr>
 let g:ackprg="ack-grep -H --nocolor --nogroup --column"
 :let Grep_Default_Filelist = '*.*'
 :let Grep_Skip_Dirs = 'public log coverage node_modules downloads tmp .git .sass-cache'
 :let Grep_Skip_Files = '*.log* *.sql *.git *.apk *.png *.jpeg *.jpg *.pdf *.svg *.csv *.swp *.swo'
 set nocompatible

:vnoremap <tab> :Tabulariz /

" Rails.vim plugin settings
" reload all snippets
 :map <F7> :call ReloadAllSnippets()<cr>
 :map gv :Rview<cr>
 :map gc :Rcontroller<cr>
 :map gm :Rmodel<cr>

vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" to start vim maximized
function Maximize_Window()
  silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunction
au GUIEnter * call Maximize_Window()
