"depends:
"python, gtags, ctags, fzf, rg, ag
"pip install pygments
"gcc, clang, clang-format
"rust

"a: append
"b: words backward
"c: {motion} delete text and insert
"d: {motion} delete
"e: forward
"f: {char} find char
" ===>>>===>>> leaderf[ff, fm, fb, fe, fs, fw, ft, fa, fl, fj, fu, fc, fhc/s/h, fg, fr, fd, fo, fn, fp]
"g: g
" ===>>>===>>> gtags [gr, gd, gs, gc, gt, ge, gf, gi, ga]
"h: left
"i: insert
"j: down
"k: up
"l: right
"m:
" ===>>>===>>>mark[mm, mr, mn, mc]
" ===>>>===>>>signature[]
"n: repeat /
"o: begin a new line
"p: put text
"q: record
"r: {char} replace
"s: delete char and start insert
"t: {char} till
" ===>>>===>>>
"u: undo
"v: visual
"w: word forward
"x: delete
"y: {motion} yank
"z: fold
"[: [
"]: ]
";: repeat f/t/F/T
" ===>>>===>>>easymotion[;;, ;f, ;w, ;g, ;j]
"': jump to mark
",: repeat f/t/F/T in opposite direction
" ===>>>===>>>
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

"leader><leader>w: write
"leader><leader>t: tagbar

"<leader>a:
"<leader>b: buffer[bd, ba, bn, bp], save buffer[bs]
"<leader>c: quickfix[co, cc, cn, cp], cwd[cd], NERDComm[ca, cu, cb, cl, cy, cs, ci, cn, cm, cc], surround[cs]
"<leader>d: surround[ds]
"<leader>e: [ee]
"<leader>f: save file[fs]
"<leader>g:
"<leader>h:
"<leader>i: C-I, indent-guides[ii]
"<leader>j:
"<leader>k: ctrlsf[kk, kf, kF, kn, kp, ko, ks, kc, kt]
"<leader>l: ALE[ll, ld, lp, ln]
"<leader>m:
"<leader>n: NERDTree[nn]
"<leader>o: C-O,
"<leader>p: Toggle paste mode on and off: [pp]
"<leader>q: quickly open a buffer[qq]
"<leader>r: visualreplace[rr]
"<leader>s: spell[ss, sn, sp, sa, s?], shell[sh, sw]
"<leader>t: tab[tn, to, tc, tm, tt, tl, te]
"<leader>u:
"<leader>v:
"<leader>w: [ww] [wd], window[wc, wo, ws, wv, wh, wl, wj, wk]
"<leader>x: quickly open a markdown buffer[xx]
"<leader>y:
"<leader>z: fzf[zf, zh, zo, zc, zl, zt, za, zr]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

nnoremap <leader>qa :qa<cr>
nnoremap <leader>qx :qa!<cr>
nnoremap <leader>qw :wqa<cr>

nnoremap <leader>fs :w!<cr>
nnoremap <leader>bs :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
nnoremap <leader>wd :pwd<cr>


" => Fast editing and reloading of vimrc configs
map <leader>ee :e! ~/.vim/vimrcs/plugins_config.vim<cr>
"autocmd! bufwritepost ~/.vim/vimrcs/plugins_config.vim source ~/.vim/vimrcs/plugins_config.vim


" When you press <leader>rr you can search and replace the selected text
vnoremap <silent> <leader>rr :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>co :botright copen<cr>
map <leader>cc :botright cclose<cr>
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>
" map <leader>ca ggVGy:tabnew<cr>:set syntax=qf<cr>pgg


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

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>o <C-O>
map <leader>i <C-I>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


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
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/


" => Spell checking
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:fzf_command_prefix = 'Fzf'
nnoremap <silent> <leader>zf :FzfFiles<CR>
nnoremap <silent> <leader>zh :FzfHistory<CR>
nnoremap <silent> <leader>zo :FzfBuffers<CR>
nnoremap <silent> <leader>zc :FzfColors<CR>
nnoremap <silent> <leader>zl :FzfBLines<CR>
nnoremap <silent> <leader>zL :FzfLines<CR>
nnoremap <silent> <leader>zt :FzfBTags<CR>
nnoremap <silent> <leader>zT :FzfTags<CR>
nnoremap <silent> <leader>za :FzfAg<CR>
nnoremap <silent> <leader>zr :FzfRg<CR>
nnoremap <silent> <leader>zm :FzfMarks<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlsf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>kk :CtrlSF<Space><C-R><C-W><cr>
nmap     <leader>kf <Plug>CtrlSFPrompt
vmap     <leader>kf <Plug>CtrlSFVwordExec
vmap     <leader>kv <Plug>CtrlSFVwordPath
nmap     <leader>kn <Plug>CtrlSFCwordPath
nmap     <leader>kp <Plug>CtrlSFPwordPath
nnoremap <leader>ko :CtrlSFOpen<CR>
nnoremap <leader>kc :CtrlSFClose<CR>
nnoremap <leader>ks :CtrlSFStop<CR>
nnoremap <leader>kt :CtrlSFToggle<CR>
inoremap <leader>kt <Esc>:CtrlSFToggle<CR>

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

"i k q v x y z

noremap ff :<C-U><C-R>=printf("Leaderf file %s", "")<CR><CR>
noremap fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

noremap fe :Leaderf rg -e<Space>
noremap fs :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>
noremap fw :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>

noremap ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap fa :<C-U><C-R>=printf("Leaderf tag %s", "")<CR><CR>
noremap fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

noremap fj :Leaderf function<cr>

noremap fu :Leaderf colorscheme<cr>
noremap fc :Leaderf command<cr>

noremap fhc :Leaderf cmdHistory<cr>
noremap fhs :Leaderf searchHistory<cr>
noremap fhh :Leaderf self<cr>

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
" => airline/airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"

let g:NERDTreeWinSize = 35
let NERDTreeShowHidden = 1
let NERDTreeShowLineNumbers = 1
let g:nerdtree_tabs_open_on_console_startup = 1

let NERDTreeIgnore = ['\.pyc$', '__pycache__']

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <leader>nn :NERDTreeToggle<cr>
"map <leader>nb :NERDTreeFromBookmark<Space>
"map <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map ; <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1

" move to {char}
map  ;; <Plug>(easymotion-bd-f)
nmap ;; <Plug>(easymotion-overwin-f)

" move to {cahr}{char}
map  ;f <Plug>(easymotion-bd-f2)
nmap ;f <Plug>(easymotion-overwin-f2)

" Move to word
map  ;w <Plug>(easymotion-bd-w)
nmap ;w <Plug>(easymotion-overwin-w)

map  ;g <Plug>(easymotion-lineanywhere)

" Move to line
map  ;j <Plug>(easymotion-bd-jk)
nmap ;j <Plug>(easymotion-overwin-line)

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
nmap <leader><leader>t :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => signature
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" gb, gl, gx, gz
nnoremap gr :cs find s <C-R>=expand("<cword>")<CR><CR>
nnoremap gd :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap gs :cs find d <C-R>=expand("<cword>")<CR><CR>
nnoremap gc :cs find c <C-R>=expand("<cword>")<CR><CR>
nnoremap gt :cs find t <C-R>=expand("<cword>")<CR><CR>
nnoremap ge :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap gf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nnoremap gi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nnoremap ga :cs find a <C-R>=expand("<cword>")<CR><CR>

" for debug
"let g:gutentags_define_advanced_commands = 1
":GutentagsToggleTrace
":GutentagsUpdate
":messages

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
"set signcolumn = yes
"set updatetime = 100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deol / shell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>sh :Deol<cr>
"nnoremap <leader>sw :Deol -cwd='fnamemodify(expand('%'), ':h')'<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0

let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

nmap <leader>lt :ALEToggle<CR>
nmap <leader>le :ALEEnable<CR>

nmap <leader>ll :ALELint<CR>
nmap <leader>ld :ALEDetail<CR>
nmap <leader>lf :ALEFix<CR>

nmap <leader>lp :ALEPreviousWrap<CR>
nmap <leader>ln :ALENextWrap<CR>

"let g:ale_completion_delay = 500
"let g:ale_echo_delay = 20
"let g:ale_lint_delay = 500
"let g:airline#extensions#ale#enabled = 1

"let g:ale_lint_on_text_changed = 'normal'
"let g:ale_lint_on_insert_leave = 1

"hi! clear SpellBad
"hi! clear SpellCap
"hi! clear SpellRare
"hi! SpellBad gui=undercurl guisp=red
"hi! SpellCap gui=undercurl guisp=blue
"hi! SpellRare gui=undercurl guisp=magenta

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

