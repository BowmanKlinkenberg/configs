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
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Highlight search results
set hlsearch

" UTF8 encoding
set encoding=utf-8

" Enable access to system clipboard
set clipboard=unnamed

" Enable line numbering
set nu

" Python syntax highlighting
let python_highlight_all=1
syntax on

" Color schemes
if has('gui_running')
	  set background=dark
	    colorscheme solarized
    else
	      colorscheme zenburn
      endif

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
au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
    \ set expandtab | 
    \ set autoindent |
    \ set fileformat=unix


" highlight characters after column 80
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/
