call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/peaksea'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
Plug 'sgur/vim-textobj-parameter'

"Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

Plug 'tpope/vim-obsession'

Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode'

Plug 'Shougo/echodoc.vim'
Plug 'Shougo/deol.nvim'

Plug 'skywind3000/asyncrun.vim'

Plug 'kshenoy/vim-signature'
Plug 'https://github.com/inkarkat/vim-mark.git'
Plug 'https://github.com/inkarkat/vim-ingo-library.git'

Plug 'preservim/nerdcommenter'

Plug 'Chiel92/vim-autoformat'
Plug 'jiangmiao/auto-pairs'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'ludovicchabant/vim-gutentags'

Plug 'dense-analysis/ale'

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --rust-completer --go-completer' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

"Plug 'dyng/ctrlsf.vim'

Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

if has("win16") || has("win32")
    Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
else
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif
Plug 'Yggdroot/LeaderF-marks'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

call plug#end()

