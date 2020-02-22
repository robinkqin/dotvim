"depends: gtags ctags fzf rg python/pygments clang/clang-format rust go

" f: {char} find char [a d i k q x y z]
" ===>>> write file f[w]
" ===>>> leaderf f[f r b / e/E t/T l v c j hc/s/f/h m u s g o n p]
" g:
" m: mark
" ===>>> mark m[m r x]
" ===>>> signature m[. , [a-z] '[a-z] ]' '] / dm[a-z] - <Space>]
" q:
" quickfix q[o q n p]
" s: delete char and start insert [b m n o p q r u v x y z]
" ===>>> gtags s[s g d c t e f i a]
" ===>>> easymotion s[h j k l w]
" t: {char} till [g j k q r s u v w x y z]
" ===>>>tab t[n o c m t l e h]
" ===>>>toggle t[a b d f i p]
" ;: repeat f/t/F/T
" [a d i j n o p q u x y z]
" ===>>> fzf ;[f r b / e t/T l/L v c m hc/hs k w s gf/gs/gc/gC]
" ,: repeat f/t/F/T in opposite direction
" \:

"g:UltiSnipsExpandTrigger="<c-j>"
"surround[cs ds]

"<leader>a:
"<leader>b: buffer b[d a n p]
"<leader>c: cwd[cd], commenter c[c n <Space> m i s y $ A a l b u]
"<leader>d:
"<leader>e: vimcfg[ev], quickbufer[eq], quickorg[eo], ale e[e t l i p n a z]
"<leader>f:
"<leader>g: fugitive g[s d l c w r m b u p]
"<leader>h:
"<leader>i: c-i
"<leader>j: c-f
"<leader>k: c-b
"<leader>l: YCM[l]
"<leader>m:
"<leader>n:
"<leader>o: c-o
"<leader>p:
"<leader>q: quit[qa]
"<leader>r: vreplace[r]
"<leader>s: spell[ss sn sp sa s?], deol shell[sh]
"<leader>t:
"<leader>u:
"<leader>v: c-v
"<leader>w: cwd[wd], window[ww wc wo ws wv wh wl wj wk]
"<leader>x:
"<leader>y:
"<leader>z:
"<leader>]:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

noremap <c-z> <NOP>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

nnoremap fw :w!<cr>
" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" cope
map qo :botright copen<cr>
map qq :botright cclose<cr>
map qn :cn<cr>
map qp :cp<cr>

" Useful mappings for managing tabs
map tn :tabnew<cr>
map to :tabonly<cr>
map tc :tabclose<cr>
map tm :tabmove<Space>
map th :tabprevious<cr>
map tt :tabnext<Space>
map te :tabedit <C-r>=expand("%:p:h")<cr>/
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

map <leader>j <C-F>
map <leader>k <C-B>

map <leader>o <C-O>
map <leader>i <C-I>

map <leader>v <C-V>

map <leader>] <C-]>

nnoremap <leader>qa :qa<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>wd :pwd<cr>

map <leader>ev :e! ~/.vim/cfg/extended.vim<cr>

" Quickly open a buffer for scribble
map <leader>eq :e ~/buffer<cr>

" Quickly open a todo.org
map <leader>eo :e ~/todo.org<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Spell checking
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" window
nnoremap <leader>ww <c-w><c-w>
nnoremap <leader>wc <c-w>c
nnoremap <leader>ws <c-w>s
nnoremap <leader>wv <c-w>v
nnoremap <leader>wo <c-w>o
nnoremap <leader>wq <c-w>q
nnoremap <leader>wh <c-w>h
nnoremap <leader>wl <c-w>l
nnoremap <leader>wk <c-w>k
nnoremap <leader>wj <c-w>j

" When you press <leader>rr you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Toggle paste mode on and off
map tp :setlocal paste!<cr>

" Remove the Windows ^M - when the encodings gets messed up
"noremap <leader>rm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Bash like keys for the command line
cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>
cnoremap <C-K>      <C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => font, gui, Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=JetBrains\ Mono:h14,IBM\ Plex\ Mono:h14,Hack:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=JetBrains\ Mono:h14,IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=JetBrains\ Mono:h14,IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=JetBrains\ Mono:h14,IBM\ Plex\ Mono\ 14,:Hack\ 14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=JetBrains\ Mono:h14,Monospace\ 11
endif

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
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
colorscheme gruvbox

syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 35
let g:nerdtree_tabs_open_on_console_startup = 1
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map td :NERDTreeToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
nmap <silent> ti <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=yes
set updatetime=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deol / shell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sh :Deol -cwd=%:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap ta <Plug>(EasyAlign)
xmap ta <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gu :Gpush<cr>
nnoremap <leader>gp :Gpull<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => echodoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap tb :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <unique> mt <Plug>MarkToggle
nmap <unique> mm <Plug>MarkSet
xmap <unique> mm <Plug>MarkSet
nmap <unique> mr <Plug>MarkRegex
xmap <unique> mr <Plug>MarkRegex
"nmap <unique> mn <Plug>MarkClear
nmap <unique> mx <Plug>MarkAllClear

let g:mwDefaultHighlightingPalette = 'maximum'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:python3_host_prog=/path/to/python/executable/
"let g:formatterpath = ['/some/path/to/a/folder', '/home/superman/formatters']
noremap tf :Autoformat<CR>
"autocmd BufWrite * :Autoformat

"disable vim's indent file, retabbing and removing trailing whitespace
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0

"autocmd FileType vim,tex let b:autoformat_autoindent=0

"let g:formatdef_my_cpp = '"astyle --style=google"'
"let g:formatters_cpp = ['my_cpp']

"let g:autoformat_verbosemode=1

"manually autoindent, retab or remove trailing whitespace
"gg=G
":retab
":RemoveTrailingSpaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => ctrlsf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" [a b d e g h i j l m q r u w x y z]
""" ===>>> ctrlsf ,[s f v n p o k c t]
"nnoremap ,s :CtrlSF<Space><C-R><C-W><cr>
"nmap     ,f <Plug>CtrlSFPrompt
"vmap     ,f <Plug>CtrlSFVwordExec
"vmap     ,v <Plug>CtrlSFVwordPath
"nmap     ,n <Plug>CtrlSFCwordPath
"nmap     ,p <Plug>CtrlSFPwordPath
"nnoremap ,o :CtrlSFOpen<CR>
"nnoremap ,c :CtrlSFClose<CR>
"nnoremap ,k :CtrlSFStop<CR>
"nnoremap ,t :CtrlSFToggle<CR>
"inoremap ,t <Esc>:CtrlSFToggle<CR>
"
""let g:ctrlsf_ackprg = 'ag'
"
"let g:ctrlsf_context = '-B 3 -A 3'
"
"let g:ctrlsf_ignore_dir = ['.root', '.svn', '.git', '.hg', '.project']
"
"let g:ctrlsf_auto_close = {
"            \ "normal" : 0,
"            \ "compact": 0
"            \}
"
"let g:ctrlsf_auto_focus = {
"            \ "at": "done",
"            \ "duration_less_than": 1000
"            \ }
"
"let g:ctrlsf_case_sensitive = 'smart'
"
""let g:ctrlsf_default_root = 'project+ff'
"let g:ctrlsf_extra_root_markers = ['.git', '.hg', '.svn', '.project', '.root']
"
""let g:ctrlsf_default_view_mode = 'compact'
"let g:ctrlsf_regex_pattern = 0
"
"let g:ctrlsf_search_mode = 'async'
"
"let g:ctrlsf_position = 'bottom'
"let g:ctrlsf_winsize = '40%'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gutentags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"request: pip install pygments, gtags, ctags, cscope
"let $GTAGSLABEL='native'
"let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'

" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" gutentags 自动加载 gtags 数据库
let g:gutentags_auto_add_gtags_cscope = 1

" keymap     desc
"<leader>cs  Find symbol (reference) under cursor
"<leader>cg  Find symbol definition under cursor
"<leader>cd  Functions called by this function
"<leader>cc  Functions calling this function
"<leader>ct  Find text string under cursor
"<leader>ce  Find egrep pattern under cursor
"<leader>cf  Find file name under cursor
"<leader>ci  Find files #including the file name under cursor
"<leader>ca  Find places where current symbol is assigned

nnoremap ss :cs find s <C-R>=expand("<cword>")<CR><CR>:botright copen<cr>
"nnoremap sg :cs find g <C-R>=expand("<cword>")<CR><CR>:botright copen<cr>
nnoremap sg :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap sd :cs find d <C-R>=expand("<cword>")<CR><CR>:botright copen<cr>
nnoremap sc :cs find c <C-R>=expand("<cword>")<CR><CR>:botright copen<cr>
nnoremap st :cs find t <C-R>=expand("<cword>")<CR><CR>:botright copen<cr>
nnoremap se :cs find e <C-R>=expand("<cword>")<CR><CR>:botright copen<cr>
nnoremap sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:botright copen<cr>
nnoremap sa :cs find a <C-R>=expand("<cword>")<CR><CR>:botright copen<cr>

" for debug
"let g:gutentags_define_advanced_commands = 1
":GutentagsToggleTrace
":GutentagsUpdate
":messages
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => cscope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("cscope")
    set cscopequickfix=s-,g-,d-,c-,t-,e-,i-,a-
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Only run linters named in ale_linters settings.
"let g:ale_linters_explicit = 1

let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
"let g:ale_lint_on_enter = 0

nmap <leader>ee :ALEEnable<CR>:ALELint<CR>
nmap <leader>et :ALEToggle<CR>
nmap <leader>el :ALEDetail<CR>
nmap <leader>ei :ALEInfo<CR>
nmap <leader>ep :ALEPreviousWrap<CR>
nmap <leader>en :ALENextWrap<CR>
nmap <leader>ea :ALEFirst<CR>
nmap <leader>ez :ALELast<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview

"let g:ycm_semantic_triggers =  {
"            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"            \ 'cs,lua,javascript': ['re!\w{2}'],
"            \ }
"
"let g:ycm_filetype_whitelist = {
"            \ "c":1,
"            \ "cpp":1,
"            \ "objc":1,
"            \ "sh":1,
"            \ "zsh":1,
"            \ "zimbu":1,
"            \ }

"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_confirm_extra_conf = 0

nnoremap <leader>l :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> ;f :FzfFiles<CR>
nnoremap <silent> ;r :FzfHistory<CR>
nnoremap <silent> ;b :FzfBuffers<CR>

nnoremap <silent> ;/ :FzfRg<CR>
nnoremap <silent> ;e :FzfRg <C-R>=expand("<cword>")<CR><CR>

nnoremap <silent> ;t :FzfBTags<CR>
nnoremap <silent> ;T :FzfTags<CR>
nnoremap <silent> ;l :FzfBLines<CR>
nnoremap <silent> ;L :FzfLines<CR>

nnoremap <silent> ;v :FzfColors<CR>
nnoremap <silent> ;c :FzfCommand<CR>

nnoremap <silent> ;m :FzfMarks<CR>

nnoremap <silent> ;hc :FzfHistory:<CR>
nnoremap <silent> ;hs :FzfHistory/<CR>

nnoremap <silent> ;k :FzfMap<CR>
nnoremap <silent> ;w :FzfWindows<CR>
nnoremap <silent> ;s :FzfSnippets<CR>

nnoremap <silent> ;gf :FzfGFiles<CR>
nnoremap <silent> ;gs :FzfGFiles?<CR>
nnoremap <silent> ;gc :FzfBCommits<CR>
nnoremap <silent> ;gC :FzfCommits<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.project', '.root']

let g:Lf_ReverseOrder = 1

"let g:Lf_PreviewInPopup = 1
"let g:Lf_WindowPosition = 'popup'

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg', '.vs'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.d','*.so','*.py[co]']
            \}

let g:Lf_MruFileExclude = ['*.so']

" let g:Lf_Ctags = "/usr/local/universal-ctags/ctags"
" let g:Lf_CtagsFuncOpts = {
"            \ 'c': '--c-kinds=fp',
"            \ 'rust': '--rust-kinds=f',
"            \ }

" let g:Lf_RgConfig = [
"     \ "--max-columns=150",
"     \ "--type-add web:*.{html,css,js}*",
"     \ "--glob=!git/*",
"     \ "--hidden"
" \ ]

" let g:Lf_ShortcutF = "<leader>ff"
" let g:Lf_ShortcutB = "<leader>bb"

noremap ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap fr :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

noremap f/ :Leaderf rg -e<Space>
noremap fe :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>
noremap fE :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>

noremap ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap fT :<C-U><C-R>=printf("Leaderf tag %s", "")<CR><CR>
noremap fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap fv :Leaderf colorscheme<cr>
noremap fc :Leaderf command<cr>

noremap fm :Leaderf marks<cr>

noremap fhc :Leaderf cmdHistory<cr>
noremap fhs :Leaderf searchHistory<cr>
noremap fhf :Leaderf self<cr>
noremap fhh :Leaderf help<cr>

noremap fj :Leaderf function<cr>

" should use `Leaderf gtags --update` first
" --gtagslibpath
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap fu :<C-U><C-R>=printf("Leaderf gtags --update %s", "")<CR><CR>
noremap fs :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap fg :<C-U><C-R>=printf("Leaderf gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap fo :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR><CR>
noremap fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map ; <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1

" move to {char}
map  sh <Plug>(easymotion-bd-f)
nmap sh <Plug>(easymotion-overwin-f)

" move to {cahr}{char}
map  sj <Plug>(easymotion-bd-f2)
nmap sj <Plug>(easymotion-overwin-f2)

" Move to line
map  sk <Plug>(easymotion-bd-jk)
nmap sk <Plug>(easymotion-overwin-line)

map  sl <Plug>(easymotion-lineanywhere)

" Move to word
map  sw <Plug>(easymotion-bd-w)
nmap sw <Plug>(easymotion-overwin-w)

