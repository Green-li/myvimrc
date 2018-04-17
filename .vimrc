set nocompatible              " be iMproved, required
filetype off                  " required

" display row number
set nu

"set charset
set encoding=utf-8

" split areas
set splitbelow
set splitright
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding by space key
nnoremap <space> za

" set PEP8 python indent
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 | 
\ set expandtab |
\ set autoindent |
\ set fileformat=unix

"display unseen char
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

"key to open nerdtree
map <C-n> :NERDTreeToggle<CR>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/home/mlli6/workspace/vimplugins')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
"
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview=1

"auto indent plugin
Plugin 'vim-scripts/indentpython.vim'

" systastic code highlight
Plugin 'scrooloose/syntastic'

" systastic code highlight for PEP8
Plugin 'nvie/vim-flake8'
let python_highlight_all=1
syntax on

"set colors plugin
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

"call togglebg#map("<F5>")

" set files tree plugin
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
"ignore these files
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" share NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>


" set status bar
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"python auto complete 
"Bundle 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'

" plugin for search
Plugin 'kien/ctrlp.vim'

call vundle#end()            " required
" "
