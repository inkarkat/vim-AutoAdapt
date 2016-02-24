" Test selective AutoAdapt through FilePattern.

let g:AutoAdapt_FilePattern = '*.txt'
runtime plugin/AutoAdapt.vim

source helpers/modelinerules.vim

call vimtest#StartTap()
call vimtap#Plan(2)

let s:temp = ingo#fs#tempfile#Make(expand('<sfile>:t:r'))
execute 'edit' s:temp . '.txt'
0read text.txt
write
call vimtap#Is(b:AutoAdapt, 1, 'buffer *.txt was adapted')
call delete(s:temp . '.txt')

execute 'edit' s:temp . '.cpp'
0read text.txt
write
call vimtap#Ok(! exists('b:AutoAdapt'), 'buffer *.cpp was not adapted')
call delete(s:temp . '.cpp')

call vimtest#Quit()
