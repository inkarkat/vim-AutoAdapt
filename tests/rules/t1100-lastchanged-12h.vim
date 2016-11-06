" Test Last Changed with date in 12h format.

lang time en_US.UTF-8

insert
" Last Change  : Wed 25 Mar 2009 03:28:34 PM PDT
/* Last changed: Fri 6 Feb 2004 02:46:27 PM CST */
# Modified:	 Wed 25 Mar 2009 05:28:34 AM PDT #
.

let s:orig1 = getline(1)
let s:orig2 = getline(2)
let s:orig3 = getline(3)
call vimtest#SaveOut()
call vimtest#StartTap()
call vimtap#Plan(6)

call vimtap#Isnt(getline(1), s:orig1, 'line 1 changed')
call vimtap#Like(getline(1), '\v^" Last Change  : \a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} [AP]M \a+$', 'line 1')
call vimtap#Isnt(getline(2), s:orig2, 'line 2 changed')
call vimtap#Like(getline(2), '\v^/\* Last changed: \a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} [AP]M \a+ \*/$', 'line 2')
call vimtap#Isnt(getline(3), s:orig3, 'line 3 changed')
call vimtap#Like(getline(3), '\v^# Modified:\t \a{3} \d{2} \a{3} \d{4} \d{2}:\d{2}:\d{2} [AP]M \a+ #$', 'line 3')

call vimtest#Quit()
