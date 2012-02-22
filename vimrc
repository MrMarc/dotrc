" These settings are for easytags
set notagbsearch
set ignorecase

let g:easytags_file = '/tmp/vimtags'

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
  set gfn=Menlo\ Bold:h15

  " Remove the toolbar - don't like it
  set guioptions-=T

  " Remap Command-T to PeepOpen when there's a GUI
  macmenu &File.New\ Tab key=<nop>
  map <silent><D-t> <Plug>PeepOpen

  " This command opens a Markdown file in Marked
  " Could be done based on filetype
  :nnoremap <leader>m :silent !open -a Marked.app '%:p'<cr>

  color badwolf
  "color inkpot

else

  color ir_black

endif

if has("autocmd")
  " Auto load the changes to this file.
  autocmd bufwritepost ~/dotrc/vimrc source ~/dotrc/vimrc

  " Change the folding settings for Perl code
  augroup marc_perl_settings
    au BufEnter *.pl setl foldmethod=syntax foldcolumn=3 foldlevel=99 mouse=a
  augroup END
endif

let perl_fold=1
let perl_fold_blocks=1

let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Editing this file often enough so add a shortcut
nmap ,v :tabedit ~/dotrc/vimrc<CR>
map ,v :tabedit ~/dotrc/vimrc<CR>

" Add values for MiniBuifExplorer
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplModSelTarget = 1

" Options for ShowMarks
"let g:showmarks_enable = 1

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

let mapleader=","
let g:mapleader=","

set updatetime=4000

let g:TagmaTasksTokens = ['FIXME','TODO','NOTE','TODO:mpb']

"set hidden
syntax sync fromstart

" Change gundo to show a change preview at the bottom of the screen
let g:gundo_preview_bottom=1

" Change the indent guides line to only take one (the first) column
let g:indent_guides_guide_size=1

" Try to teach myself not to rely on the arrow keys so much ...
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" Try to use the home row escape as well
inoremap jj <Esc>
