" elm.vim: Vim filetype plugin for Elm

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

autocmd BufWritePre <buffer> call elm#format_autosave()
