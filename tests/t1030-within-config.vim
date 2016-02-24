" Test rule adapting within the configured limits.

source helpers/testrules.vim
let g:AutoAdapt_FirstLines = 12
let g:AutoAdapt_LastLines = 2
0read text.txt

call vimtest#SaveOut()
call vimtest#Quit()
