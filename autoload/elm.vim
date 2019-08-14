" elm.vim: Vim command for formatting Elm files with elm-format

function! elm#format_autosave() abort
  " save cursor and windows positions
  let l:curw = winsaveview()

  " write the current unsaved buffer to a temp file
  let l:tmpname = tempname() . '.elm'
  call writefile(getline(1, '$'), l:tmpname)

  " run elm-format
  let l:out = system('elm-format ' . l:tmpname . ' --output ' . l:tmpname)

  " check if there was an error
  if v:shell_error == 0
    call rename(l:tmpname, expand('%'))

    silent edit!

    " refresh the syntax highlight
    syntax sync fromstart
  else
    echohl Error | echo 'elm-format: ' l:out | echohl None
  endif

  " clean up
  call delete(l:tmpname)

  " restore cursor and windows positions
  call winrestview(l:curw)
endfunction
