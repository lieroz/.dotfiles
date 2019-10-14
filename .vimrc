filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'valloric/youcompleteme'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'rust-lang/rust.vim'

call vundle#end()

syntax on
colorscheme atom-dark-256

" search
set incsearch
set ignorecase
set smartcase

" editor settings
set mouse=a
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set nu
set rnu
set tags+=./tags
set hidden
set nocompatible
set cursorline
set cursorcolumn
set t_Co=256
set directory=~/.vim/tmp
set nowrap

filetype plugin indent on

" navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Highlight matching words
autocmd CursorMoved * exe printf('match Search /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Ctrl + n to toggle nerdtree && Ctrl + m to toggle tagbar
map <C-n> :NERDTreeToggle<CR>

" Rust settings
let g:rustfmt_autosave = 1
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" Display error message if smth is wrong
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Searching using CtrlP plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" map jj to Esc
imap jj <Esc>

" encoding menu (koi8-r, cp1251, cp866, utf8)
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=8bit-koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=8bit-cp1251<CR>
menu Encoding.ibm-866 :e ++enc=8bit-ibm866<CR>
menu Encoding.utf-8 :e ++enc=2byte-utf-8 <CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>

" display encoding menu
nmap <F7> :emenu Encoding.<TAB>
vmap <F7> <esc>:emenu Encoding.<TAB>
imap <F7> <esc>:emenu Encoding.<TAB>

" string end format
set wildmenu
set wcm=<Tab>
menu Encoding.End_line_format.unix<Tab><C-F7> :set fileformat=unix<CR>
menu Encoding.End_line_format.dos<Tab><C-F7> :set fileformat=dos<CR>
menu Encoding.End_line_format.mac<Tab><C-F7> :set fileformat=mac<CR>
nmap <F8> :emenu Encoding.End_line_format.<TAB>
