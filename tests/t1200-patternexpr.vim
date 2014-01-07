" Test rule with pattern expression.

let g:AutoAdapt_Rules = [
\   {
\       'patternexpr': '"2004\\|" . strftime("%Y")',
\       'replacement': '9999',
\       'range': '%'
\   }
\]
0read text.txt
call vimtest#StartTap()
call vimtap#Plan(2)

call vimtest#SaveOut()
call vimtap#Ok(has_key(g:AutoAdapt_Rules[0], 'pattern'), 'application created pattern attribute in rule')
call vimtap#Is(g:AutoAdapt_Rules[0].pattern, '2004\|' . strftime('%Y'), 'created pattern attribute')

call vimtest#Quit()
