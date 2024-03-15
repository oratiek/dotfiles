set number
set hlsearch
" set ignorecase
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


" transparent
hi Normal guibg=NONE ctermbg=NONE

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


" compile and run C source
nnoremap rc :!gcc % && ./a.out <CR>


nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
nnoremap <Up> :resize +2<CR>
nnoremap <Down> :resize -2<CR>

" markdownを書くときのインデント挿入用
nnoremap <c-t> I<Tab><esc>A
inoremap <c-t> <esc>I<Tab><esc>A


" config for translatro
let g:translator_source_lang="auto"
let g:translator_target_lang="ja"
let g:translator_window_type="popup"
" without double : cannot enter ex command
vnoremap t ::Translate<CR>


" config for weblio-client
vnoremap <c-w> :!weblio <CR>


" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
set viewoptions-=options


call plug#begin("~/dotfiles/vim/plugin")
    Plug 'preservim/nerdtree'
    Plug 'vimwiki/vimwiki'
call plug#end()
