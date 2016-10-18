set shell=/bin/bash

" Auromatic reload of vimrc
"autocmd! bufwritepost .vimrc source %

set showcmd
set nocompatible
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tmhedberg/SimpylFold'

call vundle#end()

" Leader key
"let mapleader = " "
"let g:mapleader = " "
map <SPACE> <leader>

"" Nerdtree tweaks
map <leader>` :NERDTreeToggle<CR>

"" YouCompleteMe setup
let g:ycm_autoclose_preview_window_after_completion = 1
" Show preview window of YouCompleteMe at the bottom
set splitbelow

"" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set term=xterm-256color

" SimpylFold setup
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
"Required by SimpylFold
"autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
"autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<
" -----------Plugin config end----------------


" Filetype based indentation
" This command will use indentation scripts located in the 
" indent folder of the vim installation.
filetype plugin indent on

" To use Vim color scheme
syntax on

" Remap ESC key with jk
inoremap jk <ESC>

" Show line numbers
set number

" New line in normal mode
nmap <CR> O<Esc>

" Move the cursor over automatically inserted indents and 
" over the start/end of line
set bs=2

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END

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

" Remove highlights
map <leader>nh <esc>:noh<cr>

" Paste from outside
" Automatically switch to and from paste mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
      set pastetoggle=<Esc>[201~
        set paste
          return ""
      endfunction

" Copy word
map <leader>cc <esc>bye

" Indentation shortcuts in visual mode
vnoremap < <gv
vnoremap > >gv

" Set width of doc; use if want to wrap automatically
"set tw=79

" Don't automatically wrap on load
"set nowrap

" Wrap, but not on a new line
set wrap linebreak nolist

" Set width and color indicators
set colorcolumn=80
highlight ColorColumn ctermbg=25

"" vmap Q gq	" Automatically wrap paragraphs
"" nmap Q gqap

set history=700
set undolevels=700

" Tabs replaced with 4 spaces
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
