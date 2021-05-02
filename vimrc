packadd minpac
call minpac#init()

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('tpope/vim-dispatch')
call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
call minpac#add('junegunn/fzf.vim')
call minpac#add('w0rp/ale')
call minpac#add('flazz/vim-colorschemes')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('tpope/vim-fugitive')

" general setup
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


" ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:50'
let g:ctrlp_custom_ignore = '\v[\/](\.git|node_modules|\.sass-cache|bower_components|build|_build|deps|dist|doc|Pods|unity|UnityExport)$'

" vim-colorschemes setup
colorscheme molokai

" vim-airline setup
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2


filetype plugin indent on
syntax on
" show existing tab with 2 spaces width
set tabstop=2
" when indent with '>', use 2 spaces width
set shiftwidth=2
" on pressing tab, insert 2 spaces
set expandtab

" keybindings
nmap ; :
let mapleader = "\<Space>"
vnoremap // y/<C-R>"<CR>"
nnoremap <Leader>p :set invpaste<CR>
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind µ to sort the comma separates words on selection
" xnoremap z s<c-r>=join(sort(split(@", '\s*,\s*')), ', ')<cr><esc>

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
"map <Leader>l <Plug>(easymotion-lineforward)
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
" map <Leader>h <Plug>(easymotion-linebackward)
" let g:EasyMotion_startofline = 0

" vim-go setup
let g:go_fmt_command = "goimports"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

" ale 
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_javascript_prettier_options = '--no-bracket-spacing --single-quote --trailing-comma es5'
let g:airline#extensions#ale#enabled = 1

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
