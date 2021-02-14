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

" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

# No temp files for gopass
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

" scala config
autocmd FileType json syntax match Comment +\/\/.\+$+

au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Notify coc.nvim that <enter> has been pressed.
" " Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
 nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
