" General
"------------------------------------------------------------------------------
set number	                " Show line numbers
set cursorline                  " Highlight current line
set linebreak	                " Break lines at word (requires Wrap lines)
set showbreak=+++               " Wrap-broken line prefix
set textwidth=100               " Line wrap (number of cols)
set showmatch	                " Highlight matching brace
set visualbell	                " Use visual bell (no beeping)

set hlsearch	                " Highlight all search results
set smartcase	                " Enable smart-case search
set ignorecase	                " Always case-insensitive
set incsearch	                " Searches for strings incrementally

set autoindent	                " Auto-indent new lines
set cindent	                " Use 'C' style program indenting
set expandtab	                " Use spaces instead of tabs
set shiftwidth=4                " Number of auto-indent spaces
set smartindent	                " Enable smart-indent
set smarttab	                " Enable smart-tabs
set softtabstop=4               " Number of spaces per Tab

set splitbelow
set splitright

" Themes and colors
"------------------------------------------------------------------------------
syntax on
colorscheme Civic
set t_Co=256

" Advanced
"------------------------------------------------------------------------------
set ruler                       " Show row and column ruler information

set autochdir                   " Change working directory to open buffer
set autowriteall                " Auto-write all file changes

set undolevels=1000             " Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

" Key bindings
"------------------------------------------------------------------------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

execute pathogen#infect()

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "+",
    \ "Untracked" : "!",
    \ "Renamed"   : "->",
    \ "Unmerged"  : "=",
    \ "Deleted"   : "<",
    \ "Dirty"     : "!!",
    \ "Clean"     : "^",
    \ 'Ignored'   : '_',
    \ "Unknown"   : "?"
    \ }

let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '|'

let g:acp_behaviorKeywordLength = 3
let g:clang_library_path = '/usr/lib/libclang.so'
let g:clang_complete_auto = 1

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif
