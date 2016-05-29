"-----------------------------------------------------------------
" Spanish's key
"-----------------------------------------------------------------
nnoremap j h
nnoremap k j
nnoremap l k
nnoremap ñ l
nnoremap J H
nnoremap K J
nnoremap L K
nnoremap Ñ L
vnoremap j h
vnoremap k j
vnoremap l k
vnoremap ñ l

"------------------------------------------------------------------
" Syntax, number, limit, encoding, tab, fold, backspace, speel
"------------------------------------------------------------------
set number
syntax on
set textwidth=80
set colorcolumn=+1
set tabstop=4 shiftwidth=4 expandtab
set nocompatible
set backspace=2
set encoding=utf-8
set spelllang=en
set spell
set nocompatible
set ruler          " Show position of the cursor in status bar
set number         " Show number lines
set cursorline     " Highlight cursor line
set foldmethod=syntax
" Python's folding
autocmd Filetype python set foldmethod=indent
autocmd Filetype tex set spelllang=es
set foldnestmax=3

"------------------------------------------------------------------
" Plugins - Vundle
"------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'ctrlpvim/ctrlp.vim'       " Ctrlp
Plugin 'scrooloose/nerdcommenter' " NerdCommenter
Plugin 'scrooloose/syntastic'     " Syntastic
Plugin 'tpope/vim-fugitive'       " Git wrapper (needed for gitgutter & airline)
Plugin 'airblade/vim-gitgutter'   " Display a git diff in the gutter
Plugin 'bling/vim-airline'   
Plugin 'Raimondi/delimitMate'     " Delimiters
Plugin 'vim-latex/vim-latex'      " vim latex
Plugin 'altercation/vim-colors-solarized' " solarized
Plugin 'Yggdroot/indentLine'
" Use :Explorer instead of NERDTree
"Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
call vundle#end()
filetype plugin indent on

"------------------------------------------------------------------
" Config solarized
"------------------------------------------------------------------
set background=dark
colorscheme solarized

"------------------------------------------------------------------
" Config vim-airline
"------------------------------------------------------------------
let g:airline#extensions#branch = 1
let g:airline#extensions#syntastic = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
set laststatus=2

"------------------------------------------------------------------
" Config latex
"------------------------------------------------------------------
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview'

"------------------------------------------------------------------
" Config Synastic
"------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Toggle on/off synatic with 
map <C-o> :SyntasticToggleMode<CR>
map <C-c> :SyntasticCheck<CR>

"------------------------------------------------------------------
" Config identLine
"------------------------------------------------------------------
"let g:indentLine_enabled = 1
let g:indentLine_char = '│'

"------------------------------------------------------------------
" Encryptation algorithm
"------------------------------------------------------------------
set cm=blowfish2

"------------------------------------------------------------------
" Special shortcut
"------------------------------------------------------------------
map <F3> :echo 'Current time is ' . strftime('%c')<CR>

"------------------------------------------------------------------
" Explorer
"------------------------------------------------------------------
map <C-n> :Explore<CR>
let g:netrw_liststyle=3

"------------------------------------------------------------------
" NerdTree Commander
"------------------------------------------------------------------
"let NERDTreeQuitOnOpen=1
"map <C-n> :NERDTree<CR>
"map <C-m> :NERDTreeMirror<CR>
