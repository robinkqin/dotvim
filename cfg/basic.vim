"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> buffers
"    -> keymap
"    -> Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/defaults.vim     " Get the defaults that most users want.

set nocompatible

set number

set backspace=indent,eol,start      " Allow backspacing over everything in insert mode.

set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " display completion matches in a status line

set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key

set display=truncate    " Show @@@ in the last line if it is truncated.

set scrolloff=4

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
if has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*,.vs\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set hidden          " A buffer becomes hidden when it is abandoned

set whichwrap+=<,>,h,l

set ignorecase
set smartcase
set hlsearch

"set lazyredraw      " Don't redraw while executing macros (good performance config)

set magic           " For regular expressions turn magic on

set showmode

set showmatch
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=

set timeoutlen=500

" Add a bit extra margin to the left
set foldcolumn=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    "colorscheme desert
    colorscheme gruvbox
catch
endtry

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,latin1
set termencoding=utf-8

set fileformats=unix,dos,mac    " Use Unix as the standard file type

" Set font according to system
if has("mac")
    set gfn=JetBrains\ Mono:h14,IBM\ Plex\ Mono:h14,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("win32")
    set gfn=JetBrains\ Mono:h12,IBM\ Plex\ Mono:h12,Bitstream\ Vera\ Sans\ Mono:h11
else
    set gfn=JetBrains\ Mono:h14,IBM\ Plex\ Mono:h14,Bitstream\ Vera\ Sans\ Mono:h11
endif

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=m

if exists('$TMUX')
    if has('nvim')
        set termguicolors
    else
        set term=screen-256color
    endif
endif

set background=dark
syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set noswapfile

try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

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
set nowrap            "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

noremap <c-z> <NOP>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

map <leader>f <C-F>
map <leader>b <C-B>
map <leader>j <C-F>
map <leader>k <C-B>
map <leader>i <C-I>
map <leader>o <C-O>
map <leader>v <C-V>

nnoremap <leader>ww :w!<cr>
" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<Space>
map <leader>tj :tabnext<cr>
map <leader>tk :tabprevious<cr>
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<cr>
autocmd TabLeave * let g:lasttab = tabpagenr()

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>wd :pwd<cr>

" Spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sj ]s
map <leader>sk [s
map <leader>sa zg
map <leader>s? z=

" When you press <leader>rr you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<cr>
vnoremap <silent> <leader>g :call VisualSelection('gv', '')<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<cr>/<C-R>=@/<cr><cr>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<cr>?<C-R>=@/<cr><cr>

" Toggle paste mode on and off
map <leader>tp :setlocal paste!<cr>

" quickfix
map qo :botright copen<cr>
map qq :botright cclose<cr>
map qj :cn<cr>
map qk :cp<cr>
map qc :cc<cr>
map ql :cl<cr>

" window
nnoremap ;; <c-w><c-w>
nnoremap ;c <c-w>c
nnoremap ;s <c-w>s
nnoremap ;v <c-w>v
nnoremap ;a <c-w>o

" Close the current buffer
map ;d :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map ;x :bufdo bd<cr>
map ;j :bnext<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Leaderf rg -e '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

