"set the vim plugin

let vim_plug_just_installed = 0
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  vim_plug_justinstalled = 1
endif

if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin('~/.vim/plugged')

Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'kien/tabman.vim'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/mru.vim'
Plug 'kshenoy/vim-signature'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'

call plug#end()
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'


map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'


" navigate windows with meta(alt)+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

"auto syntax
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>ko<tab>
"inoremap {<CR> {<CR>}<Esc>ko

" ruler
let &colorcolumn="80,".join(range(120,999),",")
" copy and paste
"set clipboard+=unnamed  " use the clipboards of vim on win
set clipboard=unnamedplus

syntax on                   "highlight syntax
syntax enable               "same as above
set nu                      "monitor the line number
set expandtab               "以space取代tab
set cursorline              "monitor the cursor location
set bg=dark                 "avoid losing comment syntax
set ruler                   "monitor 行,列 目前在文件的位置
set hlsearch                "highlight the search result設定高亮顯示搜尋結果
set confirm                 "ask when there is conflit
set history=50
set incsearch               "monitor fit tip
set cindent                 "C/C++ auto indent
set smartindent
set shiftwidth=4
set tabstop=4
set smarttab
set mouse=a                 "let mouse to visual

let g:solarized_termcolors=256
set background=light
"set background=dark
colorscheme solarized


filetype indent on          "indent according file format

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
