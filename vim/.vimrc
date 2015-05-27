set nocompatible
filetype off

" ------------------- VUNDLE START
"
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
" To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
"
" ------------------- VUNDLE END


" ------------------- NERDTree START
"
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
"
" ------------------- NERDTree END
