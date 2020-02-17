set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'fatih/vim-go'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Open NERDTree when opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" NERDTree preferences
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <silent> <C-n> :NERDTreeToggle<CR>

" Smoothscroll settings
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 20, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 20, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 32, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 32, 4)<CR>

" Highlight search results
set hlsearch

" Split keymappings and orientation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

"""""""" OSX ONLY
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
 let s:uname = system("uname")
 if s:uname == "Darwin\n"
 set guifont=Inconsolata\ for\ Powerline:h15
 endif
endif

"""""" END OSX

"" SET UNICODE
set encoding=utf-8

" UTF8 encoding
set encoding=utf-8

" Enable access to system clipboard
set clipboard=unnamed

" Enable line numbering
set number relativenumber

" Python syntax highlighting
let python_highlight_all=1
syntax on

" Highlight extra whitespace
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" tab settings for shell 
au BufNewFile,BufRead *.sh
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix

" tab settings for python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix

" tab settings for other filetypes
au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.json, *.go
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix


" highlight characters after column 80
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%>80v.\+/

set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
