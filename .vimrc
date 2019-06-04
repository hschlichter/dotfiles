set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'git://github.com/christoomey/vim-tmux-navigator.git'
Plugin 'git://github.com/vim-airline/vim-airline.git'
Plugin 'git://github.com/ctrlpvim/ctrlp.vim.git'
Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'git://github.com/tomtom/tcomment_vim.git'
Plugin 'git://github.com/tpope/vim-repeat.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/tpope/vim-dispatch.git'
Plugin 'git://github.com/sheerun/vim-polyglot.git'
Plugin 'git://github.com/editorconfig/editorconfig-vim.git'
Plugin 'git://github.com/mileszs/ack.vim.git'
Plugin 'git://github.com/benmills/vimux.git'
Plugin 'git://github.com/bfrg/vim-cpp-modern.git'

" Color schemes
Plugin 'git://github.com/spf13/vim-colors.git'

" Required. Plugins available after
call vundle#end()            " required
filetype plugin indent on    " required



set exrc " Load working dir vimrc, for project specific vimrc

" Colors
set t_ut= " improve screen clearing by using the background color
set background=dark
syntax enable
colorscheme molokai

""""" Search
set hlsearch
set incsearch
set ignorecase

""""" Visual
set number
set relativenumber
set cursorline
" set cursorcolumn
set visualbell

""""" Formatting
set smartindent
set textwidth=0
set wrapmargin=0
set shiftwidth=4
set tabstop=4
set textwidth=0
set wrapmargin=0
set nowrap
set expandtab
set backspace=indent,eol,start
set hidden

""""" Misc
set wildmenu
set wildmode=list:longest,full
set backup
set mouse=a
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set lazyredraw
set ttyfast
set cpt=.,w,b
set splitbelow
set ttymouse=xterm2
set mouse=a

""""" Set Leader key
let mapleader=" "

""""" Flip buffers
nmap <leader>bb :b#<cr>
nmap <leader>bd :bp\|bd#<cr>

"""""" tmux navigator
nnoremap <c-h> :TmuxNavigateLeft<cr>
nnoremap <c-j> :TmuxNavigateDown<cr>
nnoremap <c-k> :TmuxNavigateUp<cr>
nnoremap <c-l> :TmuxNavigateRight<cr>

"""""" NERDTree
nmap <leader>n :NERDTreeToggle<cr>
let NERDTreeShowHidden=1

"""""" File specific options
autocmd BufRead,BufNewFile *.yml set tabstop=2
autocmd BufRead,BufNewFile *.yml set shiftwidth=2
autocmd BufRead,BufNewFile * set shiftwidth=4
autocmd BufRead,BufNewFile * set tabstop=4
autocmd BufRead,BufNewFile *.jam set syntax=OFF

""""""" Airline
let g:airline#extensions#tabline#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" nnoremap <Left> :bp<cr>
" nnoremap <Right> :bn<cr>
" nnoremap <Down> :bd<cr>
set laststatus=2
set ttimeoutlen=50

"""""" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
if executable('ag')
    g:ctrlp_user_command = 'ag -l --nocolor -i -g ""'
endif
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:40,results:40'
let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
" let g:ctrlp_lazy_update = 1
" nnoremap <cs-p> :CtrlPBuffer<cr>

"""""
set iskeyword+=-

""""" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

""""" Searching
map <Leader>a :Ack! <cword>

""""" Show invisible characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
map <Leader>l :set list!<cr>

""""" CTags key map
nnoremap <leader>j <c-]>
nnoremap <leader>k <c-t>
nnoremap <leader><C-j> :15sp<cr>:exec("tag ".expand("<cword>"))<cr>

""""" Common Vimux commands
nnoremap <leader>gd :call VimuxRunCommand("git diff " . @%)<cr>
nnoremap <leader>db :VimuxRunCommand("b ".@%.":".line("."))<cr>

""""" Ag - Silver searcher
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

""""" Go to file without different extension
nnoremap <leader>o :e %<.

""""" C/C++ highlighting
let g:cpp_no_function_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1

 "vim: set ft=vim :
