" Test non-matching Copyright with year.

scriptencoding utf-8
let s:thisYear = strftime('%Y')

call setline(1, '" Copyright: (C) ' . s:thisYear . ' Ingo Karkat')
call setline(2, '" Copyright: (C) 2000-' . s:thisYear . ' Ingo Karkat')
let s:orig1 = getline(1)
let s:orig2 = getline(2)

setlocal nomodified
doautocmd BufWritePre
call vimtest#StartTap()
call vimtap#Plan(3)

call vimtap#Is(&l:modified, 0, 'buffer not modified')
call vimtap#Is(getline(1), s:orig1, 'line 1')
call vimtap#Is(getline(2), s:orig2, 'line 2')

call vimtest#Quit()
