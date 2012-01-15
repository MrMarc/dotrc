function! XMLMappings()
  noremap <leader>;xp :call Xpath()<cr>
endfunction
noremap <leader>xp :call Xpath()<cr>
 
function! Xpath()
  " Needs to get the real file name for the quickfix window
  let realname = bufname( "%" )

  " Write the buffer to a temp file
  let filename = tempname()
  let lines = getline( 1, "$" )
  call writefile( lines, filename )

  let xpath    = input("Enter xpath expression: ")

  let tmp1=&grepprg
  let tmp2=&grepformat
  set grepformat=%f:%l\ %m
  set grepprg=~/xpath-vim.pl
  exe "grep ".escape(filename, ' \')." \"".xpath."\" ".escape(realname, ' \')
  let &grepprg=tmp1
  let &grepformat=tmp2
  :copen
endfunction
