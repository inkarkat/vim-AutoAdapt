" Test manual trigger of a single rule.

source helpers/testrules.vim
let g:AutoAdapt_FirstLines = 12
let g:AutoAdapt_LastLines = 2
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(2)
echomsg 'Manual :Adapt'
Adapt
call vimtap#Is(b:AutoAdapt, 1, 'adapted by one rule')

call vimtest#SaveOut()
call vimtap#Ok(! exists('b:AutoAdapt'), 'no further adaptation on write')

call vimtest#Quit()
