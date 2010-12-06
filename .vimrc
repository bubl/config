colorscheme desert256

" No Compatibility. That just sucks
" especially annoying on redhat/windows/osx
set nocompatible
set backspace=indent,eol,start

" Menus I like :-)
" This must happen before the syntax system is enabled
aunmenu Help.
aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup

" Better modes.  Remeber where we are, support yankring
set viminfo=!,'100,\"100,:20,<50,s10,h,n~/.viminfo

" Enable Syntax Colors
"  in GUI mode we go with fruity and Monaco 13
"  in CLI mode myterm looks better (fruity is GUI only)
syntax on
if has("gui_running")
  colorscheme fruity
  if has("mac")
    set guifont=Consolas:h13
    set fuoptions=maxvert,maxhorz
    " does not work properly on os x
    " au GUIEnter * set fullscreen
  else
    set guifont=DejaVu\ Sans\ Mono\ 10
  endif
else
  colorscheme myterm
endif

" The PC is fast enough, do syntax highlight syncing from start
autocmd BufEnter * :syntax sync fromstart

" Move Backup Files to ~/.vim/sessions
set backupdir=~/.vim/sessions
set dir=~/.vim/sessions

" Remember cursor position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Enable hidden buffers
set hidden

" enable automatic title setting for terminals
set title
set titleold="Terminal"
set titlestring=%F\ -\ Vim

" Enable filetype plugins and indention
filetype on
filetype plugin on

" sets leader to ',' and localleader to "\"
let mapleader=","
let maplocalleader="\\"

" activate a permanent ruler and disable Toolbar, and add line
" highlightng as well as numbers.
" And disable the sucking pydoc preview window for the omni completion
" also highlight current line and disable the blinking cursor.
set ruler
set guioptions-=T
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
endif
set ttyfast

" customize the wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class
set wildmode=list:full

" change working directory automatically
" disabled for mapleader that makes this explicit
"" set autochdir

" go with smartindent if there is no plugin indent file.
" but don't outdent hashes
set smartindent
inoremap # #

" quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" arrow keys move visible lines
inoremap <Down> <C-R>=pumvisible() ? "\<lt>Down>" : "\<lt>C-O>gj"<CR>
inoremap <Up> <C-R>=pumvisible() ? "\<lt>Up>" : "\<lt>C-O>gk"<CR>
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk

" And be global by default
set gdefault

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" tab for brackets
nnoremap <tab> %
vnoremap <tab> %

" split edit vimrc
nnoremap <leader>ev <C-w><C-s><C-l>:e $MYVIMRC<CR>

" Make the command line two lines high and change the statusline display to
" something that looks useful.
set cmdheight=2
set laststatus=2
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}
set showcmd
set number


" Split management
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>W <C-w>s
nnoremap <leader>s :new<CR>

set hlsearch
set incsearch

" python support
" --------------
"  don't highlight exceptions and builtins. I love to override them in local
"  scopes and it sucks ass if it's highlighted then. And for exceptions I
"  don't really want to have different colors for my own exceptions ;-)
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" php support
" -----------
autocmd FileType php setlocal shiftwidth=8 tabstop=8 softtabstop=8

autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
autocmd BufNewFile,BufRead *.rhtml setlocal ft=eruby
autocmd BufNewFile,BufRead *.mako setlocal ft=mako
autocmd BufNewFile,BufRead *.tmpl setlocal ft=htmljinja
autocmd BufNewFile,BufRead *.py_tmpl setlocal ft=python
autocmd BufNewFile,BufRead *.html,*.htm  call s:SelectHTML()
let html_no_rendering=1

let g:closetag_default_xml=1
autocmd FileType html,htmldjango,htmljinja,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,htmljinja,eruby,mako source ~/.vim/scripts/closetag.vim

" vim
" ---
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2


