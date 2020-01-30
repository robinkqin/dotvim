"depends:
"gtags, ctags, ag, fzf
"clang
"clang-format, autopep8,
"js-beautify, css-beautify, html-beautify,
"gofmt, fixjson, shfmt
"pip install pygments
"pip3 install pygments

"a: append
"b: words backward
"c: {motion} delete text and insert
"d: {motion} delete
"e: forward
"f: {char} find char
"g: g
"h: left
"i: insert
"j: down
"k: up
"l: right
"m: mark, bookmark
"n: repeat /
"o: begin a new line
"p: put text
"q: record
"r: {char} replace
"s: easymotion s{char}{char}
"t: {char} till
"u: undo
"v: visual
"w: word forward
"x: delete
"y: {motion} yank
"z: fold
"[: [
"]: ]
";: repeat f/t/F/T
"': jump to mark
",: repeat f/t/F/T in opposite direction
".: repeat last change
"/: search
"\:


"CTRL-a: add number
"CTRL-b: scroll pages backwards
"CTRL-c: interrupt current (search) command
"CTRL-d: scroll
"CTRL-e: scroll
"CTRL-f: scroll
"CTRL-g: prints the current file name
"CTRL-h: left window
"CTRL-i: go to newer pos
"CTRL-j: down window
"CTRL-k: up window
"CTRL-l: right window
"CTRL-m: lines downward
"CTRL-n: paste
"CTRL-o: go to older pos
"CTRL-p:
"CTRL-q:
"CTRL-r: redo changes
"CTRL-s:
"CTRL-t: jump to older entry in tag stack
"CTRL-u: scroll up
"CTRL-v: start visual mode blockwise
"CTRL-w: window
"CTRL-x: subtract number
"CTRL-y: scroll
"CTRL-z: suspend vim
"CTRL-[: ESC
"CTRL-]: jump to definition
"CTRL-;:
"CTRL-':
"CTRL-,:
"CTRL-.:
"CTRL-/:
"CTRL-\:


"<leader>a: Ack[aa, af]
"<leader>b: buffer[bd, ba, bn, bp], buffexplore[be, bv, bs]
"<leader>c: quickfix[co, cc, cn, cp], cwd[cd]
"<leader>d: GitGutter[d],
"<leader>e: [ee], easymotion[ef, ew, el]
"<leader>f: leaderf[ff, fb, fd, ft, fl]
"<leader>g: gtags[gs, gg, gd, gc, gt, ge, gf, ga]
"<leader>h:
"<leader>i: indentguides[i]
"<leader>j: ycm[j]
"<leader>k: ctrlsf[kk,kf, kF, kn, kp, ko, ks, kc, kt]
"<leader>l: ALE[ll, ld]
"<leader>m: leaderf[m]
"<leader>n: quickfix[n], NERDTree[nn, nb, nf]
"<leader>o: leaderf[o]
"<leader>p: quickfix[p], [pp]
"<leader>q: quickly open a buffer
"<leader>r: visualreplace[r]
"<leader>s: spell[ss, sn, sp, sa, s?]
"<leader>t: tab[tn, to, tc, tm, tt, tp, tl, te]
"<leader>u:
"<leader>v:
"<leader>w: [ww] [wd] [wc] [wo] [ws] [wv] [wq]
"<leader>x: quickly open a markdown buffer
"<leader>y:
"<leader>z:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:Lf_ShortcutF = '<leader>ff'

noremap <leader>ff :Leaderf file<cr>

noremap <leader>fr :Leaderf mru<cr>
let g:Lf_MruFileExclude = ['*.so']

noremap <leader>fb :Leaderf buffer<cr>
noremap <leader>fd :Leaderf funcion<cr>
noremap <leader>ft :Leaderf tag<cr>
noremap <leader>fl :Leaderf line<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark<Space>
map <leader>nf :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Ale (syntax checker and linter)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ale_linters = {
"            \   'javascript': ['jshint'],
"            \   'python': ['flake8'],
"            \   'c++': ['clang'],
"            \   'c': ['clang'],
"            \   'go': ['go', 'golint', 'errcheck']
"            \}
""始终开启标志列
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0
""自定义error和warning图标
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap sp <Plug>(ale_previous_wrap)
"nmap sn <Plug>(ale_next_wrap)
""<leader>s触发/关闭语法检查
"nmap <leader>ll :ALEToggle<CR>
""<leader>d查看错误或警告的详细信息
"nmap <leader>ld :ALEDetail<CR>
"
""nmap <silent> <leader>a <Plug>(ale_next_wrap)
"
"" Disabling highlighting
"let g:ale_set_highlights = 0
"
"" Only run linting when saving the file
"let g:ale_lint_on_text_changed = 'never'
"let g:ale_lint_on_enter = 0
"
"let g:ale_linters_explicit = 1
"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 500
"let g:ale_echo_msg_format = '[%linter%] %code: %%s'
""let g:ale_lint_on_text_changed = 'normal'
""let g:ale_lint_on_insert_leave = 1
"let g:airline#extensions#ale#enabled = 1
"
"let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
"let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
"let g:ale_c_cppcheck_options = ''
"let g:ale_cpp_cppcheck_options = ''
"
""let g:ale_sign_error = "\ue009\ue009"
"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Git gutter (Git diff)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:gitgutter_enabled=0
"nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>fc{char} to move to {char}
map  <leader>ef <Plug>(easymotion-bd-f)
nmap <leader>ef <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap ss <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>el <Plug>(easymotion-bd-jk)
nmap <leader>el <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>ew <Plug>(easymotion-bd-w)
nmap <leader>ew <Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>YCM
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 设置跳转到方法/函数定义的快捷键
"nnoremap <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
"" 触发补全快捷键
"let g:ycm_key_list_select_completion = ['<TAB>', '<c-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<S-TAB>', '<c-p>', '<Up>']
"let g:ycm_auto_trigger = 1
"" 最小自动触发补全的字符大小设置为 3
"let g:ycm_min_num_of_chars_for_completion = 2
"" YCM的previw窗口比较恼人，还是关闭比较好
"set completeopt-=preview
"
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_server_log_level = 'info'
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
"set completeopt=menu,menuone
"
"noremap <c-z> <NOP>
"
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
"
"let g:ycm_global_ycm_extra_conf = '~/.vim_runtime/my_plugins/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>indent-guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
"" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
"" 色块宽度
"let g:indent_guides_guide_size=1
"" 快捷键 i 开/关缩进可视化
":nmap <silent> <leader>i <Plug>IndentGuidesToggle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>gutentags
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"" request: pip install pygments
"let $GTAGSLABEL = 'native-pygments'
"let $GTAGSCONF = '/usr/local/share/gtags/gtags.conf'
"
"" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
"let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
"
"" 所生成的数据文件的名称
"let g:gutentags_ctags_tagfile = 'tags'
"
"" 同时开启 ctags 和 gtags 支持：
"let g:gutentags_modules = []
"if executable('ctags')
"    let g:gutentags_modules += ['ctags']
"endif
"if executable('gtags-cscope') && executable('gtags')
"    let g:gutentags_modules += ['gtags_cscope']
"endif
"
"" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
"let g:gutentags_cache_dir = expand('~/.cache/tags')
"
"" 配置 ctags 的参数
"let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
"let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
"let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"
"" 如果使用 universal ctags 需要增加下面一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
"
"" for debug
"let g:gutentags_define_advanced_commands = 1
"
"" 禁用 gutentags 自动加载 gtags 数据库的行为
""let g:gutentags_auto_add_gtags_cscope = 0
"
"let g:gutentags_plus_nomap = 1
"noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
"noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
"noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
"noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
"noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
"noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bookmarks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap mm <Plug>BookmarkToggle
nmap mn <Plug>BookmarkNext
nmap mp <Plug>BookmarkPrev
nmap mf <Plug>BookmarkShowAll
nmap md <Plug>BookmarkClear
nmap me <Plug>BookmarkClearAll
nmap mg <Plug>BookmarkMoveToLine
"nmap ma <Plug>BookmarkAnnotate

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '♥'
"let g:bookmark_highlight_lines = 1

let g:bookmark_no_default_key_mappings = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mark.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <unique> mt <Plug>MarkToggle
nmap <unique> ms <Plug>MarkSet
xmap <unique> ms <Plug>MarkSet
nmap <unique> mr <Plug>MarkRegex
xmap <unique> mr <Plug>MarkRegex
nmap <unique> mc <Plug>MarkClear
nmap <unique> mx <Plug>MarkAllClear

let g:mwDefaultHighlightingPalette = 'maximum'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""let g:python3_host_prog=/path/to/python/executable/
""let g:formatterpath = ['/some/path/to/a/folder', '/home/superman/formatters']
noremap <F3> :Autoformat<CR>
au BufWrite * :Autoformat

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

"""""""""""""""""""""""""""""""
"" => snipMate (beside <TAB> support <CTRL-j>)
"""""""""""""""""""""""""""""""
"ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
"snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => echodoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => ctrlsf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap <leader>kk :CtrlSF<Space><C-R><C-W><cr>
"nmap     <leader>kf <Plug>CtrlSFPrompt
"vmap     <leader>kf <Plug>CtrlSFVwordExec
"vmap     <leader>kv <Plug>CtrlSFVwordPath
"nmap     <leader>kn <Plug>CtrlSFCwordPath
"nmap     <leader>kp <Plug>CtrlSFPwordPath
"nnoremap <leader>ko :CtrlSFOpen<CR>
"nnoremap <leader>kc :CtrlSFClose<CR>
"nnoremap <leader>ks :CtrlSFStop<CR>
"nnoremap <leader>kt :CtrlSFToggle<CR>
"inoremap <leader>kt <Esc>:CtrlSFToggle<CR>
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
"let g:ctrlsf_extra_root_markers = ['.root', '.svn', '.git', '.hg', '.project']
"
""let g:ctrlsf_default_view_mode = 'compact'
"let g:ctrlsf_regex_pattern = 0
"
"let g:ctrlsf_search_mode = 'async'
"
"let g:ctrlsf_position = 'bottom'
"let g:ctrlsf_winsize = '40%'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"<leader>f在Vim打开的历史文件中搜索，相当于是在MRU中搜索，:History：命令历史查找
"nnoremap <silent> <leader>f :History<CR>

"<leader>h在当前目录搜索文件
"nnoremap <silent> <leader>h :Files<CR>

"<leader>b切换Buffer中的文件
"nnoremap <silent> <leader>o :Buffers<CR>

"<leader>q在当前所有加载的Buffer中搜索包含目标词的所有行，:BLines只在当前Buffer中搜索
"nnoremap <silent> <leader>q :Lines<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

