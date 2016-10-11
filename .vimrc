set shell=/bin/bash

" Auromatic reload of vimrc
autocmd! bufwritepost .vimrc source %

set showcmd

" Key remaps
" nmap <S-Enter> O<Esc>
nmap <CR> O<Esc>

"map <C-l> :tabn<CR>
"map <C-h> :tabp<CR>
"map <C-n> :tabnew<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'scrooloose/nerdtree'

Plugin 'klen/python-mode'

"Plugin 'davidhalter/jedi-vim'

call vundle#end()

" PyMode tweaks
"let ropevim_enable_shortcuts=1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0

let g:pymode_rope=1
set completeopt=menu
let g:pymode_trim_whitespaces = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_competion_bind = '<C-Space>'
let g:pymode_rope_autoimport = 0

filetype plugin indent on

inoremap jk <ESC>

set bs=2

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120 
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set term=xterm-256color

let mapleader = ","
let g:mapleader = ","

" Save and Quit shortcuts
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>

" Tabs navigation
map <leader>. <esc>:tabnew<cr>
map <leader>n <esc>:tabp<cr>
map <leader>m <esc>:tabn<cr>

" Navigating through splits
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader>l <c-w>l
map <leader>h <c-w>h

" Nerdtree tweaks
map <leader>` :NERDTreeToggle<CR>

" Remove highlights
map <leader>nh <esc>:noh<cr>

" Paste from outside
map <leader>p <esc>:set paste<cr>
map <leader>pp <esc>:set nopaste<cr>

" Copy word
map <leader>cw <esc>bye

" Indentation shortcuts in visual mode
vnoremap < <gv
vnoremap > >gv

filetype plugin indent on
syntax on

set number	" Show line numbers
set tw=79	" Width of doc
" set nowrap	" Don't automatically wrap on load
set colorcolumn=80
highlight ColorColumn ctermbg=25

"" vmap Q gq	" Automatically wrap paragraphs
"" nmap Q gqap

set history=700
set undolevels=700

" Real programmers don't use TABs ?! WTF! <Update: well yeah, some ppl do!>
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Dont fold lines
set nofoldenable
