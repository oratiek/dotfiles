set number
set ruler
set hlsearch
set incsearch
syntax on

set cursorline
set cursorcolumn
set backspace=indent,eol,start

set foldmethod=manual


set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set clipboard=unnamed
set showmode
set wildmenu
set laststatus=2 
set nocompatible
set guitablabel=%t

" find files from vim
set grepprg=grep\ -rn
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost [^l]* cwindow | wincmd j
    autocmd QuickFixCmdPost l* lwindow | wincmd j
augroup END

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

nnoremap <Left> :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>

" tabpage
nnoremap <c-n> :tabe <CR>
nnoremap <c-l> :tabnext <CR>
nnoremap <c-h> :tabprevious <CR>
nnoremap <c-c> :tabclose <CR>

" fzf
nnoremap <c-s> :Files<CR>
nnoremap <c-g> :Rg<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" tabpage
nnoremap <c-n> :tabe <CR>
nnoremap <c-l> :tabnext <CR>
nnoremap <c-h> :tabprevious <CR>
nnoremap <c-c> :tabclose <CR>

" fzf
nnoremap <c-s> :Files<CR>
nnoremap <c-g> :Rg<CR>

" markdownを書くときのインデント挿入用
nnoremap <c-t> I<Tab><esc>A
inoremap <c-t> <esc>I<Tab><esc>A
autocmd BufNewFile,BufRead *.md color default 

" TDOO
let mapleader = "\<space>"
nnoremap T /- [ \]<CR>
nnoremap tt /- [-\]<CR>
function! ToggleCheckBoxDone()
    let line = getline('.')
    if match(line, '- \[ \]') >= 0
        let line = substitute(line, '- \[ \]', '- [x]', '') 
    elseif match(line, '- \[x\]') >= 0
        let line = substitute(line, '- \[x\]', '- \[ \]', '')
    endif
    call setline('.', line)
endfunction
nnoremap <leader>d :call ToggleCheckBoxDone()<CR>

function! ToggleCheckBoxSuspend()
    let line = getline('.')
    if match(line, '- \[ \]') >= 0
        let line = substitute(line, '- \[ \]', '- [-]', '') 
    elseif match(line, '- \[-\]') >= 0
        let line = substitute(line, '- \[-\]', '- \[ \]', '')
    endif
    call setline('.', line)
endfunction
nnoremap <leader>s :call ToggleCheckBoxSuspend()<CR>

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

" undo config
if has('persistant_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" UltiSnips keybind
let g:UltiSnipsJumpForwardTrigger="<tab>"

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

call plug#begin("~/dotfiles/vim/plugin")
    Plug 'preservim/nerdtree'
    Plug 'vimwiki/vimwiki'
    Plug 'habamax/vim-habanight'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'posva/vim-vue'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
call plug#end()
