AUTO ADAPT
===============================================================================
_by Ingo Karkat_

DESCRIPTION
------------------------------------------------------------------------------

This plugin automatically adapts information like "last modified" timestamps
and copyright notices, or applies any other substitution before each file
save. Where and what is replaced can be configured globally and for each
individual buffer.

The plugin ships with configuration defaults which handle the most common
copyright notices, e.g.:
```
    Copyright: (C) 2011-2019 Ingo Karkat
```
and modification timestamps such as
```
    Last Change: Mon 08 Jul 2013 09:36:03 CET
    Modified: 2013 Jul 08
```

### SOURCE

- [The regular expression for updating copyright notices is derived from this page.](http://vim.wikia.com/wiki/Automatically_Update_Copyright_Notice_in_Files)

### RELATED WORKS

- autodate.vim ([vimscript #291](http://www.vim.org/scripts/script.php?script_id=291)) is an old plugin that can insert and update a
  time stamp (between a prefix and postfix) in a certain format.
- ferallastchange.vim ([vimscript #680](http://www.vim.org/scripts/script.php?script_id=680)) is an old plugin that searches for a
  prefix and then updates the timestamp in a certain format.
- timstamp.vim ([vimscript #371](http://www.vim.org/scripts/script.php?script_id=371)) takes pattern and replacement parts like this
  plugin (the replacement part also supports some custom tokens e.g. for
  hostname), and is functionally very close.
- timestamp.vim ([vimscript #923](http://www.vim.org/scripts/script.php?script_id=923)) is based on timstamp.vim. It allows only one
  pattern and feeds the replacement part to strftime(), making it less
  general.
- header.vim ([vimscript #1142](http://www.vim.org/scripts/script.php?script_id=1142)) insert or updates a header at the top, in a
  rather primitive way, and limited to shell, Python, Perl, and Vim scripts.
- lastmod.vim ([vimscript #3578](http://www.vim.org/scripts/script.php?script_id=3578)) is a short and simple plugin for replacing one
  pattern with a timestamp in the first N lines.
- better-header.vim ([vimscript #4676](http://www.vim.org/scripts/script.php?script_id=4676)) can insert and update a header for
  Python and shell scripts, and requires Python itself.
- update-time ([vimscript #4786](http://www.vim.org/scripts/script.php?script_id=4786)) searches the first and last lines for a single
  prefix and then automatically updates a following timestamp.

USAGE
------------------------------------------------------------------------------

    The adaptation happens before every buffer save (BufWritePre event), e.g.
    with the :write command. No action required. You can configure
    (g:AutoAdapt_Rules) and disable this, though:

    :NoAutoAdapt            Turn off automatic adapting for the current buffer.

    :AutoAdapt[!]           Turn on automatic adapting for the current buffer,
                            after having it turned off via|:NoAutoAdapt|, or to
                            enable adapting for a buffer when the automatic
                            adapting has been configured to exclude the current
                            buffer via g:AutoAdapt_FilePattern, or (with [!]) to
                            override a configured Predicate which disables
                            adaptation for the buffer.

    :Adapt[!]               Trigger manual adaptation of the current buffer (when
                            automatic adaption has been turned off via
                            :NoAutoAdapt). With [!] also overrides a configured
                            Predicate which disables adaptation for the buffer.

INSTALLATION
------------------------------------------------------------------------------

The code is hosted in a Git repo at
    https://github.com/inkarkat/vim-AutoAdapt
You can use your favorite plugin manager, or "git clone" into a directory used
for Vim packages. Releases are on the "stable" branch, the latest unstable
development snapshot on "master".

This script is also packaged as a vimball. If you have the "gunzip"
decompressor in your PATH, simply edit the \*.vmb.gz package in Vim; otherwise,
decompress the archive first, e.g. using WinZip. Inside Vim, install by
sourcing the vimball or via the :UseVimball command.

    vim AutoAdapt*.vmb.gz
    :so %

To uninstall, use the :RmVimball command.

### DEPENDENCIES

- Requires Vim 7.0 or higher.
- Requires the ingo-library.vim plugin ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)), version 1.025 or
  higher.

CONFIGURATION
------------------------------------------------------------------------------

For a permanent configuration, put the following commands into your vimrc:

If you want to apply the adaptation only to certain files, you can specify
autocmd-patterns instead of the default "\*". This must be set before the
plugin is sourced:

    let g:AutoAdapt_FilePattern = '*.h,*.c,*.cpp'

Alternatively, if you want to opt-in for certain files only instead of opting
out via :NoAutoAdapt, completely disable the automatic adaptation through

    let g:AutoAdapt_FilePattern = ''

and use :AutoAdapt, e.g. in combination with a local vimrc plugin.

The number of lines at the start of the buffer when the rules are applied by
default:

    let g:AutoAdapt_FirstLines = 25

The number of lines at the end of the buffer when the rules are applied by
default:

    let g:AutoAdapt_LastLines = 10

The reasoning for a larger "first lines" value is that there may be more
boilerplate code at the file's header. (Also for this reason, the 'modelines'
value is not used by default.)
You can override both values for particular buffers / filetypes with the
buffer-scoped variable.

The plugin uses a list of rules to adapt the buffer contents on each save. You
can add your own rules, or completely replace the default rules. Rules can
also be overridden for individual buffers with a buffer-local variable. The
rules consist of a List of Rule objects:

    let g:AutoAdapt_Rules = [
    \   {
    \       'name': 'Copyright notice',
    \       'pattern': '\c\<Copyright:\?\d\{4}\>',
    \       'replacement': strftime('%Y'),
    \       'range': 'modelines'
    \   },
    \   { ... }
    \]

name                    An optional, human-readable description of the rule.
pattern                 The regular-expression as used in a :substitute
                        command (with the separator character /, or
                        substitutionSeparator).
patternexpr             A Funcref (that takes the entire current rule object)
                        or a String that is |eval()|ed to yield the pattern.
                        Updates the pattern attribute on each run. You can use
                        this to e.g. get the current date (via strftime(),
                        to avoid a match of the current date with /@!) into
                        the pattern. The Funcref can throw "AutoAdaptSkip" to
                        skip the application of this rule.
replacement             The replacement; you can use text or
                        sub-replace-special.
range                   The (optional) range to which parts of the buffer the
                        rule will be applied. It defaults to the empty string
                        "", which uses the g:AutoAdapt_FirstLines and
                        g:AutoAdapt_LastLines variables. Alternatives are:
                        "modelines", which considers the 'modelines' number of
                        lines at both the start and end of the buffer.
                        You can also use "%" for the entire buffer, or use
                        numbered ranges "11,42".
substitutionSeparator   The separator in the :substitute. Change from the
                        default "/" to another non-alphanumeric single-byte
                        character when the default is cumbersome. E146

To skip the automatic adaptation for certain files, in addition to
g:AutoAdapt\_FilePattern and :NoAutoAdapt, you can also configure a Funcref
(if that is more convenient) that is passed the current file's filespec, and
should return a Boolean value whether it should be adapted. For example, if
you have the writebackupVersionControl.vim plugin ([vimscript #1829](http://www.vim.org/scripts/script.php?script_id=1829))
installed, you can skip adapting backups via:

    let g:AutoAdapt_Predicate = function('writebackupVersionControl#IsOriginalFile')

INTEGRATION
------------------------------------------------------------------------------

After each write, the plugin sets the variable b:AutoAdapt to the number of
rules that have been applied. If no rule was applied, the variable is removed.
The :NoAutoAdapt sets the variable to 0 to indicate that the plugin is
disabled for that buffer.

If you want to indicate (e.g. in your 'statusline') whether automatic adapting
took place or whether you've manually overridden the automation, you can use
the AutoAdapt#Info#Status() function, which returns:
    "adapted"   when adaptation took place
    "noadapt"   when automatic adaptation is enabled, but was turned off via
                :NoAutoAdapt for this buffer
    "adapt"     when automatic adaptation is disabled, but was turned on via
                :AutoAdapt for this buffer
    ""          in all other situations

CONTRIBUTING
------------------------------------------------------------------------------

Report any bugs, send patches, or suggest features via the issue tracker at
https://github.com/inkarkat/vim-AutoAdapt/issues or email (address below).

HISTORY
------------------------------------------------------------------------------

##### 1.11    23-Mar-2019
- Expose default s:lastChangePattern as g:AutoAdapt\_LastChangePattern. Useful
  to adapt only this part when keeping the default rules.
- Tweak g:AutoAdapt\_LastChangePattern to also capture /[lL]ast updated\\?/ and
  /Updated/, and make the following : optional.
- Old version compatibility: Prevent "No matching autocommands" messages in
  Vim 7.0/1/2.

__You need to update to ingo-library ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)) version 1.025!__

##### 1.10    15-Jan-2014
- ENH: Allow to disable / limit automatic adaptation via
  g:AutoAdapt\_FilePattern configuration.
- ENH: Add :AutoAdapt command to opt-in to automatic adaptation when it's
  either not enabled for the current buffer, or was turned off via
  :NoAutoAdapt.
- ENH: Add AutoAdapt#Info#Status() function for use in a custom 'statusline'.
- ENH: Allow to skip adaptation with g:AutoAdapt\_Predicate.
- ENH: Implement :Adapt command to manually trigger the adaptation (or
  override a configured predicate disallowing it).
- Adapt to changed ingo#actions#EvaluateOrFunc() interface.

__You need to
  update to ingo-library ([vimscript #4433](http://www.vim.org/scripts/script.php?script_id=4433)) version 1.015!__

##### 1.00    09-Jul-2013
- First published version.

##### 0.01    01-Jul-2013
- Started development.

------------------------------------------------------------------------------
Copyright: (C) 2013-2019 Ingo Karkat -
The [VIM LICENSE](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license) applies to this plugin.

Maintainer:     Ingo Karkat &lt;ingo@karkat.de&gt;
