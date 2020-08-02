call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp'] }
Plug 'sgur/vim-textobj-parameter'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'

Plug 'Shougo/echodoc.vim'

Plug 'skywind3000/asyncrun.vim'

Plug 'preservim/nerdcommenter'

Plug 'junegunn/vim-easy-align'

Plug 'kshenoy/vim-signature'

Plug 'https://github.com/inkarkat/vim-mark.git'
Plug 'https://github.com/inkarkat/vim-ingo-library.git'

Plug 'Chiel92/vim-autoformat'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'rust-lang/rust.vim'

"Plug 'dense-analysis/ale'

"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --rust-completer' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

if has("win32")
    Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
else
    Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif
Plug 'Yggdroot/LeaderF-marks'

Plug 'easymotion/vim-easymotion'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

call plug#end()

