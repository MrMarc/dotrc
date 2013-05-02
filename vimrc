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

  " This was my choice before
  "set guifont=Consolas\ for\ Powerline:h17

  " New powerline font setup
  "set guifont=Inconsolata\ for\ Powerline:h20
  set guifont=Consolas\ for\ Powerline:h17

  " Remove the toolbar - don't like it
  set guioptions-=T

  macmenu &File.New\ Tab key=<nop>
else

  map <D-t> :CtrlP<CR>
  " Enable mouse movement - nice with a trackpad
  set mouse=a
  set ttymouse=xterm2
endif

color marcRailscasts
let g:badwolf_darkgutter = 1

if has("mac")
  " OSX specific plugins and functions

  " Remap Command-T to PeepOpen when there's a GUI
  map <silent><D-t> <Plug>PeepOpen

  " This command opens a Markdown file in Marked .
  " Could be done based on filetype
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>
endif

function! Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

function! JavaFoldText()
    let sub = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=', '', 'g')
    let diff = v:foldend - v:foldstart + 1
    return  '+' . v:folddashes . '[' . Num2S(diff,3) . ']' . sub
endfunction

if has("autocmd")
  " Auto load the changes to this file.
  autocmd bufwritepost ~/dotrc/vimrc source ~/dotrc/vimrc

  " Change the folding settings for Perl code
  augroup marc_perl_settings
    au BufEnter *.pl,*.pm setl foldmethod=manual foldtext=JavaFoldText() foldcolumn=3 foldlevel=99 mouse=a complete-=i
    au BufEnter *.t setl foldmethod=indent foldcolumn=3 foldlevel=99 mouse=a complete-=i
  augroup END

  " Change the folding settings for Java code
  augroup marc_java_settings
    au BufEnter,BufRead *.java setl foldmethod=manual foldtext=JavaFoldText() foldcolumn=3 foldlevel=99 mouse=a complete-=i
  augroup END

  augroup marc_xml_settings
    au BufEnter *.xsd,*.xml,*.xslt,*.xsl,*.in setl foldmethod=syntax foldcolumn=3 foldlevel=99 mouse=a 
    au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
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
let g:xml_syntax_folding=1    " XML

" Editing this file often enough so add a shortcut
nmap ,v :edit ~/dotrc/vimrc<CR>
map ,v :edit ~/dotrc/vimrc<CR>

" Add my own mapping for CtrlP
nmap ,t :CtrlP `pwd`<CR>
map ,t :CtrlP `pwd`<CR>
let g:ctrlp_working_path_mode = 0

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

" This is the bomb
:vnoremap . :norm.<CR>

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

function! EclimRunning() 
  if exists('*eclim#PingEclim') 
     let running = eclim#PingEclim(0) 
     return running 
  else 
     return 0 
  endif 
endfunction 

map <Leader>H :call HTMLDecode()<CR>
map <Leader>h :call HTMLEncode()<CR>

" TODO:mpb Check the values for the directories below
let g:UltiSnipsDontReverseSearchPath="1"
let g:UltiSnipsSnippetDirectories=["/Volumes/MacintoshHD/Users/marc/dotrc/MySnippets","Ultisnips"]
"let g:UltiSnipsJumpForwardTrigger = "<tab>"
imap <silent><D-right> <C-R>=UltiSnips_JumpForwards()<CR>

" Conque options
let g:ConqueTerm_InsertOnEnter = 0
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_CloseOnEnd = 1

map <Leader>z :vsp<CR><C-W><Right>:A<CR>

" Use 'the_silver_searcher' rather than 'ack'
"let g:ackprg = 'ag --nogroup --nocolor --column'

function! GuardStart()
 let g:guardterm = conque_term#open('guard start', ['botright split', 'resize 5'], 1)
endfunction

function! GuardStop()
 call g:guardterm.writeln("q\n")
endfunction

map <Leader>gs :call GuardStart()<CR>

map <silent><D-F12> <Plug>PeepOpen

" key bindings
map <silent><Leader>dd         :DBGRstart<CR>
"map <silent><Leader><F12> :DBGRstart<SPACE>
map <silent><Leader>ds         :DBGRstep<CR>
map <silent><Leader>dn         :DBGRnext<CR>
map <silent><Leader>dc         :DBGRcont<CR>                   " continue
map <silent><Leader>db         :DBGRsetBreakPoint<CR>
map <silent><Leader>dcl        :DBGRclearBreakPoint<CR>
map <silent><Leader>dca        :DBGRclearAllBreakPoints<CR>
map <Leader>dx/                :DBGRprint<SPACE>
map <silent><Leader>dx         :DBGRprintExpand expand("<cWORD>")<CR> " value under cursor
map <Leader>d/                 :DBGRcommand<SPACE>
map <silent><Leader>dr         :DBGRrestart<CR>
map <silent><Leader>dq         :DBGRquit<CR>

set encoding=utf-8
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/source_plugin.vim
