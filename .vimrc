if has("unix")
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        let s:OS = "OSX"
        set clipboard+=unnamed  " use the clipboards of vim on win
    else
        let s:OS = "linux"
        set clipboard=unnamedplus
    endif
else
    let s:OS = "windows"
    set clipboard+=unnamed  " use the clipboards of vim on win
endif
" copy and paste
" ruler
let &colorcolumn="80,".join(range(120,999),",")
let &winheight = &lines * 7 / 10
let &winwidth = &columns * 7 / 10



syntax on                   "highlight syntax
syntax enable               "same as above
set nu                      "monitor the line number
set expandtab               "以space取代tab
set cursorline              "monitor the cursor location
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
set softtabstop=0
set fileencodings=utf-8,ucs-bom,big5,cp936,gb18030,gb2312,euc-jp,euc-kr,latin1
set synmaxcol=500

"auto syntax
"inoremap ( ()<Esc>i
"inoremap " ""<Esc>i
"inoremap ' ''<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i
"inoremap {<CR> {<CR>}<Esc>ko<tab>
"inoremap {<CR> {<CR>}<Esc>ko
filetype indent on          "indent according file format

augroup files
    autocmd!
    autocmd FileType html,javascript setlocal shiftwidth=2 tabstop=2
    autocmd FileType python,php,c,cpp,java setlocal expandtab shiftwidth=4 softtabstop=4
augroup END
"autocmd FileType python,c,cpp,java,php autocmd BufWritePre <buffer> %s/\s\+$//e
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <silent> <leader>s :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
augroup trim_space
    autocmd!
    autocmd FileType c,cpp,java,php,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END
function Hardmode()
    map <Left> <Nop>
    map <Right> <Nop>
    map <Up> <Nop>
    map <Down> <Nop>
    "imap <Left> <Nop>
    "imap <Right> <Nop>
    imap <Up> <Nop>
    imap <Down> <Nop>
    imap <BS> <Nop>
    imap <Del> <Nop>
    inoremap <C-k> <C-o>gk
    inoremap <C-h> <Left>
    inoremap <C-l> <Right>
    inoremap <C-j> <C-o>gj
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l
    nnoremap <C-j> <C-w>j
endfunction

function Easymode()
    silent! unmap <Right>
    silent! unmap <Left>
    silent! unmap <Up>
    silent! unmap <Down>
    silent! unmap <BS>
    silent! unmap <Del>
    silent! iunmap <Right>
    silent! iunmap <Left>
    silent! iunmap <Up>
    silent! iunmap <Down>
    silent! iunmap <BS>
    silent! iunmap <Del>
    nnoremap <M-h> 5h
    nnoremap <M-j> 5j
    nnoremap <M-k> 5k
    nnoremap <M-l> 5l
    inoremap <M-h> <Left>
    inoremap <M-j> <Down>
    inoremap <M-k> <Up>
    inoremap <M-j> <Right>
    "noremap <S-Right> <c-w>l
    "noremap <S-Left> <c-w>h
    "noremap <S-Up> <c-w>k
    "noremap <S-Down> <c-w>j
    "inoremap <S-Right> <ESC><c-w>l
    "inoremap <S-Left> <ESC><c-w>h
    "inoremap <S-Up> <ESC><c-w>k
    "inoremap <S-Down> <ESC><c-w>jnoremap <C-l> :tabn<CR>
    "noremap <C-h> :tabp<CR>
endfunction
call Easymode()
inoremap jk <esc>
noremap <S-l> :tabn<CR>
noremap <S-h> :tabp<CR>
noremap <leader><S-e> :tabnew<CR>
noremap <S-e> :tabclose<CR>
"noremap <S-Right> :tabn<CR>
"noremap <S-Left> :tabp<CR>

"terminal
"noremap <C-q> :sh<cr>
noremap <C-a> :term<cr>

"set the vim plugin

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if has('nvim') && empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'benekastah/neomake'
endif

Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
"Plug 'kien/tabman.vim'
"Plug 'honza/vim-snippets'
"Plug 'vim-scripts/mru.vim'
Plug 'mhinz/vim-startify'
Plug 'kshenoy/vim-signature'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-capslock'

call plug#end()
"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

"NERDTREE
map <C-p> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMapOpenInTab='<ENTER>'
let g:solarized_termcolors=256
"set background=light
set background=dark
colorscheme solarized


