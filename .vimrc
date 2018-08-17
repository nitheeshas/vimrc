set shell=/bin/bash

" Auromatic reload of vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end

set showcmd
set nocompatible
filetype off

" To use Vim color scheme
syntax on
"colorscheme nighted
"colorscheme goodwolf

" Toggle vim color scheme
:map <F12> :if exists("g:syntax_on") <Bar>
        \   syntax off <Bar>
        \ else <Bar>
        \   syntax enable <Bar>
        \ endif <CR>

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'funorpain/vim-cpplint'
Plugin 'majutsushi/tagbar',                   { 'on': 'TagbarToggle' }
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rdnetto/YCM-Generator'
Plugin 'tpope/vim-fugitive'
"Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'

call vundle#end()

nnoremap <leader>b :CtrlPTag<cr>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vnew <CR>:exec("tag ".expand("<cword>"))<CR>

let g:easytags_async = 1
"let g:easytags_syntax_keyword = 'always'
"let g:easytags_by_filetype = '~/.vim/tags'
"let g:easytags_auto_update = 0
"let g:easytags_on_cursorhold = 0

" Leader key
"let mapleader = " "
"let g:mapleader = " "
map <SPACE> <leader>

"" Nerdtree tweaks
map <leader><Tab> :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

"" Syntastic setup
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" YouCompleteMe setup
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1

"" Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set term=xterm-256color

" SimpylFold setup
let g:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0
"Required by SimpylFold
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" CppLint setup
"autocmd BufWritePost *.h,*.cpp call Cpplint()

" tagbar
let g:tagbar_autofocus=0
let g:tagbar_compact=1
let g:tagbar_right=1
let g:tagbar_width=35
"nnoremap <silent> <Leader>b :TagbarToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Fugitive
map <leader>df :Gdiff<CR>
" -----------Plugin config end----------------

nnoremap <leader>r :call QuickfixToggle()<cr>

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
    else
        copen
        let g:quickfix_is_open = 1
    endif
endfunction

"nnoremap rj :lnext<CR>
"nnoremap rk :lprev<CR>

" Venv <venv> to activate and restart YCM server
" Function to list virtualenvs
:function! ReturnVirtualEnvsList(A,L,P)
:    return system("ls -d ~/.virtualenvs/*/ \| cut -d'/' -f5")
:endfunction
" changing virtualenv should restart ycmserver
:command! -nargs=+ -complete=custom,ReturnVirtualEnvsList Venv :VirtualEnvActivate <args> | YcmRestartServer

" Filetype based indentation
" This command will use indentation scripts located in the
" indent folder of the vim installation.
filetype plugin indent on

" Remap ESC key with jk
inoremap jk <ESC>

" Show line numbers
set number

" New line in normal mode
nmap <CR> O<Esc>

" Move the cursor over automatically inserted indents and
" over the start/end of line
set bs=2

" Find tags recursively
set tags=tags;

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
nmap <leader>wq :wq<cr>
nmap <leader>qa :qall<cr>

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

" Fold/Unfold toggle
map <leader><Space> <esc>za<esc>

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
set colorcolumn=120
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

set sidescrolloff=3             " Keep at least 3 lines left/right

" Splits
set splitbelow
set splitright

" Make completion menu behave like an IDE
set completeopt=longest,menuone,preview

" Typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

" Save file which you forgot to open with sudo
cnoremap w!! w !sudo tee % >/dev/null

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Remove whitespaces automatically
"autocmd BufWritePre * %s/\s\+$//e

" Set window width to 120 on pressing <F9>
nnoremap <F9> :vertical resize 31:set winfixwidth<CR>
nnoremap <F10> :vertical resize 120:set winfixwidth<CR>
