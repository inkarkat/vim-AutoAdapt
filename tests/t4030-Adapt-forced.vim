" Test forcing manual trigger of a NoAutoAdapt buffer.

source helpers/modelinerules.vim
0read text.txt

call vimtest#StartTap()
call vimtap#Plan(4)
let s:orig2 = getline(2)
NoAutoAdapt
call vimtap#Is(b:AutoAdapt, 0, ':NoAutoAdapt flag is set')
echomsg 'Manual :Adapt'
Adapt
call vimtap#Is(b:AutoAdapt, 0, ':NoAutoAdapt flag is kept')
call vimtap#Isnt(getline(2), s:orig2, 'adapted')

call vimtest#SaveOut()
call vimtap#Is(b:AutoAdapt, 0, 'no further adaptation on write')

call vimtest#Quit()
