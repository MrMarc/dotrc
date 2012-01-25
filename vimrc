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

" Change gundo to show a change preview at the bottom of the screen
let g:gundo_preview_bottom=1

" Change the indent guides line to only take one (the first) column
let g:indent_guides_guide_size=1
