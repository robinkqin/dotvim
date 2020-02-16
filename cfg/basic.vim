"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> buffers
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

source $VIMRUNTIME/defaults.vim     " Get the defaults that most users want.

set nocompatible

set backspace=indent,eol,start      " Allow backspacing over everything in insert mode.

set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " display completion matches in a status line

set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key

set display=truncate    " Show @@@ in the last line if it is truncated.

set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
    set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it confusing.
set nrformats-=octal

filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread
autocmd FocusGained,BufEnter * checktime

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Ignore compiled files
set wildignore=*.o,*.d,*~,*.pyc,tags,GPATH,GTAGS,GRTAGS
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,.vs\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set hidden          " A buffer becomes hidden when it is abandoned

set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch

set lazyredraw      " Don't redraw while executing macros (good performance config)

set magic           " For regular expressions turn magic on

set showmatch
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

set timeoutlen=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

set fileformats=unix,dos,mac    " Use Unix as the standard file type

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 200 characters
set linebreak
set textwidth=200

set autoindent      "Auto indent
set smartindent     "Smart indent
set wrap            "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

