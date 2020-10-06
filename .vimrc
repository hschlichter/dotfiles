set nocompatible
filetype off

hi Search cterm=NONE ctermfg=white ctermbg=darkblue
hi Visual cterm=NONE ctermfg=white ctermbg=darkblue

call plug#begin()
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'sainnhe/edge' " Color scheme
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'benmills/vimux'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/deoplete-clangx'
  let g:deoplete#enable_at_startup = 1
endif

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

""""" Show trailing whitespace and spaces before a tab:
" highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\\t/

""""" Show invisible characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

let g:cpp_no_function_highlight = 1
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1

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

""" CTags key map
nnoremap <leader>j <c-]>
nnoremap <leader>k <c-t>
" nnoremap <leader><C-j> :15sp<cr>:exec("tag ".expand("<cword>"))<cr>
nnoremap <leader><C-j> :exec("ptag ".expand("<cword>"))<cr>
""" Unity specific commands
nnoremap <leader>ub :VimuxRunCommand("unity_build_editor_debug")<cr>
nnoremap <leader>ur :VimuxRunCommand("unity_run_editor")<cr>
nnoremap <leader>ud :VimuxRunCommand("unity_debug_editor")<cr>
""" misc
nnoremap <Leader>l :set list!<cr>
nnoremap <leader>db :VimuxRunCommand("b ".@%.":".line("."))<cr>
""" CtrlSF
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
let g:ctrlsf_winsize = '30%'

let g:LanguageClient_serverStderr = '/tmp/clangd.stderr'
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['gopls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'cpp': ['/usr/local/Cellar/llvm/9.0.1/bin/clangd'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

 "vim: set ft=vim :
