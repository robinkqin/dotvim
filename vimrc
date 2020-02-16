set runtimepath+=~/.vim

source ~/.vim/cfg/basic.vim

try
    source ~/.vim/cfg/plugin.vim
catch
endtry

source ~/.vim/cfg/extended.vim
