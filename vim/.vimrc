set nocompatible
filetype off

" ---
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" -----------------------------------------------------------
" Your plugins goes here
"
Plugin 'moll/vim-node'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Vim ConqueShell (shell in Vim)
Plugin 'nicoraffo/conque'

" -----------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ---
" NERDTree settings
let g:nerdtree_tabs_open_on_console_startup=1

" ---
" ConqueShell Help
" Type :ConqueTerm <command> to run your command in vim, for example: 
":ConqueTerm bash 
":ConqueTerm mysql -h localhost -u joe -p sock_collection 
":ConqueTerm Powershell.exe 
":ConqueTerm C:\Python27\python.exe 
"To open ConqueTerm in a new horizontal or vertical buffer use: 
":ConqueTermSplit <command> 
":ConqueTermVSplit <command> 
":ConqueTermTab <command> 
