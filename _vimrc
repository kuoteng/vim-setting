"==set the plugin
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'kien/ctrlp.vim'
Plug 'plasticboy/vim-markdown'

"theme
Plug 'romainl/Apprentice'
Plug 'vim-airline/vim-airline'
Plug 'fugalh/desert.vim'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

" Add plugins to &runtimepath
call plug#end()



syntax on                   "highlight syntax
syntax enable               "same as above
set nu                      "monitor the line number
set tabstop=4
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
filetype indent on          "indent according file format

colorscheme apprentice
"hot key
map <C-n> :NERDTreeToggle<CR>
"auto syntax
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko<tab>
