" Test rule adapting within 2 modelines.

source helpers/testrules.vim
set modeline modelines=2
0read text.txt

call vimtest#SaveOut()
call vimtest#Quit()
