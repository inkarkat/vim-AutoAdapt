" Test rule adapting within 2 modelines.

source helpers/modelinerules.vim
set modeline modelines=2
0read text.txt

call vimtest#SaveOut()
call vimtest#Quit()
