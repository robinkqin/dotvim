set runtimepath+=~/.vim

source ~/.vim/vimrcs/basic.vim
source ~/.vim/vimrcs/extended.vim
source ~/.vim/vimrcs/filetypes.vim

try
    source ~/.vim/vimrcs/plugins.vim
catch
endtry

source ~/.vim/vimrcs/plugins_config.vim
