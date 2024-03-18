set number
set hlsearch
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
set showmode

set nocompatible

colorscheme default

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" markdownを書くときのインデント挿入用
nnoremap <c-t> I<Tab><esc>A
inoremap <c-t> <esc>I<Tab><esc>A

" enable to undo after reopening file
if has("persistent_undo")
    set undodir=~/.vim/undo
    set undofile
endif

" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options

augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <C-f> :NERDTreeToggle<CR>


call plug#begin("~/dotfiles/vim/plugin")
    Plug 'preservim/nerdtree'
    Plug 'vimwiki/vimwiki'
call plug#end()
