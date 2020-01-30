
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.vim/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" On-demand loading
"Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'preservim/nerdcommenter'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'easymotion/vim-easymotion'

"Plug 'terryma/vim-multiple-cursors'

"Plug 'junegunn/vim-easy-align'

"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-surround'

" Plug 'MattesGroeger/vim-bookmarks'

" Plug 'Shougo/echodoc.vim'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Plug 'octol/vim-cpp-enhanced-highlight'

" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

"Plug 'vim-syntastic/syntastic'
"Plug 'dense-analysis/ale'

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

"Plug 'rust-lang/rust.vim'

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

