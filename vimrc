" Allow unsaved buffers to be hidden so that we
" dont' have to resave scp based buffers all the time
set bufhidden=hide

" Tab completion options
" Try to make it more like bash'es completion
set wildmenu
set wildignorecase
set wildmode=longest,list

set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp

" Use the same rc file for both
" cmd line vim and MacVim.
" Makes debugging plugins easier
if has("gui_running")
  " Set the Gui font
  "set guifont=Menlo\ Bold:h15
  "set guifont=Inconsolata-dz\ for\ Powerline:h17
  "set guifont=Menlo\ for\ Powerline:h17
  set guifont=Consolas\ for\ Powerline:h17

  " Remove the toolbar - don't like it
  set guioptions-=T

  " Remap Command-T to PeepOpen when there's a GUI
  macmenu &File.New\ Tab key=<nop>
  map <silent><D-t> <Plug>PeepOpen

  " This command opens a Markdown file in Marked .
  " Could be done based on filetype
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

else

  map <D-t> :CtrlP<CR>
  " Enable mouse movement - nice with a trackpad
  set mouse=a

endif

color badwolf

if has("autocmd")
  " Auto load the changes to this file.
  autocmd bufwritepost ~/dotrc/vimrc source ~/dotrc/vimrc

  " Change the folding settings for Perl code
  augroup marc_perl_settings
    au BufEnter *.pl setl foldmethod=manual foldcolumn=3 foldlevel=99 mouse=a complete-=i
  augroup END
  augroup marc_cpp_settings
    au BufEnter *.cpp setl foldmethod=syntax foldcolumn=3 foldlevel=99 mouse=a complete-=i
  augroup END
endif

filetype plugin on
filetype indent on

let perl_fold=1
let perl_fold_blocks=1

let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Editing this file often enough so add a shortcut
nmap ,v :edit ~/dotrc/vimrc<CR>
map ,v :edit ~/dotrc/vimrc<CR>

" Add my own mapping for CtrlP
nmap ,t :CtrlP<CR>
map ,t :CtrlP<CR>

" Add values for MiniBufExplorer
let g:miniBufExplModSelTarget = 1
" Always open miniBufExplorer
let g:miniBufExplorerMoreThanOne=0

" Options for ShowMarks
let g:showmarks_enable = 1

let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let showmarks_ignore_type = "hq"

" Hilight the entire lien
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

" ======================================================== 
" Custom colours for ShowMarks
" ======================================================== 

" For marks a-z
hi clear ShowMarksHLl
"hi ShowMarksHLl term=bold cterm=none ctermbg=Blue gui=none guibg=Blue
hi ShowMarksHLl term=bold cterm=bold ctermbg=LightRed ctermfg=DarkRed gui=bold guibg=LightRed guifg=DarkRed
" For marks A-Z
hi clear ShowMarksHLu
hi ShowMarksHLu term=bold cterm=bold ctermbg=LightRed ctermfg=DarkRed gui=bold guibg=LightRed guifg=DarkRed
" For all other marks
hi clear ShowMarksHLo
hi ShowMarksHLo term=bold cterm=bold ctermbg=LightYellow ctermfg=DarkYellow gui=bold guibg=LightYellow guifg=DarkYellow
" For multiple marks on the same line.
hi clear ShowMarksHLm
hi ShowMarksHLm term=bold cterm=none ctermbg=Blue gui=none guibg=SlateBlue

" Add my typical TODO marker
let g:TagmaTasksTokens = ['FIXME','TODO','NOTE','TODO:mpb']

" Trick out the status line as much as possible
let g:Powerline_symbols = 'fancy'
" These options make Powerline work better
set nocompatible
set laststatus=2
set t_Co=256

" Change gundo to show a change preview at the bottom of the screen
let g:gundo_preview_bottom=1

" Change the indent guides line to only take one (the first) column
let g:indent_guides_guide_size=1

" Set up the location for easytags
let g:easytags_file = '/tmp/vimtags'
" These settings are for easytags
set notagbsearch
set ignorecase

"set hidden

let mapleader=","
let g:mapleader=","

" TODO:mpb is this necessary?
" was running into visual update problems with a plugin until I added 
" this - now can't remember which one it was. Find out and label/remove
set updatetime=4000

" Helps perl syntax highlighting
syntax sync fromstart

" Try to teach myself not to rely on the arrow keys so much ...
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Try to use the home row escape as well
inoremap jj <Esc>

" Trying VimDB out to query key commands
" https://github.com/cldwalker/vimdb#readme
map <Leader>vd :!rbenv exec vimdb 

" Reselect the visual selection after indenting
vnoremap < <gv
vnoremap > >gv

function! HTMLDecode()
perl << EOF
 use HTML::Entities;
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = decode_entities($line);
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

function! HTMLEncode()
perl << EOF
 use HTML::Entities;
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = encode_entities($line);
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

map <Leader>H :call HTMLDecode()<CR>
map <Leader>h :call HTMLEncode()<CR>

" TODO:mpb Check the values for the directories below
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsSnippetDirectories=["/Volumes/MacintoshHD/Users/marc/dotrc/MySnippets","Ultisnips"]
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
imap <silent><D-right> <C-R>=UltiSnips_JumpForwards()<CR>
