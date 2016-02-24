" Test rule adapting within 10 modelines.

source helpers/modelinerules.vim
set modeline modelines=10
0read text.txt

call vimtest#SaveOut()
call vimtest#Quit()
