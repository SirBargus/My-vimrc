"------------------------------------------------------------------
" Other mapped keys
"------------------------------------------------------------------

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
set nocompatible
set ruler          " Show position of the cursor in status bar
set number         " Show number lines
"set cursorline     " Highlight cursor line
set foldmethod=syntax
" Python's folding
autocmd Filetype python set foldmethod=indent
" Spellang
autocmd Filetype *tex set spelllang=es
autocmd Filetype markdown set spelllang=es
autocmd Filetype *wiki set spelllang=es
autocmd Filetype *exs set tabstop=2 | 
            \ set shiftwidth=2 | 
            \ syntax=elixir

set spell
set foldnestmax=2
set breakindent

" Keeps the visual textwidht without breaking new line
" set formatoptions-=t
set nowrap

let mapleader = ","

set hidden  " allow buffer switching without saving
set showtabline=2  " always show tabline

"--- Buffer movement ---
" Open a new buffer
nmap <leader>T :enew<cr> 
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
"------------------------------------------------------------------
" Plugins - Vundle
"------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'       " Ctrlp
Plugin 'w0rp/ale'                 " Ale, (like synastic)
Plugin 'Raimondi/delimitMate'     " Delimiters
Plugin 'vim-latex/vim-latex'      " vim latex
Plugin 'altercation/vim-colors-solarized' " solarized
Plugin 'vimwiki/vimwiki'
Plugin 'rust-lang/rust.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on

"------------------------------------------------------------------
" Config theme
"------------------------------------------------------------------
set background=dark
highlight Normal ctermbg=NONE
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
let g:airline_solarized_bg='dark'

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

"airline buffer options
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

"------------------------------------------------------------------
" Config latex
"------------------------------------------------------------------

" Auto insert text for arara compiling
autocmd BufNewFile *.tex r $HOME/Dropbox/latex_template/arara.txt

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'xelatex $*.tex'
if has('mac')
    let g:Tex_ViewRule_pdf = 'open -a preview'
elseif has("unix")
    let g:Tex_ViewRule_pdf = 'evince' 
endif

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
"map <C-N> :Sex<CR>
let g:netrw_liststyle=3

"------------------------------------------------------------------
" Markdown
"------------------------------------------------------------------
map <F4> :!pandoc ${pwd}% --latex-engine=xelatex -o ${pwd}%<.pdf<CR>

"------------------------------------------------------------------
" Latex Preview
"------------------------------------------------------------------
if has('mac')
    let g:livepreview_previewer = 'open -a preview'
elseif has("unix")
    let g:livepreview_previewer = 'evince'
endif

map <F4> :LLPStartPreview<CR>

"------------------------------------------------------------------
" Vim Wiki
"------------------------------------------------------------------
" Load from file the multiples wikis
source ~/.vim/wikis.vim
" let g:vimwiki_list = [{'path': '~/Dropbox/wiki'}]
let g:vimwiki_folding='syntax'

"------------------------------------------------------------------
" TagBar
"------------------------------------------------------------------
map <C-m> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

"------------------------------------------------------------------
" Markdown preview
"------------------------------------------------------------------

"let vim_markdown_preview_github=1
if has('mac')
    let vim_markdown_preview_browser='open -a firefox'
elseif has("unix")
    let vim_markdown_preview_browser='firefox'
endif

"------------------------------------------------------------------
" Ale
"------------------------------------------------------------------
" Enable completion where available.
let g:ale_completion_enabled = 1


