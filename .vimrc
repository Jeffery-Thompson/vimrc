set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'nvie/vim-flake8'

" ...

" set splitbelow
" set 200splitright
"set 80 vsplit
"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable code folding
set foldmethod=indent
set foldlevel=99

" add proper PEP8 indentation
" au BufNewFile,BufRead *.py,*.ipynb set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix 
au BufNewFile,BufRead *.py,*.ipynb,*.sh :
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\set autoindent |
	\set fileformat=unix 
" Flag unnecessary whitespace
" highlight BadWhitespace ctermbg=red guibg=darkred
" au BufRead,BufNewFile *.py,*.pyw,*.ipynb,*.c,*.h, match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/

" Set UTF-8 for Python3
set encoding=utf-8

" logic to test what version of VIM, and load Plugin accordingly
"if has('gui_running')
" Use solarized as the colorscheme for vim; seems to work ok
" 	zenburn has trouble on os X
"if has('gui_running')
   set background=dark
   let g:solarized_termtrans = 1 " This gets rid of the grey background
   colorscheme solarized
"else
  "colorscheme Zenburn
"   set t_Co=256
"   colors zenburn
" endif

" turn line numbering on
set nu

" commands for NERDTree to start automatically
autocmd vimenter * NERDTree

" help make python code look nice
let python_highlight_all=1
syntax on

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
