" ## Install vim-plug if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" ## Plugins

call plug#begin('~/.config/nvimi')
Plug 'cespare/vim-toml'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vivien/vim-linux-coding-style'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()


" ## Options

set encoding=utf-8
set hidden
set incsearch
set noswapfile
set number
set numberwidth=5
set showcmd
set wrap

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set ruler
set textwidth=80
set colorcolumn=+1

" Always use vertical diffs
set diffopt+=vertical


" ## Plugin Options

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" enable airline extension
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Map Ctrl + p to open fuzzy find (FZF)
nnoremap <c-p> :Files<cr>

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

let g:linuxsty_patterns = [ "/usr/src/", "/linux" ]
nnoremap <silent> <leader>a :LinuxCodingStyle<cr>
