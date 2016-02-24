" Test Copyright with year.

scriptencoding utf-8
let s:thisYear = strftime('%Y')

insert
" Copyright: (C) 2011 Ingo Karkat
" Copyright: (C) 2000-2011 Ingo Karkat
Copyright	2011 by me
Copyright	2000-2011 by me
<!-- copyright &copy; 2000-2011 -->
CopyRight © 2000-2011
.

call vimtest#SaveOut()
call vimtest#StartTap()
call vimtap#Plan(6)

call vimtap#Is(getline(1), '" Copyright: (C) 2011-' . s:thisYear . ' Ingo Karkat', 'line 1')
call vimtap#Is(getline(2), '" Copyright: (C) 2000-' . s:thisYear . ' Ingo Karkat', 'line 2')
call vimtap#Is(getline(3), 'Copyright	2011-' . s:thisYear . ' by me', 'line 3')
call vimtap#Is(getline(4), 'Copyright	2000-' . s:thisYear . ' by me', 'line 4')
call vimtap#Is(getline(5), '<!-- copyright &copy; 2000-' . s:thisYear . ' -->', 'line 5')
call vimtap#Is(getline(6), 'CopyRight © 2000-' . s:thisYear, 'line 6')

call vimtest#Quit()
