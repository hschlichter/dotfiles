execute pathogen#infect()

filetype plugin on

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
" set expandtab
set textwidth=0
set wrapmargin=0
set nowrap
set backspace=indent,eol,start

""""" Misc
set wildmenu
set wildmode=list:longest,full
set backup
set mouse=a
set backupdir=~/.vim/backup
set directory=~/.vim/backup

""""" Set Leader key
let mapleader=" "

""""" Flip buffers
nmap <leader>b :b#<cr>

"""""" Syntax
syn on
let jsx_ext_required = 0

"""""" tmux navigator
nnoremap <c-h> :TmuxNavigateLeft<cr>
nnoremap <c-j> :TmuxNavigateDown<cr>
nnoremap <c-k> :TmuxNavigateUp<cr>
nnoremap <c-l> :TmuxNavigateRight<cr>

"""""" NERDTree
nmap <leader>n :NERDTreeToggle<cr>
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

"""""" File specific options
autocmd BufRead,BufNewFile * set noexpandtab
autocmd BufRead,BufNewFile *.elm *.ex *.exs set expandtab
autocmd BufRead,BufNewFile *.yml set expandtab
autocmd BufRead,BufNewFile *.yml set tabstop=2
autocmd BufRead,BufNewFile *.yml set shiftwidth=2
autocmd BufRead,BufNewFile * set shiftwidth=4
autocmd BufRead,BufNewFile * set tabstop=4
autocmd BufRead,BufNewFile *.jam set syntax=OFF

""""""" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
nnoremap <Left> :bp<cr>
nnoremap <Right> :bn<cr>
nnoremap <Down> :bd<cr>
set laststatus=2
set ttimeoutlen=50

"""""" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:40,results:40'

"""""
set iskeyword+=-

""""" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

""""" Searching
map <Leader>g :grep -rniI --include=* <cword> .

if executable('ag')
	let g:ackprg = 'ag --vimgrep'
endif
map <Leader>a :Ack! <cword>

""""" Show invisible characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
map <Leader>l :set list!<cr>

""""" CTags key map
nnoremap <leader>j <c-]>
nnoremap <leader>k <c-t>

 "vim: set ft=vim :
