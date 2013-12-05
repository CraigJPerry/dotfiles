""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Craig's vimrc (with Vundle version)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Install a powerline font https://github.com/Lokaltog/powerline-fonts
" Install dependencies:
"    sudo yum -y install git vim-enhanced pylint python-pep8 python-jedi
"    (non-root) pip install --user pylint pep8 jedi
" mkdir -p ~/.vim/bundle
" git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
" vim +BundleInstall +qall
 

let mapleader=','
 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle (Package Manager) Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles Go Here...
Bundle 'Lokaltog/vim-easymotion'

Bundle 'bling/vim-airline'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
set ttimeoutlen=50
set ambiwidth=double

Bundle 'flazz/vim-colorschemes'
colorscheme Monokai

" Requires vim compiled with python
Bundle 'SirVer/ultisnips'

Bundle 'scrooloose/syntastic'

Bundle 'tpope/vim-surround'

Bundle 'davidhalter/jedi-vim'

Bundle 'neilhwatson/vim_cf3'
au BufRead,BufNewFile *.cf set filetype=cf3
au BufRead,BufNewFile *.cfe set filetype=cf3
au BufRead,BufNewFile *.cf normal zR
au BufRead,BufNewFile *.cfe normal zR
let EnableCFE3KeywordAbbreviations=1

Bundle 'scrooloose/nerdcommenter'

Bundle 'mhinz/vim-signify'

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Vundle (Package Manager) Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General High Level Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nomodeline " History of successful attacks against vim modelines :-(
set encoding=utf8

" No annoying filename~ files left around
set nobackup
set nowritebackup

set history=100

" Allow hidden buffers, don't close a buffer just because it's offscreen
set hidden

" Never use tab chars, always use spaces instead
set expandtab

" Round the number of spaces inserted to the nearest "tabstop"
set smarttab
set tabstop=4
set shiftwidth=4
set shiftround
set softtabstop=4

set nowrap " Don't wrap the display of long lines by default
set textwidth=0 " Don't automatically wrap text as i write it
set formatoptions=croq textwidth=72 " But do wrap comments as i write them
set smartcase " Case insensitive search unless a capital is in the search term
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End General High Level Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface / View Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable 256 colours with PuTTY
if &term =~ "xterm"
  let &t_Co=256
endif
syntax on

set laststatus=2
set showcmd
set cmdheight=1
set report=0

" Line numbers in the gutter, relativenumber feature only available vim >= 7.03
if version >= 703
    set relativenumber
else
    set number
endif
set numberwidth=4

" Display column and line cross hairs
set cursorline
set cursorcolumn

" Begin scrolling before cursor reaches screen edge
set scrolloff=1
set sidescrolloff=5

" Show matching brackets for 200ms
set showmatch
set mat=2

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
\ endif

" Turn on the enhanced autocomplete
set wildmenu
set wildignore=*.pyc,*.class,*.o,*~,.git\*,.svn\*

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

set hlsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Interface / View Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map :Q to :q, i mess this up constantly
command! Q q

set backspace=eol,start,indent

" Map Y like D, C etc. behave (to end of line)
nnoremap Y  y$

" Toggle paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Get rid of highlighting or statuses with the spacebar
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>

" Go to the 79th column. ST2 has the ability to display vertical guide lines
" which is a better way to enforce 80 char wide restrictions manually
map <leader>8 79\|

" Readline like nav of ex mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-w> <C-U>

" Move line with IDE style <C-S-u> / <C-S-d>, arrow keys are a pain to map
noremap <C-S-u> :m .-2<CR>==
noremap <C-S-d> :m .+1<CR>==
inoremap <C-S-u> <Esc>:m .-2<CR>==gi
inoremap <C-S-d> <Esc>:m .+1<CR>==gi
vnoremap <C-S-u> :m '<-2<CR>gv=gv
vnoremap <C-S-d> :m '>+1<CR>gv=gv

" Buffer management
nnoremap <leader>b :buffers<CR>:buffer 

" Tab management
nnoremap <leader>t :tabs<CR>:tab 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Key bindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mode Specific - Visual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"
    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")
    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif
    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Mode Specific - Visual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Content - Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enhanced syntax highlighting
let python_highlight_all = 1
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
set autowrite " Save when :make is invoked
set makeprg=python\ -u\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End File Content - Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Content - JSON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pretty print a buffer containing JSON
nnoremap <leader>jp :%!python -m json.tool<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Content - JSON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

