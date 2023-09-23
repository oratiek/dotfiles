set number
set hlsearch
set ignorecase
set incsearch
syntax on

set cursorline
set backspace=indent,eol,start


set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set clipboard+=unnamed

" enable to undo after reopening file
if has("persistent_undo")
    set undodir=~/.vim/undo
    set undofile
endif

set showmode

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
filetype plugin indent on

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

autocmd BufNewFile,BufRead *.memo colorscheme shine 

colorscheme habamax 

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

nnoremap <F3> :noh<CR>

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | vertical resize 25 | wincmd p

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" run current editing python script
nnoremap <c-x> :!python % <bar> less<CR>

nnoremap rc :!gcc % && ./a.out <CR>

nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" markdownを書くときのインデント挿入用
nnoremap <c-t> I<Tab>
inoremap <c-t> I<Tab>

" run python repl これのせいでタブが入力できなくなる

call plug#begin("~/.vim/plugged")
    ""Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'preservim/nerdtree'
    ""Plug 'rust-lang/rust.vim'
    Plug 'vimwiki/vimwiki'
call plug#end()
