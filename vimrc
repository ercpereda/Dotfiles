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

" All plugins must be added before the following line
call vundle#end()

" ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim

" vim-colorschemes setup
colorscheme molokai

filetype plugin indent on
syntax on
" show existing tab with 2 spaces width
set tabstop=2
" when indent with '>', use 2 spaces width
set shiftwidth=2
" on pressing tab, insert 2 spaces
set expandtab
