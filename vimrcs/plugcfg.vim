"depends: gtags ctags fzf rg python/pygments clang/clang-format rust go

" f: {char} find char
" ===>>> leaderf[ff fm fb fe fs fw ft fa fl fj fu fc fhc/s/h fg fr fd fo fn fp]
" g:
" ===>>> easymotion[gf gb gw gl gj]
" m: mark
" ===>>> mark[mm mr mn mc]
" ===>>> signature[m, ]
" s: delete char and start insert
" ===>>> gtags [ss sd sr sc st se sf si sa]
" t: {char} till
" ===>>>
" ;: repeat f/t/F/T
" ===>>> fzf[;f ;h ;o ;c ;l ;L ;t ;T ;a ;r ;m ]
" ,: repeat f/t/F/T in opposite direction
" ===>>> ctrlsf[,s ,f ,v ,n ,p ,o ,k ,c ,t]
" \:

"<leader>a: align[a]
"<leader>b: buffer[bd ba bn bp]
"<leader>c: cwd[cd], commenter[cc cn c<Space> cm ci cs cy c$ cA ca cl cb cu], surround[cs]
"<leader>d: surround[ds]
"<leader>e: plugcfg.vim[ev], ale[ee ed et el ei ef ep en ea ez]
"<leader>f: save file[fs]
"<leader>g: fugitive[gs gd gl gc gw gr gm gb]
"<leader>h:
"<leader>i: IndentGuidesToggle[ii]
"<leader>j:
"<leader>k:
"<leader>l:
"<leader>m:
"<leader>n: NERDTree[nn]
"<leader>o:
"<leader>p: Toggle paste mode on and off: [pp]
"<leader>q: quickfix[qo qc qn qp], quickly buffer[qq]
"<leader>r: visualreplace[rr]
"<leader>s: spell[ss sn sp sa s?], deol shell[sh sd]
"<leader>t: tab[tn to tc tm tt tl te], tagbar[tg]
"<leader>u:
"<leader>v:
"<leader>w: cwd[wd], window[ww wc wo ws wv wh wl wj wk]
"<leader>x: quickly md buffer[xx]
"<leader>y:
"<leader>z:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

noremap <c-z> <NOP>

nnoremap <leader>fs :w!<cr>

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

nnoremap <leader>qa :qa<cr>
nnoremap <leader>qw :wq<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>wd :pwd<cr>

map <leader>ev :e! ~/.vim/vimrcs/plugcfg.vim<cr>
"autocmd! bufwritepost ~/.vim/vimrcs/plugcfg.vim source ~/.vim/vimrcs/plugcfg.vim

map <leader>o <C-O>
map <leader>i <C-I>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" cope
map <leader>qo :botright copen<cr>
map <leader>qc :botright cclose<cr>
map <leader>qn :cn<cr>
map <leader>qp :cp<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<Space>
map <leader>tt :tabnext<Space>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
autocmd TabLeave * let g:lasttab = tabpagenr()

map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

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
vnoremap <silent> <leader>rr :call VrsualSelection('replace', '')<CR>

" Remove the Windows ^M - when the encodings gets messed up
"noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>qq :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>xx :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme gruvbox

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

map <leader>nn :NERDTreeToggle<cr>

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
nmap <silent> <leader>ii <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=yes
set updatetime=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deol / shell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sd :Deol<cr>
nnoremap <leader>sh :Deol -cwd=%:p:h<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>a <Plug>(EasyAlign)
xmap <leader>a <Plug>(EasyAlign)

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
autocmd FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => echodoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>tg :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <unique> mt <Plug>MarkToggle
nmap <unique> mm <Plug>MarkSet
xmap <unique> mm <Plug>MarkSet
nmap <unique> mr <Plug>MarkRegex
xmap <unique> mr <Plug>MarkRegex
nmap <unique> mn <Plug>MarkClear
nmap <unique> mc <Plug>MarkAllClear

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
""let g:python3_host_prog=/path/to/python/executable/
""let g:formatterpath = ['/some/path/to/a/folder', '/home/superman/formatters']
noremap <F3> :Autoformat<CR>
if has("unix")
    autocmd BufWrite * :Autoformat
endif

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

nnoremap ss :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap sd :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap sr :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap sc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap st :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap se :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap sf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap si :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap sa :cs find a <C-R>=expand("<cword>")<CR><CR>

" for debug
"let g:gutentags_define_advanced_commands = 1
":GutentagsToggleTrace
":GutentagsUpdate
":messages

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
nmap <leader>ed :ALEDisable<CR>
nmap <leader>et :ALEToggle<CR>
nmap <leader>el :ALEDetail<CR>
nmap <leader>ei :ALEInfo<CR>
nmap <leader>ef :ALEFix<CR>
nmap <leader>ep :ALEPreviousWrap<CR>
nmap <leader>en :ALENextWrap<CR>
nmap <leader>ea :ALEFirst<CR>
nmap <leader>ez :ALELast<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> ;gf :FzfGFiles<CR>
nnoremap <silent> ;gc :FzfBCommits<CR>
nnoremap <silent> ;gC :FzfCommits<CR>
nnoremap <silent> ;gs :FzfGFiles?<CR>

nnoremap <silent> ;f :FzfFiles<CR>
nnoremap <silent> ;m :FzfHistory<CR>
nnoremap <silent> ;b :FzfBuffers<CR>

nnoremap <silent> ;e :FzfRg<CR>
nnoremap <silent> ;a :FzfAg<CR>

nnoremap <silent> ;t :FzfBTags<CR>
nnoremap <silent> ;T :FzfTags<CR>
nnoremap <silent> ;l :FzfBLines<CR>
nnoremap <silent> ;L :FzfLines<CR>

nnoremap <silent> ;u :FzfColors<CR>
nnoremap <silent> ;c :FzfCommand<CR>

nnoremap <silent> ;w :FzfWindows<CR>
nnoremap <silent> ;s :FzfSnippets<CR>

nnoremap <silent> ;mm :FzfMarks<CR>
nnoremap <silent> ;mp :FzfMap<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlsf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ,s :CtrlSF<Space><C-R><C-W><cr>
nmap     ,f <Plug>CtrlSFPrompt
vmap     ,f <Plug>CtrlSFVwordExec
vmap     ,v <Plug>CtrlSFVwordPath
nmap     ,n <Plug>CtrlSFCwordPath
nmap     ,p <Plug>CtrlSFPwordPath
nnoremap ,o :CtrlSFOpen<CR>
nnoremap ,c :CtrlSFClose<CR>
nnoremap ,k :CtrlSFStop<CR>
nnoremap ,t :CtrlSFToggle<CR>
inoremap ,t <Esc>:CtrlSFToggle<CR>

"let g:ctrlsf_ackprg = 'ag'

let g:ctrlsf_context = '-B 3 -A 3'

let g:ctrlsf_ignore_dir = ['.root', '.svn', '.git', '.hg', '.project']

let g:ctrlsf_auto_close = {
            \ "normal" : 0,
            \ "compact": 0
            \}

let g:ctrlsf_auto_focus = {
            \ "at": "done",
            \ "duration_less_than": 1000
            \ }

let g:ctrlsf_case_sensitive = 'smart'

"let g:ctrlsf_default_root = 'project+ff'
let g:ctrlsf_extra_root_markers = ['.git', '.hg', '.svn', '.project', '.root']

"let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_regex_pattern = 0

let g:ctrlsf_search_mode = 'async'

let g:ctrlsf_position = 'bottom'
let g:ctrlsf_winsize = '40%'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.project', '.root']

let g:Lf_PreviewInPopup = 1
let g:Lf_WindowPosition = 'popup'

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

"a i k q v x y z

noremap ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

noremap fe :Leaderf rg -e<Space>
noremap fs :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>
noremap fw :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>

noremap ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap fT :<C-U><C-R>=printf("Leaderf tag %s", "")<CR><CR>
noremap fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap fj :Leaderf function<cr>

noremap fu :Leaderf colorscheme<cr>
noremap fc :Leaderf command<cr>

noremap fhc :Leaderf cmdHistory<cr>
noremap fhs :Leaderf searchHistory<cr>
noremap fhf :Leaderf self<cr>
noremap fhh :Leaderf help<cr>

" should use `Leaderf gtags --update` first
" --gtagslibpath
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap fg :<C-U><C-R>=printf("Leaderf gtags --update %s", "")<CR><CR>
noremap fr :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap fd :<C-U><C-R>=printf("Leaderf gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap fo :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR><CR>
noremap fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map ; <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1

" gb, gc, gl, gx, gz

" move to {char}
map  gf <Plug>(easymotion-bd-f)
nmap gf <Plug>(easymotion-overwin-f)

" move to {cahr}{char}
map  gb <Plug>(easymotion-bd-f2)
nmap gb <Plug>(easymotion-overwin-f2)

" Move to word
map  gw <Plug>(easymotion-bd-w)
nmap gw <Plug>(easymotion-overwin-w)

map  gl <Plug>(easymotion-lineanywhere)

" Move to line
map  gj <Plug>(easymotion-bd-jk)
nmap gj <Plug>(easymotion-overwin-line)

