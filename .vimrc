" Vundle stuff
" ----------------------------------------------------- {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'yggdroot/indentline'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}


" YCM
Plugin 'mileszs/ack.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}

" General Settings
" ----------------------------------------------------- {{{
filetype on       " enable file type detection
syntax on         " syntax highlighting
filetype plugin on
filetype indent on

if has("gui_running")
  colorscheme  desert
endif

" }}}

"  SETs
" ----------------------------------------------------- {{{
set background=dark
set smartindent   " smart code indentation
set smarttab      " smart tabs
set nocp " needed for ctags
set backspace=2 " define backspace behaviour
set tabstop=8   " set softtabstop instead
set showmode
set showcmd
set ruler
set smartcase
set textwidth=120
set shiftwidth=4
set nonu " line number
set hlsearch " highlight search
set incsearch " search as typing
set cursorline " highlight current line
set cursorcolumn " highlight current col
" hi CursorLine guibg=darkred guifg=white " make the cursor line more visisble on dark background
" always show the status line
set laststatus=2
" statusline format
set guifont=Monospace\ 10
set statusline=%f%m%r%h%w%y[%l,%v]%=%{getcwd()}
"
" configure tags - add additional tags here or comment out not-used ones
"set tags+=~/.vim/tags/stl
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/sdl
"set tags+=~/.vim/tags/qt4
set t_Co=256
set mouse=a

" Don't assume first-match when completing file names.
set wildmode=longest,list

set completeopt=menu,menuone,longest
set pumheight=15
set guioptions-=m
set guioptions-=T

" move backup to .vim/tmp
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

set autoread

" open vertical splits on the right
set splitright

set nowrap

" disable annoying bell sound in gvim
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" cursor color
highlight Cursor guifg=white guibg=LightRed

" make the warning when search wraps much more obvious
highlight WarningMsg ctermfg=white ctermbg=red guifg=White guibg=Red gui=None

" more readable selection
highlight Visual ctermbg=grey

" trailing white spaces
if (&filetype != 'text')
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
endif

" set the completion menu to  readable colrors on a dark background
" highlight Pmenu guibg=brown gui=bold

" }}}

let mapleader=","
let $PAGER=''

"  MAPs
" ----------------------------------------------------- {{{

" clear the search buffer
nnoremap <C-k> :let @/=""<CR>
" good man page stuff
runtime ftplugin/man.vim
nnoremap <silent> K :exe "Man" expand('<cword>') <CR>

 " build tags of your own project with CTRL+F12
autocmd FileType d nnoremap <F12> :!ctags -R . /usr/lib/gcc/x86_64-linux-gnu/7/include/d <CR>
autocmd FileType c,cpp nnoremap <F12> :!ctags -R . <CR>
autocmd FileType cpp nnoremap <F12> :!ctags -R . -R --fields=+iaS --extra=+q <CR>
autocmd FileType python nnoremap <F12> :!ctags -R . <CR>
" autocmd FileType py nnoremap <F12> :!ctags -R . -R --fields=+iaS --extra=+q <CR>
" save current buffer
nnoremap <C-s> :write <CR>
inoremap <C-s> <Esc>:write<Cr>

" quick vimrc editing
nnoremap <Leader>ev :vsplit $MYVIMRC<Cr>
nnoremap <Leader>sv :source $MYVIMRC<Cr>

" paste in insert mode
inoremap <Leader>p <Esc>pa

inoremap <Leader>A <Esc>A
inoremap <Leader>I <Esc>I

" get current function nearest (upwise) caller
nnoremap <Leader>c [[kt(#

" remapping H and L to go to the begin/end of the line. previous map are useless
nnoremap H ^
nnoremap L $

" going into normal mode without esc
inoremap jk <Esc>

nnoremap <Space> zz

nnoremap <C-tab> :tabnext<CR>
nnoremap <C-S-tab> :tabprevious<CR>

nnoremap <F4> :Ack! -w <C-r><C-w><CR>
vnoremap <F4> y :Ack! -w <C-r>"<CR>

" this tells ack not to jump to the first occurence of a search by default
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" in vimdiff, go to next diff and obtain it
nnoremap <Leader>f ]cdo

cnoremap <C-A>		<Home>
cnoremap <C-B>		<Left>
cnoremap <C-D>		<Del>
cnoremap <C-E>		<End>
cnoremap <C-F>		<Right>
cnoremap <C-N>		<Down>
cnoremap <C-P>		<Up>
cnoremap <M-b>	 	<S-Left>
" forward one word
cnoremap <M-f>		<S-Right>
" delete one forward word
cnoremap <M-d>		<S-Right><C-w>
"remove everything from the cursor to the end of line
cnoremap <C-k> <C-\>esplit(getcmdline(), " ")[0]<CR><Space>

" search for visually selected text
vnoremap // y/<C-R>"<CR>

"[count]G       Also open fold under cursor when supplying [count] (i.e.
"               jumping to a particular line, not the end of the
"               buffer). Use [count]|gg| if you don't want this.
nnoremap <expr> G (v:count ? 'Gzv' : 'G')

nnoremap <leader>cs :let @*=expand("%")<CR>
nnoremap <leader>cl :let @*=expand("%:p")<CR>
" nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>v :vsplit \| YcmCompleter GoTo<CR>
nnoremap <leader>s :split \| YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <F5> :!git dt <C-R>% <CR>
nnoremap <F6> :make -j8 -C release/ <CR>

nmap <C-]> g<C-]>

" }}}

"  AUTOCOMMANDs (au)
" ----------------------------------------------------- {{{
" when the vim window is resized resize the vsplit panes as well
augroup general
	autocmd!
	autocmd VimResized * exe "normal! \<c-w>="
augroup END

function! Formatonsave()
  let l:formatdiff = 1
  py3f /usr/share/clang/clang-format-7/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

" changing fold method for vim files
" vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd BufNewFile,BufRead *.rex setf d
    autocmd BufNewFile,BufRead *.mpp setf cpp
    autocmd BufNewFile,BufRead *.di setf d
augroup END
" }}}
"

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/plugin/

" Ctrlp

let g:ctrlp_root_markers = ['.ctrlp|.git|.bzr|.svn']
let g:ctrlp_max_files=20000
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]oprofile_data|\.(git|hg|svn|bzr)|cov|bin|routemm/lib/|routemm/share|release',
    \ 'file': '\v\.(pdf|exe|so|dll|o|deps|fdeps|pyc)$|\.ctrlp|tags|prof|\.\~.\~',
    \ }

let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

autocmd! FileType qf nnoremap <buffer> <C-V> <C-w><Enter><C-w>H


" YCM
" let g:ycm_confirm_extra_conf = 1
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" work-around to copy selected text to system clipboard
" " and prevent it from clearing clipboard when using ctrl+z (depends on xsel)
function! CopyText()
  normal gv"+y
  :call system('xsel -ib', getreg('+'))
endfunction

vmap <leader>y :call CopyText()<CR>
