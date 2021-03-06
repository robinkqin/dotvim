"depends: ctags gtags rg python/pygments clang/clang-format/clang-tidy 
"
" f: {char} find char [c x y z]
" ===>>> leaderf f[f m b t q w ' h e a / o n p u d r i s g l j k]
"
" ;: repeat f/t/F/T [b e f g h i k l m n q r o t u w y z]
" ===>>> buffer ;[d x j]
" ===>>> window ;[; c s v a]
"
" ,: repeat f/t/F/T in opposite direction
"
" m: mark
" ===>>> mark m[m r x]
"
" q:
" quickfix q[o q j k c l]
"
" s: delete char and start insert
" ===>>> easymotion s
"
" \:

"g:UltiSnipsExpandTrigger="<c-j>"

"<leader>a:
"<leader>b: c-b
"<leader>c: cwd[cd], commenter c[c n <Space> m i s y $ A a l b u]
"<leader>d: YCM[d]
"<leader>e: vimcfg[ev], quickbufer[eq], ale e[e t l i p n a z]
"<leader>f: c-f
"<leader>g: rg
"<leader>h:
"<leader>i: c-i
"<leader>j: c-f
"<leader>k: c-b
"<leader>l:
"<leader>m:
"<leader>n:
"<leader>o: c-o
"<leader>p:
"<leader>q:
"<leader>r: vreplace[r]
"<leader>s: spell[ss sn sp sa s?]
"<leader>t: tab t[n o c m j k e l]
"<leader>u:
"<leader>v: c-v
"<leader>w: cwd[wd] save file[ww]
"<leader>x:
"<leader>y:
"<leader>z:
"<leader>]:

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => keymap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

map <F2> :e! ~/.vim/cfg/extended.vim<cr>
autocmd! bufwritepost ~/.vim/cfg/extended.vim source ~/.vim/cfg/extended.vim

" Quickly open a buffer for scribble
"map <leader>eq :e ~/buffer<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => indent-guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
nmap <silent> <leader>ti <Plug>IndentGuidesToggle

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set signcolumn=yes
set updatetime=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => echodoc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To use echodoc, you must increase 'cmdheight' value.
"set cmdheight=2
let g:echodoc_enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => asyncrun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:asyncrun_open = 10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>ta <Plug>(EasyAlign)
xmap <leader>ta <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => mark
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <unique> mt <Plug>MarkToggle
nmap <unique> <leader>mm <Plug>MarkSet
xmap <unique> <leader>mm <Plug>MarkSet
nmap <unique> <leader>mr <Plug>MarkRegex
xmap <unique> <leader>mr <Plug>MarkRegex
nmap <unique> <leader>mn <Plug>MarkClear
nmap <unique> <leader>mu <Plug>MarkAllClear

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
set textwidth=80
noremap <leader>tf :Autoformat<cr>
"autocmd BufWrite * :Autoformat
"autocmd BufWrite *.c,*.cpp,*.h,*.hpp :Autoformat

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
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"nmap <leader>ee :ALEEnable<cr>:ALELint<cr>
"nmap <leader>et :ALEToggle<cr>
"nmap <leader>el :ALEDetail<cr>
"nmap <leader>ei :ALEInfo<cr>
"nmap <leader>ep :ALEPreviousWrap<cr>
"nmap <leader>en :ALENextWrap<cr>
"nmap <leader>ea :ALEFirst<cr>
"nmap <leader>ez :ALELast<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YCM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,go,rust,python': ['re!\w{2}'],
            \ 'sh,zsh,lua,javascript': ['re!\w{2}'],
            \ }

let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "objc":1,
            \ "objcpp":1,
            \ "go":1,
            \ "rust":1,
            \ "python":1,
            \ "sh":1,
            \ "zsh":1,
            \ }

"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_key_invoke_completion = '<c-z>'

"let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'

" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

"let g:ycm_confirm_extra_conf = 0

"nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LeaderF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.project', '.root', '.vs']

let g:Lf_ReverseOrder = 1
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
"let g:Lf_FollowLinks = 1

"let g:Lf_PreviewInPopup = 1
"let g:Lf_WindowPosition = 'popup'
"let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"if has("win32")
"else
"let g:Lf_PopupWidth = &columns * 3 / 4
"endif

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg', '.vs'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.d','*.so','*.py[co]','moc_*.cpp','moc_*.h']
            \}

let g:Lf_MruFileExclude = ['*.so','moc_*.cpp','moc_*.h']

" let g:Lf_RgConfig = [
"     \ "--max-columns=150",
"     \ "--type-add web:*.{html,css,js}*",
"     \ "--glob=!git/*",
"     \ "--hidden"
" \ ]

noremap <leader>e :Leaderf file --nowrap<cr>
noremap <leader>b :Leaderf buffer --nowrap<cr>

noremap <leader>d :Leaderf function --nowrap<cr>
noremap <leader>q :Leaderf quickfix --nowrap<cr>
noremap <leader>w :Leaderf window --nowrap<cr>

noremap <leader>' :Leaderf marks --nowrap<cr>

noremap <leader>h :Leaderf cmdHistory --nowrap<cr>

noremap <leader>a :<C-U><C-R>=printf("Leaderf rg --nowrap -e %s", expand("<cword>"))<cr><cr>
noremap <leader>s :<C-U><C-R>=printf("Leaderf rg --nowrap --current-buffer -e %s", expand("<cword>"))<cr><cr>
noremap <leader>r :Leaderf rg --nowrap -e<Space>
"noremap <leader>o:Leaderf rg --recall<cr>

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_GtagsSkipUnreadable = 1
if has("win32")
else
let g:Lf_Gtagslabel = 'native-pygments'
"let g:Lf_Gtagsconf = '~/.vim/tools/gtags.conf'
endif
"noremap <leader>v :Leaderf gtags --update --gtagslibpath 
noremap <leader>u :Leaderf gtags --update<cr>
noremap <leader>j :<C-U><C-R>=printf("Leaderf gtags -d %s --auto-jump", expand("<cword>"))<cr><cr>
"noremap <leader>, :Leaderf gtags --auto-jump -d 
"noremap <leader>fr :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump --nowrap", expand("<cword>"))<cr><cr>
"noremap <leader>fi :<C-U><C-R>=printf("Leaderf gtags -s %s --auto-jump --nowrap", expand("<cword>"))<cr><cr>
"noremap <leader>g :<C-U><C-R>=printf("Leaderf gtags -g %s --auto-jump --nowrap", expand("<cword>"))<cr><cr>
noremap <leader>g :<C-U><C-R>=printf("Leaderf gtags -r %s --nowrap", expand("<cword>"))<cr><cr><esc>:<C-U><C-R>=printf("Leaderf gtags -s %s --nowrap --append", expand("<cword>"))<cr><cr>
"noremap <leader>f; :Leaderf gtags --auto-jump --nowrap -g 
noremap <leader>l :Leaderf gtags --recall<cr>
noremap <leader>n :Leaderf gtags --next<cr>
noremap <leader>p :Leaderf gtags --previous<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

"map s <Plug>(easymotion-prefix)

"nmap s <Plug>(easymotion-overwin-f)
nmap <leader>; <Plug>(easymotion-overwin-f2)

"" <Leader>f{char} to move to {char}
"map  sf <Plug>(easymotion-bd-f)
"nmap sf <Plug>(easymotion-overwin-f)
"
"" s{char}{char} to move to {char}{char}
"map  ss <Plug>(easymotion-bd-f2)
"nmap ss <Plug>(easymotion-overwin-f2)
"
"" Move to line
"map sj <Plug>(easymotion-bd-jk)
"nmap sj <Plug>(easymotion-overwin-line)
"
"map  sl <Plug>(easymotion-lineanywhere)
"
"" Move to word
"map  sw <Plug>(easymotion-bd-w)
"nmap sw <Plug>(easymotion-overwin-w)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto popup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1, 'c':1, 'cpp':1, 'sh':1}
"" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
"set cpt=.,k,w,b
"" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect
"" 禁止在下方显示一些啰嗦的提示
set shortmess+=c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto lsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    "nmap <buffer> gd <plug>(lsp-definition)
    "nmap <buffer> gs <plug>(lsp-document-symbol-search)
    "nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    "nmap <buffer> gr <plug>(lsp-references)
    "nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)
    "nmap <buffer> <leader>rn <plug>(lsp-rename)
    "nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    "nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    "nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    "autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    "autocmd! BufWritePre *.c,*.cpp call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

