" Let pathogen run as a bundle.
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

" Remap list snippets
let g:UltiSnipsListSnippets="<S-Tab>"
" Turn on syntax highlighting
syntax on
" Source google specific changes

if filereadable("/usr/share/vim/google/google.vim")
  source /usr/share/vim/google/google.vim
endif
" A few google specific settings from go/vim sites page.
set expandtab
set shiftwidth=2
set softtabstop=2

" Show line numbers
set number
" Put swp files in a single directory
set directory=~/.swp//,/tmp//
" Highligh current search
set hlsearch
" Use bash style tab completion
set wildmode=longest,list,full
set wildignore=blaze-*/**

" See :help autoread
set autoread

" Color columns past the textwidth
set colorcolumn=+1

" Highlight characters past 80 columns.
highlight OverLength ctermbg=red ctermfg=white guibg=#ffD9D9
match OverLength /\%81v.\+/

" Always show the status line
set laststatus=2

" Highlight the status line of the active window.
highlight StatusLine ctermfg=Cyan

" Edit test file and source file respectively
map ,t :edit %:r_test.html
map ,s :edit %:s/_test\.html/.js/
map ,b :edit %:p:h/BUILD

" Configure CtrlP to use the current working directory as its path always.
let g:ctrlp_working_path_mode='a'
" Configure CtrlP to scan more files.
let g:ctrlp_max_files = 100000
