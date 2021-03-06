call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat' | Plug 'tpope/vim-surround'

Plug 'jiangmiao/auto-pairs'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'mhinz/vim-signify'

"Plug 'Shougo/echodoc.vim'

"Plug 'skywind3000/asyncrun.vim'

Plug 'preservim/nerdcommenter'

Plug 'junegunn/vim-easy-align'

Plug 'kshenoy/vim-signature'

Plug 'https://github.com/inkarkat/vim-mark.git'
Plug 'https://github.com/inkarkat/vim-ingo-library.git'

Plug 'tpope/vim-fugitive'

Plug 'Chiel92/vim-autoformat'

"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'

Plug 'rust-lang/rust.vim'

Plug 'skywind3000/vim-auto-popmenu'

"Plug 'dense-analysis/ale'

"Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer --rust-completer' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

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

