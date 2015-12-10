set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set autoread                          " auto read when file is changed from outside
set wrap
set linebreak
set nolist
set hidden
set linespace=0
set cursorline
set nofoldenable
set number
set numberwidth=4
set title
set showmode
set nobomb                            " no BOM(Byte Order Mark)
set nostartofline
set laststatus=2
set key=			                        " disable encryption
set synmaxcol=2048
set viminfo=			                    " disable .viminfo file

set mouse=a

syntax enable                         " syntax highlight
set hlsearch                          " search highlighting
set incsearch                         " incremental search
set t_Co=256
set background=dark
colorscheme Tomorrow-Night
"let g:solarized_termcolors=256
"colorscheme solarized

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" file encoding
set encoding=utf-8
set fileencodings=utf-8
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

filetype on                           " enable filetype detection
filetype plugin indent on

set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shortmess=I                       " remove splash wording

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" cursorline switched while focus is switched to another split window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
