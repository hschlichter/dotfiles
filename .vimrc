set nocompatible
filetype off

hi Search cterm=NONE ctermfg=white ctermbg=darkblue
hi Visual cterm=NONE ctermfg=white ctermbg=darkblue

call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mg979/vim-visual-multi'
Plug 'sainnhe/edge' " Color scheme
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'


call plug#end()

filetype plugin indent on    " required

set exrc " Load working dir vimrc, for project specific vimrc

" Colors
set t_ut= " improve screen clearing by using the background color
set background=dark
set signcolumn=yes
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1
colorscheme edge
syntax enable

hi Search cterm=NONE ctermfg=white ctermbg=darkblue
hi Visual cterm=NONE ctermfg=white ctermbg=darkblue

""""" Search
set hlsearch
set incsearch
set ignorecase

""""" Visual
set number
set relativenumber
set cursorline
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
if !has('nvim')
    set ttymouse=xterm2
endif
set mouse=a
set completeopt-=preview
set completefunc=LanguageClient#complete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:LanguageClient_changeThrottle = 0.5
let g:LanguageClient_useVirtualText = "No"
let g:LanguageClient_diagnosticsEnable = 0 

"""""" NERDTree
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
let g:airline_theme='bubblegum'

set laststatus=2
set ttimeoutlen=50

if executable('rg')
    set grepprg=rg\ --color=never
    let g:ackprg = 'rg --vimgrep --color=never'
endif

set iskeyword+=-

""""" Show invisible characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
nnoremap <Leader>l :set list!<cr>

"""""" Mappings
let mapleader=" "
""" Flip buffers
nnoremap <leader>bb :b#<cr>
nnoremap <leader>bd :bp\|bd#<cr>
nnoremap <leader>o :e %<.
""" tmux navigator
nnoremap <c-h> :TmuxNavigateLeft<cr>
nnoremap <c-j> :TmuxNavigateDown<cr>
nnoremap <c-k> :TmuxNavigateUp<cr>
nnoremap <c-l> :TmuxNavigateRight<cr>
""" Window/pane resizing
noremap <Down> :resize +5<CR>
noremap <Up> :resize -5<CR>
noremap <Right> :vertical:resize -5<CR>
noremap <Left> :vertical:resize +5<CR>
""" NERDTree
nmap <leader>nn :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>
""" fzf
nnoremap <c-p> :Files<cr>
nnoremap <c-b> :Buffers<cr>
nnoremap <c-t> :Tags<cr>
nnoremap <leader>pp :Files<cr>
nnoremap <leader>pb :Buffers<cr>
nnoremap <leader>pt :Tags<cr>
nnoremap <leader>fl :Lines<cr>
nnoremap <leader>fb :BLines<cr>
nnoremap <leader>ft :BTags<cr>
nnoremap <leader>rg :Rg <c-r><c-w>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

let g:fzf_layout = {'down': '40%'}
let g:fzf_preview_window = []

""" CTags key map
nnoremap <leader>j <c-]>
nnoremap <leader>k <c-t>
nnoremap <leader>js :exec("tselect /".expand("<cword>"))<cr>
nnoremap <leader><C-j> :exec("ptag ".expand("<cword>"))<cr>

""" Diff
nmap <leader>dn ]c
nmap <leader>dp [c

 "vim: set ft=vim :
