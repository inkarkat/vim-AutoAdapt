" Test rule adapting within 99 modelines.

source helpers/modelinerules.vim
set modeline modelines=99
0read text.txt

call vimtest#SaveOut()
call vimtest#Quit()
