call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/peaksea'
Plug 'morhetz/gruvbox'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'

Plug 'jceb/vim-orgmode'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/deol.nvim'

Plug 'kshenoy/vim-signature'
Plug 'https://github.com/inkarkat/vim-mark.git'
Plug 'https://github.com/inkarkat/vim-ingo-library.git'

Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/asyncrun.vim'

Plug 'dense-analysis/ale'

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --rust-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

" Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

if has("win16") || has("win32")
    Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
else
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

call plug#end()

