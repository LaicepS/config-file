" General Settings
" ----------------------------------------------------- {{{
filetype on       " enable file type detection
syntax on         " syntax highlighting
filetype plugin on
filetype indent on

colorscheme default

" }}}

"  SETs
" ----------------------------------------------------- {{{
set background=light
set smartindent   " smart code indentation
set smarttab      " smart tabs
set nocp " needed for ctags
set backspace=2 " define backspace behaviour
set tabstop=8   " set softtabstop instead
set showmode
set showcmd
set ruler " display cursor line
set smartcase
set textwidth=120
set shiftwidth=4
set nu " line number
set hlsearch " highlight search
set incsearch " search as typing
set cursorline " highlight current line
" always show the status line
set laststatus=2
" statusline format
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
" "              | | | | |  |   |      |  |     |    |
" "              | | | | |  |   |      |  |     |    + current
" "              | | | | |  |   |      |  |     |       column
" "              | | | | |  |   |      |  |     +-- current line
" "              | | | | |  |   |      |  +-- current % into file
" "              | | | | |  |   |      +-- current syntax in
" "              | | | | |  |   |          square brackets
" "              | | | | |  |   +-- current fileformat
" "              | | | | |  +-- number of lines
" "              | | | | +-- preview flag in square brackets
" "              | | | +-- help flag in square brackets
" "              | | +-- readonly flag in square brackets
" "              | +-- rodified flag in square brackets
" "              +-- full path to file in the buffer
"
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/stl
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
set t_Co=256

set completeopt=menu,menuone,longest
set pumheight=15

" }}}

let mapleader=","
let $PAGER=''

"  MAPs
" ----------------------------------------------------- {{{

" clear the search buffer
nnoremap <C-l> :let @/=""<CR>
" good man page stuff
runtime ftplugin/man.vim
nnoremap <silent> K :exe "Man" expand('<cword>') <CR>

 " build tags of your own project with CTRL+F12
 map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
 noremap <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>
 inoremap <F12> <Esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

 " toggle NerdTree
nmap <F3> :NERDTreeToggle<CR>
imap <F3> <Esc>:NERDTreeToggle<CR>a

" save current buffer
nnoremap <C-s> :write <CR>
inoremap <C-s> <Esc>:write<Cr>


" toggle Taglist
nnoremap <silent> <F4> :TlistToggle<CR>
" add recursively every c++ file in the curren taglist
nnoremap <silent> <C-F4> :TlistAddFilesRecursive . *.h <CR> :TlistAddFilesRecursive . *.cpp <CR>
"
" TAB and Shift-TAB in normal mode cycle tabs
"
noremap <Tab> :tabnext<CR>
noremap <S-Tab> :tabprevious<CR>

nnoremap <Leader>ev :vsplit $MYVIMRC<Cr>
nnoremap <Leader>sv :source $MYVIMRC<Cr>

" remapping H and L to go to the begin/end of the line. previous map are useless
nnoremap H ^
nnoremap L $

" going into normal mode without esc
inoremap jk <Esc>
"
" Disable cursors
"
noremap <down> <nop>
map <left> <nop>
map <right> <nop>
map <up> <nop>

imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap <up> <nop>


" 
" Map Shit+Space to escape insert mode
" 
imap <S-Space> <Esc>
" }}}

"  AUTOCOMMANDs (au)
" ----------------------------------------------------- {{{
" when the vim window is resized resize the vsplit panes as well
augroup general
	autocmd!
	autocmd VimResized * exe "normal! \<c-w>="
augroup END

" changing fold method for vim files
" vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" }}}

"  PLUGINs stuff
" ----------------------------------------------------- {{{

execute pathogen#infect()
execute pathogen#helptags()

let g:SuperTabDefaultCompletionType = "context"

let g:NERDTreeDirArrows=0
let g:NERDTreeIgnore=['\.o$']


let g:syntastic_cpp_checkers=['gcc']
let g:syntastic_cpp_check_header=1
let g:syntastic_cpp_include_dirs=[ '.']
let g:syntastic_cpp_auto_refresh_includes=1

let g:clang_snippets=1
let g:clang_snippets_engine='snipmate'
let g:clang_user_options='|| exit 0'
let g:clang_complete_copen=1
let g:clang_complete_auto=0

let g:Tlist_Use_Right_Window=1
let g:Tlist_Display_Prototype=1
let g:Tlist_WinWidth = 60
" }}}
