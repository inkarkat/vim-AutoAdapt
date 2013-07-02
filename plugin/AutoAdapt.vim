" AutoAdapt.vim: Automatically adapt timestamps, copyright notices, etc.
"
" DEPENDENCIES:
"   - AutoAdapt.vim autoload script
"   - AutoAdapt/DateTimeFormat.vim autoload script
"   - ingo/err.vim autoload script
"   - ingo/msg.vim autoload script
"   - ingo/plugin.vim autoload script
"
" Copyright: (C) 2013 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"	002	02-Jul-2013	Extend default rules for common formats seen in
"				$VIMRUNTIME/syntax/*.vim.
"	001	01-Jul-2013	file creation

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_AutoAdapt') || (v:version < 700)
    finish
endif
let g:loaded_AutoAdapt = 1
let s:save_cpo = &cpo
set cpo&vim

"- configuration ---------------------------------------------------------------

let s:thisYear = strftime('%Y')
let s:lastChangePattern = '\v\C%(<%(Last%(Changed?| [cC]hanged?| modified)|Modified)\s*:\s+)\zs'
if ! exists('g:AutoAdapt_Rules')
    let g:AutoAdapt_Rules = [
    \   {
    \       'pattern': '\c\<Copyright:\?\%(\s\+\%((C)\|&copy;\|\%xa9\)\)\?\s\+\zs\(\%(' . s:thisYear . '\)\@!\d\{4}\)\%(\ze\k\@![^-]\|\(-\%(' . s:thisYear . '\)\@!\d\{4}\)\>\)',
    \       'replacement': '\1-' . s:thisYear
    \   },
    \   {
    \       'pattern': s:lastChangePattern . '\a{3}(,?) \d{1,2} \a{3} \d{4} \d{2}:\d{2}:\d{2} [AP]M \u+',
    \       'replacement': '\=strftime("%a" . submatch(1) . " %d %b %Y %I:%M:%S %p ") . ' . string(AutoAdapt#DateTimeFormat#ShortTimezone())
    \   },
    \   {
    \       'pattern': s:lastChangePattern . '\a{3}(,?) \d{1,2} \a{3} \d{4} \d{2}:\d{2}:\d{2} %([AP]M)@!\u+',
    \       'replacement': '\=strftime("%a" . submatch(1) . " %d %b %Y %H:%M:%S ") . ' . string(AutoAdapt#DateTimeFormat#ShortTimezone())
    \   },
    \   {
    \       'pattern': s:lastChangePattern . '\a{3}(,?) \a{3} \d{1,2} \d{2}:\d{2}:\d{2} \u+ \d{4}',
    \       'replacement': '\=strftime("%a" . submatch(1) . " %b %d %H:%M:%S ") . ' . string(AutoAdapt#DateTimeFormat#ShortTimezone()) . '. " " . strftime("%Y")'
    \   },
    \   {
    \       'pattern': s:lastChangePattern . '\d{4}([- ])(\a{2,16})\1\d{1,2}',
    \       'replacement': '\=tr(strftime("%Y " . AutoAdapt#DateTimeFormat#MonthFormat(submatch(2)) . " %d"), " ", submatch(1))'
    \   },
    \   {
    \       'pattern': s:lastChangePattern . '\d{4}([- /])(0\d|1[012])\1\d{1,2}',
    \       'replacement': '\=tr(strftime("%Y %m %d"), " ", submatch(1))'
    \   },
    \   {
    \       'pattern': s:lastChangePattern . '\d{1,2}([- ])(\a{2,16})\1\d{4}',
    \       'replacement': '\=tr(strftime("%d " . AutoAdapt#DateTimeFormat#MonthFormat(submatch(2)) . " %Y"), " ", submatch(1))'
    \   },
    \   {
    \       'pattern': s:lastChangePattern . '(\a{2,16}) \d{1,2}, \d{4}',
    \       'replacement': '\=strftime(AutoAdapt#DateTimeFormat#MonthFormat(submatch(1)) . " %d, %Y")'
    \   },
    \]
endif


"- autocmds --------------------------------------------------------------------

augroup AutoAdapt
    autocmd! BufWritePre,FileWritePre * if ! AutoAdapt#Trigger(ingo#plugin#setting#GetBufferLocal('AutoAdapt_Rules')) | call ingo#msg#ErrorMsg(ingo#err#Get()) | endif
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
