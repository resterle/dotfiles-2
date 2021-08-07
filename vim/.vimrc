set nocompatible              " be iMproved, required
filetype off                  " required

" Plugins with vim-plug
call plug#begin('~/.vim/plugged')

" Nerdtree
" nedtree
Plug 'preservim/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-scripts/indentpython.vim'
Plug 'vim-syntastic/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Scala
Plug 'neoclide/coc.nvim'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'


" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

" No temp files for gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

" ===========================================================

nmap ,n :NERDTreeTabsToggle<CR>
nmap ,f :NERDTreeFind<CR>
nmap ,c :NERDTreeMapChdir<CR>
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" line numbers
:set nu

" no tabs
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

" move editor tabs
nmap gm :tabm +1<CR>
nmap gM :tabm -1<CR>

" show hidden chars
set list
set listchars=tab:›\ ,eol:↲,trail:⋅

filetype on

" switch between buffers
:nmap <tab> <C-w>w
:nmap <S-tab> <C-w>W

set encoding=utf-8

" autocomplete
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

au User asyncomplete_setup call asyncomplete#register_source({
    \ 'name': 'alchemist',
    \ 'whitelist': ['elixir'],
    \ 'completor': function('asyncomplete#sources#elixir#completor'),
    \ 'config': { },
    \ })
