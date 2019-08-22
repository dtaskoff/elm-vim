" Vim syntax file
" Language: Elm
" Maintainer: Daniel Taskoff <daniel.taskoff@gmail.com>
" Last Change: 2019 Aug 22

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Comments
syn match elmSingleLineComment "--.*$" contains=elmTodo
syn region elmMultiLineComment start="{-" end="-}" contains=elmTodo,elmMultiLineComment
syn keyword elmTodo TODO FIXME XXX contained


" Literals
" Lists
" Conditionals
" Records
" Functions
" Operators
" Let Expressions

" Modules
syn keyword elmModule module import as exposing

" Type Annotations
" Type Aliases
" Custom Types


" Highlighting
hi def link elmSingleLineComment Comment
hi def link elmMultiLineComment Comment
hi def link elmTodo Todo
hi def link elmModule Include


let b:current_syntax = "elm"
