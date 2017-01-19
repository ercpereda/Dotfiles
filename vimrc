" Vundle config
set nocompatible
filetype off

" runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" core plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'

" main plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" All plugins must be added before the following line
call vundle#end()

" ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim

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

" crosshairs
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235
nnoremap x :set cursorline! cursorcolumn!
