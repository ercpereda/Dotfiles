" Vundle config
set nocompatible
filetype off

" runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set guifont=DejaVu\ Sans:s12

" core plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'wikitopian/hardmode'
Plugin 'tmhedberg/SimpylFold'

" main plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sonph/onehalf', { 'rtp': 'vim' }

" Other plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jreybert/vimagit'
Plugin 'junegunn/vim-easy-align'
" Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'

" Languages
Plugin 'sheerun/vim-polyglot'
" Plugin 'fatih/vim-go'
Plugin 'elixir-editors/vim-elixir'
Plugin 'slashmili/alchemist.vim' " elixir
Plugin 'w0rp/ale'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ycm-core/YouCompleteMe'

" All plugins must be added before the following line
call vundle#end()

" general setup
set encoding=utf-8
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set ruler         " show the cursor position all the time
set number
set relativenumber
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
"" Flaggin unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,bufNewFile * match BadWhitespace /\s\+$/ 


" ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:50'
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build|_build|deps|dist|doc|Pods|unity|UnityExport)$'

" simpyfold setup
let g:SimpylFold_docstring_preview=1

" vim-colorschemes setup
colorscheme onehalfdark

" vim-airline setup
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2


filetype plugin indent on
syntax on
" show existing tab with 2 spaces width
set tabstop=4
" when indent with '>', use 2 spaces width
set shiftwidth=4
" on pressing tab, insert 2 spaces
set expandtab

" keybindings
nmap ; :
let mapleader = "\<Space>"
vnoremap // y/<C-R>"<CR>"
nnoremap <Leader>p :set invpaste<CR>
"" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
"" bind µ to sort the comma separates words on selection
""" xnoremap z s<c-r>=join(sort(split(@", '\s*,\s*')), ', ')<cr><esc>
"" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" Replace by base 64 selection
vnoremap <leader>e64 y:let @"=system('base64', @")<cr>gvp
vnoremap <leader>d64 y:let @"=system('base64 --decode', @")<cr>gvp

" Enable folding
set foldmethod=indent
set foldlevel=99

" crosshairs
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
nnoremap <Leader>x :set cursorline! cursorcolumn!

" the silver searcher
if executable('ag') " Use ag over grep set grepprg=ag\ --nogroup\ --nocolor " Use ag in CtrlP for listing files let g:ctrlp_client_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  " bind \ to grep shorcut
  "command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  nnoremap \ :Ag<SPACE>
endif

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
"" open by default  if you started vim no command line arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"" open/close
map <Leader>n :NERDTreeToggle<CR>
"" open/close in the file you are editing
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
"" close after open file
let NERDTreeQuitOnOpen = 1
"" close the tab if is the only remaining windoow
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"" automatically deletes de bufer of the file you just delete in nerdtree
let NERDTreeAutoDeleteBuffer = 1


" easymotion setup
" map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
" let g:EasyMotion_startofline = 0

" vim-go setup
" let g:go_fmt_command = "goimports"
" map <C-n> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>
" 
" autocmd FileType go nmap <leader>b <Plug>(go-build)
" autocmd FileType go nmap <leader>r <Plug>(go-run)
" autocmd FileType go nmap <leader>t <Plug>(go-test)
" autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" ale 
"" ale global setup.
let g:airline#extensions#ale#enabled = 1
"" ale fixers
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_javascript_prettier_options = '--no-bracket-spacing --single-quote --trailing-comma es5'
let g:ale_fixers['python'] = ['black', 'isort'] 

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <leader>f <Plug>(ale_fix)

" vim markdown setup
let g:vim_markdown_folding_disabled = 1

" elixir setup
autocmd BufWritePost *.exs silent :!mix format %
autocmd BufWritePost *.ex silent :!mix format %

" hardmode setup
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" youcompleteme setup
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Ack setup
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" vim-easy-align setup
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
