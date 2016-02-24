" Test rule adapting within the overridden buffer-local configured limits.

source helpers/testrules.vim
let g:AutoAdapt_FirstLines = 12
let g:AutoAdapt_LastLines = 2
let b:AutoAdapt_FirstLines = 2
let b:AutoAdapt_LastLines = 0
0read text.txt
$delete _

call vimtest#SaveOut()
call vimtest#Quit()
