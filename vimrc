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
set history=1000
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
    autocmd FileType c,cpp,java set mps+==:;
augroup END
let mapleader = ","
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <silent> <leader>s :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
augroup trim_space
    autocmd!
    autocmd FileType c,cpp,java,php,javascript autocmd BufWritePre <buffer> %s/\s\+$//e
augroup END
function! Hardmode()
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
    if s:OS == "OSX"
        nnoremap <Esc>h 5h
        nnoremap <Esc>j 5j
        nnoremap <Esc>k 5k
        nnoremap <Esc>l 5l
        inoremap <Esc>h <Left>
        inoremap <Esc>j <Down>
        inoremap <Esc>k <Up>
        inoremap <Esc>l <Right>
        vnoremap <Esc>h <Left>
        vnoremap <Esc>j <Down>
        vnoremap <Esc>k <Up>
        vnoremap <Esc>l <Right>
    else
        nnoremap <M-h> 5h
        nnoremap <M-j> 5j
        nnoremap <M-k> 5k
        nnoremap <M-l> 5l
        inoremap <M-h> <Left>
        inoremap <M-j> <Down>
        inoremap <M-k> <Up>
        inoremap <M-l> <Right>
    endif
    "inoremap <C>k <C-o>gk
    "inoremap <C>h <Left>
    "inoremap <C>l <Right>
    "inoremap <C>j <C-o>gj
    "nnoremap <C>k <C-w>k
    "nnoremap <C>h <C-w>h
    "nnoremap <C>l <C-w>l
    "nnoremap <C>j <C-w>j
endfunction

function! Easymode()
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
    if s:OS == "OSX"
        nnoremap <Esc>h 3h
        nnoremap <Esc>j 3j
        nnoremap <Esc>k 3k
        nnoremap <Esc>l 3l
        inoremap <Esc>h <Left>
        inoremap <Esc>j <Down>
        inoremap <Esc>k <Up>
        inoremap <Esc>l <Right>
    else
        nnoremap <M-h> 5h
        nnoremap <M-j> 5j
        nnoremap <M-k> 5k
        nnoremap <M-l> 5l
        inoremap <M-h> <Left>
        inoremap <M-j> <Down>
        inoremap <M-k> <Up>
        inoremap <M-l> <Right>
    endif
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
inoremap jk <Esc>
noremap <S-l> :tabn<CR>
noremap <S-h> :tabp<CR>
noremap <leader><S>e :tabnew<CR>
noremap <leader>c :tabclose<CR>
"use Shift_p to multi paste (copy same text after paste)
xnoremap <S-p> pgvy
"use Ctrl_o instead
"inoremap <Esc>x <Del>
"inoremap <M-x> <Del>
"inoremap <Esc>X <Esc>Xa
"inoremap <M-X> <Esc>Xa
"noremap <S-Right> :tabn<CR>
"noremap <S-Left> :tabp<CR>

"terminal
"noremap <C-q> :sh<cr>
noremap <C-a> :term<cr>

" nvim python3 configure
let g:python3_host_prog='~/.pyenv/versions/nvim-3.8.5/bin/python3.8'
let g:node_host_prog='~/.nodenv/versions/15.8.0/bin/neovim-node-host'
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

" search
if !empty(glob(g:python3_host_prog))
    Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
    let g:Lf_WindowPosition = 'popup'
    let g:Lf_PreviewInPopup = 1
    let g:Lf_ShortcutF = "<leader>ff"
endif    

let g:coc_global_extensions = [
    \'coc-json', 
    \'coc-git',
    \'coc-html',
    \'coc-highlight',
    \'coc-explorer',
    \'coc-pyright',
    \'coc-pairs'
\]
if empty(glob(g:node_host_prog))
    Plug 'scrooloose/nerdtree'
    map <C-p> :NERDTreeToggle<CR>
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
    let NERDTreeWinPos="right"
    let NERDTreeShowHidden=1
    let NERDTreeMapOpenInTab='<ENTER>'
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    nnoremap <C-p> :CocCommand explorer<CR>
    nnoremap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
    let g:coc_explorer_global_presets = {
                \   '.vim': {
                \     'root-uri': '~/.vim',
                \   },
                \   'cocConfig': {
                \      'root-uri': '~/.config/coc',
                \   },
                \   'tab': {
                \     'position': 'tab',
                \     'quit-on-open': v:true,
                \   },
                \   'floating': {
                \     'position': 'floating',
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'floatingTop': {
                \     'position': 'floating',
                \     'floating-position': 'center-top',
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'floatingLeftside': {
                \     'position': 'floating',
                \     'floating-position': 'left-center',
                \     'floating-width': 50,
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'floatingRightside': {
                \     'position': 'floating',
                \     'floating-position': 'right-center',
                \     'floating-width': 50,
                \     'open-action-strategy': 'sourceWindow',
                \   },
                \   'simplify': {
                \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                \   },
                \   'buffer': {
                \     'sources': [{'name': 'buffer', 'expand': v:true}]
                \   },
                \ }
    nnoremap <Leader><C-p> :CocCommand explorer --preset floating<CR>
endif

if has('nvim')
    Plug 'lambdalisue/suda.vim'
endif

Plug 'mhinz/vim-startify'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'jiangmiao/auto-pairs'
"Plug 'luochen1990/rainbow'
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
Plug 'mileszs/ack.vim'
Plug 'vimwiki/vimwiki'
"Plug 'tpope/vim-capslock'

call plug#end()
"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

let g:solarized_termcolors=256
"set background=light
set background=dark
colorscheme solarized
"ack
if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

let g:Lf_ShortcutF = '<leader>ff'
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }
"augroup show_sapces
"    autocmd!
"    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"augroup END
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

let g:rainbow_active = 1
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
