"depends:
"python, gtags, ctags, fzf, ag
"pip install pygments
"clang, clang-format
"rust

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
"m: mark, bookmarks ===========================================>>>
"n: repeat /
"o: begin a new line
"p: put text
"q: record
"r: {char} replace
"s: easymotion s{char}{char} ===========================================>>>
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


"<leader>a:
"<leader>b: buffer[bd, ba, bn, bp], leaderf[bb]
"<leader>c: quickfix[co, cc, cn, cp], cwd[cd], copy all to a new buffer[ca], NERDCommenter[ca, cu, cb, cl, cy, cs, ci, cn, cm, cc], surround[cs]
"<leader>d: surround[ds]
"<leader>e: [ee], easymotion[ec, ef, ew, el]
"<leader>f: leaderf[ff, fm, fb, fs, fw, ft, fl, fc, fhc, fhs, fhh, fg, fr, fd, fo, fn, fp]
"<leader>g: gtags[gs, gg, gd, gc, gt, ge, gf, gi, ga]
"<leader>h:
"<leader>i:
"<leader>j:
"<leader>k:
"<leader>l: ALE[ll, ld]
"<leader>m:
"<leader>n: NERDTree[nn, nb, nf]
"<leader>o:
"<leader>p: Toggle paste mode on and off: [pp]
"<leader>q: quickly open a buffer
"<leader>r: visualreplace[r]
"<leader>s: spell[ss, sn, sp, sa, s?]
"<leader>t: tab[tn, to, tc, tm, tt, tl, te]
"<leader>u:
"<leader>v:
"<leader>w: [ww] [wd] [wc] [wo] [ws] [wv]
"<leader>x: quickly open a markdown buffer
"<leader>y:
"<leader>z:

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.project', '.root']

if has("mac") || has("macunix")
else
    let g:Lf_PreviewInPopup = 1
    let g:Lf_WindowPosition = 'popup'
endif

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

let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_ShortcutB = "<leader>bb"

noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

noremap <leader>fs :Leaderf rg -e<Space>
noremap <leader>fw :Leaderf rg -w --cword<cr>
noremap <leader>fj :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
noremap <leader>fk :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>

noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

"noremap <leader>fm :LeaderfFunction<cr>

noremap <leader>fc :Leaderf colorscheme<cr>

" e i l q u v x y z
noremap <leader>fhc :Leaderf cmdHistory<cr>
noremap <leader>fhs :Leaderf searchHistory<cr>
noremap <leader>fhh :Leaderf self<cr>

" should use `Leaderf gtags --update` first
" --gtagslibpath
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fg :<C-U><C-R>=printf("Leaderf! gtags --update %s", "")<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"" don't show the help in normal mode
"let g:Lf_HideHelp = 1
"let g:Lf_UseCache = 0
"let g:Lf_UseVersionControlTool = 0
"let g:Lf_IgnoreCurrentBufferName = 1

"let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

"" search visually selected text literally
"xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline/airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <leader>ec{char} to move to {char}
map  <leader>ec <Plug>(easymotion-bd-f)
nmap <leader>ec <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <leader>ef <Plug>(easymotion-overwin-f2)

" Move to line
map <leader>el <Plug>(easymotion-bd-jk)
nmap <leader>el <Plug>(easymotion-overwin-line)

" Move to word
map  <leader>ew <Plug>(easymotion-bd-w)
nmap <leader>ew <Plug>(easymotion-overwin-w)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" => fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => echodoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To use echodoc, you must increase 'cmdheight' value.
set cmdheight=2
let g:echodoc_enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" =>tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <F8> :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => bookmarks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap mm <Plug>BookmarkToggle
"nmap mn <Plug>BookmarkNext
"nmap mp <Plug>BookmarkPrev
"nmap mf <Plug>BookmarkShowAll
"nmap md <Plug>BookmarkClear
"nmap me <Plug>BookmarkClearAll
"nmap mg <Plug>BookmarkMoveToLine
""nmap ma <Plug>BookmarkAnnotate
"
"highlight BookmarkSign ctermbg=NONE ctermfg=160
"highlight BookmarkLine ctermbg=194 ctermfg=NONE
"let g:bookmark_sign = '♥'
""let g:bookmark_highlight_lines = 1
"
"let g:bookmark_no_default_key_mappings = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => mark.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap <unique> mt <Plug>MarkToggle
"nmap <unique> ms <Plug>MarkSet
"xmap <unique> ms <Plug>MarkSet
"nmap <unique> mr <Plug>MarkRegex
"xmap <unique> mr <Plug>MarkRegex
"nmap <unique> mc <Plug>MarkClear
"nmap <unique> mx <Plug>MarkAllClear
"
"let g:mwDefaultHighlightingPalette = 'maximum'

"""""""""""""""""""""""""""""""
"" => snipMate (beside <TAB> support <CTRL-j>)
"""""""""""""""""""""""""""""""
"ino <C-j> <C-r>=snipMate#TriggerSnippet()<cr>
"snor <C-j> <esc>i<right><C-r>=snipMate#TriggerSnippet()<cr>

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

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

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

nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>gf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>gi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <leader>ga :cs find a <C-R>=expand("<cword>")<CR><CR>

"" disable the default keymaps
"let g:gutentags_plus_nomap = 1
"noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
"noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
"noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
"noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
"noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
"noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>

" for debug
"let g:gutentags_define_advanced_commands = 1
":GutentagsToggleTrace
":GutentagsUpdate
":messages

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Ack searching and cope displaying
""    requires ack.vim - it's much better than vimgrep/grep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use the the_silver_searcher if possible (much faster than Ack)
"if executable('ag')
"    let g:ackprg = 'ag --vimgrep --smart-case'
"endif
"
"" When you press gv you Ack after the selected text
"vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
"
"" Open Ack and put the cursor in the right position
"cnoreabbrev Ack Ack!
"nnoremap <leader>aa :Ack!<Space><C-R><C-W><cr>
"nnoremap <leader>af :Ack!<Space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

