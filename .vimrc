version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
" inoremap <D-BS>
" inoremap <M-BS>
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
nmap gx <Plug>NetrwBrowseX
noremap <M-Down> }
noremap <D-Down> <C-End>
noremap <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cfile>"),0)
vmap <BS> "-d
let &cpo=s:cpo_save
unlet s:cpo_save

execute pathogen#infect()

set t_ut= " improve screen clearing by using the background color
set background=dark
syntax enable
colorscheme molokai
set enc=utf-8
set term=screen-256color
let $TERM='screen-256color'

set guifont=Inconsolata-dz\ for\ Powerline:h12:cANSI
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set guitablabel=%M%t
set helplang=en
set langmenu=none
set mouse=a
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set termencoding=utf-8
set window=51
set visualbell
set nowrap
set hlsearch
set incsearch
set ignorecase
set number
set relativenumber
set cursorline
" set cursorcolumn
set wildmenu
set wildmode=list:longest,full
set smartindent
set textwidth=0
set wrapmargin=0
set shiftwidth=4
set tabstop=4
set textwidth=0
set wrapmargin=0
set backup
" set expandtab

filetype plugin on

""""" Set Leader key
let mapleader=" "

""""" Flip buffers
nmap <C-b> :b#<cr>

"""""" Syntax
syn on
let jsx_ext_required = 0

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

""""""" Markdown
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

"""""" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

"\ 'dir':  '\v[\/]\.(git|hg|svn|gitkeep|node_modules|_build|artifacts/build)$',

let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn|gitkeep)$|external|artifacts|build|documentation',
  \ 'file': '\v\.(exe|so|dll|log|gif|jpg|jpeg|png|psd|DS_Store|gitattributes)$'
  \ }
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
let g:ctrlp_max_files=1000000
let g:ctrlp_match_window = 'bottom,order:btt,min:40,max:40,results:40'

"""""
set iskeyword+=-

""""" Show trailing whitespace and spaces before a tab:
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

""""" Grep
map <Leader>g :grep -rniI --include=* <cword> .

""""" FSwitch
map <Leader>o :FSHere<cr>

""""" Show invisible characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
map <Leader>l :set list!<cr>

""""" CTags key map
nnoremap <c-j> <c-]>
nnoremap <c-k> <c-t>
nnoremap <c-h> :tp<cr>
nnoremap <c-l> :tn<cr>

 "vim: set ft=vim :
