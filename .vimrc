"vundle - required
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin) and use :PluginInstall in Vim
" to install the plugins.
"git interface

"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Bufferline above statusbar that looks fancy
Plugin 'kien/ctrlp.vim' 

" tcomment_vim syntax-aware plugin for easy commenting, very often used
" it works like a toggle, highlight a line and type gc, or type gcc with line
Plugin 'tomtom/tcomment_vim'

" Vim will draw a nice statusline at the bottom of each window.
Plugin 'vim-airline/vim-airline'
" Plugin 'itchyny/lightline.vim'

" Tagbar gives an easy way to browse the tags of the current file 
" and get an overview of its structure 
Plugin 'majutsushi/tagbar'

" Easily switch between source and header files
Plugin 'vim-scripts/a.vim'

"ZoomWin can zoom into the current view and zoom out again

"html
"  isnowfy only compatible with python not python3
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'

" Git checker that shows modifications
Plugin 'airblade/vim-gitgutter'

" Indent Guides provide visual indicators of the indent level
"Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Yggdroot/indentLine'

"Multiple cursors
Plugin 'terryma/vim-multiple-cursors'

"Git wrapper
Plugin 'tpope/vim-fugitive'

"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'w0rp/ale'

"auto-completion stuff
"Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
"Plugin 'jnurmine/Zenburn'
Plugin 'tomasr/molokai'
"Plugin 'flazz/vim-colorschemes'
Plugin 'sjl/badwolf'

"Plugin for virtualenv access outside
Plugin 'plytophogy/vim-virtualenv'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()

" The first line ensures that the auto-complete window goes away 
" when you’re done with it, and the second defines a shortcut 
" for goto definition.
filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1
let g:pydiction_location = '/home/user/.vim/bundle/Pydiction/complete-dict'
"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"let g:tagbar_ctags_bin = '/home/jjonker/.vim/ctags/bin/ctags'
"custom keys
"The following line gives me "no buffer available
let mapleader="   "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
"call togglebg#map("<F9>")
colorscheme badwolf
"colorscheme molokai
"colorscheme zenburn
"colorscheme solarized
"colorscheme github
"set guifont=Monaco:h14
"Molokai is a nice one

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw set textwidth=99
au BufRead,BufNewFile *.py,*.pyw set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
"set backspace=indent,eol,start

"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

au BufNewFile,BufRead *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2






" Nest splits horizontal and vertical, jump between them using
" ^Ctrl + J/K/L/H to move below, above, right or left resp.
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Use space to open folds
nnoremap <space> za

"if has('gui_running')
"  set background=light "dark
"  colorscheme solarized
"else
"  colorscheme zenburn
"endif

"F8 key will toggle the Tagbar window
nmap <F8> :TagbarToggle<CR>
nmap <F6> :NERDTreeToggle<CR>

set clipboard=unnamed


" This sets the indent guides
"let g:indent_guides_guide_size = 1
"let g:indent_guides_color_change_percent = 3
"let g:indent_guides_enable_on_vim_startup = 1

let g:syntastic_python_pylint_post_args="--max-line-length=120"
