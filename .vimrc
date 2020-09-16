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
Plugin 'connorholyday/vim-snazzy'
Plugin 'vim-jp/vim-cpp'
Plugin 'fatih/vim-go'
Plugin 'rust-lang/rust.vim'
Plugin 'fisadev/vim-isort'
Plugin 'uarun/vim-protobuf'

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

" Performance improvments
if has("mac")
    set foldlevel=0
    set foldmethod=manual
endif

" more powerful backspacing
set backspace=indent,eol,start

syntax on
colorscheme snazzy

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

let g:airline_theme='wombat'

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1

" Curly braces error workarround
let c_no_curly_error = 1

" Highlighting of library concepts
let g:cpp_concepts_highlight = 1

" Highlight template functions
let g:cpp_experimental_simple_template_highlight = 1

" Highlighting of POSIX functions
let g:cpp_posix_standard = 1

" Highlighting of class names in declarations
let g:cpp_class_decl_highlight = 1

" Highlighting of member variables
let g:cpp_member_variable_highlight = 1

" Highlighting of class scope
let g:cpp_class_scope_highlight = 1

map <F12> :!ctags -f tags --exclude=amalgamated -R --sort=yes --c++-kinds=+p --fields=+iaS --extras=+q -I  _GLIBCXX_NOEXCEPT .<CR>

function! Formatonsave()
    let l:formatdiff = 1
    py3f ~/.vim/clang-format.py
endfunction

autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()

inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Rust
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'

" Go
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
" let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_build_constraints = 1

" Python
let g:vim_isort_map = ''
let g:vim_isort_config_overrides = {
  \ 'include_trailing_comma': 1, 'multi_line_output': 3}
let g:vim_isort_python_version = 'python3'

set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
