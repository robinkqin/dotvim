" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
" Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'

Plug 'dyng/ctrlsf.vim'

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

Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'terryma/vim-multiple-cursors'

Plug 'mhinz/vim-signify'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'

Plug 'jiangmiao/auto-pairs'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

Plug 'majutsushi/tagbar'

Plug 'kshenoy/vim-signature'

Plug 'https://github.com/inkarkat/vim-mark.git'
Plug 'https://github.com/inkarkat/vim-ingo-library.git'

" checker format gtags/cscope complete shell

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'Chiel92/vim-autoformat'

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/a.vim'

Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

Plug 'skywind3000/asyncrun.vim'

Plug 'dense-analysis/ale'

Plug 'Shougo/echodoc.vim'
Plug 'Shougo/deol.nvim'

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --rust-completer' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'jceb/vim-orgmode'

Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system

call plug#end()
