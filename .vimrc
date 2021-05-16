filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'vim-jp/vim-cpp'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'tikhomirov/vim-glsl'
Plugin 'chriskempson/base16-vim'

call vundle#end()

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
set encoding=utf-8
set background=dark

" don't render special chars (tabs, trails, ...)
set nolist

" lazy drawing
set lazyredraw
set ttyfast

" more powerful backspacing
set backspace=indent,eol,start

syntax on
colorscheme base16-default-dark
let base16colorspace=256
set termguicolors

filetype plugin indent on

" navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Highlight matching words
autocmd CursorMoved * exe printf('match Search /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" Ctrl + n to toggle nerdtree
map <C-n> :NERDTreeToggle<CR>

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

" air-line
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

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_theme='tomorrow'

map <F12> :!ctags -f tags --exclude=amalgamated -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q -I  _GLIBCXX_NOEXCEPT .<CR>

function! Formatonsave()
    let l:formatdiff = 1
    py3f ~/.vim/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
" let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1
let c_no_curly_error=1
