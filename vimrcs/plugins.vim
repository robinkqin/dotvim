" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

if has("win16") || has("win32")
    Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
else
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/peaksea'
Plug 'morhetz/gruvbox'

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'preservim/nerdcommenter'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

Plug 'terryma/vim-multiple-cursors'

Plug 'mhinz/vim-signify'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

" Plug 'majutsushi/tagbar'

" Plug 'MattesGroeger/vim-bookmarks'

" Plug 'https://github.com/inkarkat/vim-mark.git'
" Plug 'https://github.com/inkarkat/vim-ingo-library.git'

" complete checker format gtags/cscope shell

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'Chiel92/vim-autoformat'

Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'
" Plug 'skywind3000/asyncrun.vim'

Plug 'dense-analysis/ale'

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'Shougo/echodoc.vim'
" Plug 'Shougo/deoplete.nvim'

Plug 'rust-lang/rust.vim'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system

call plug#end()
