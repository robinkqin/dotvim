set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/extended.vim

try
    source ~/.vim/vimrcs/plugin.vim
catch
endtry

source ~/.vim/vimrcs/plugcfg.vim
