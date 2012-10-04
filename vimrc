" Let pathogen run as a bundle.
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

syntax on
source /usr/share/vim/google/google.vim
" Show line numbers
set number
" Put swp files in a single directory
set directory=~/.swp//,/tmp//
" Highligh current search
set hlsearch
" Use bash style tab completion
set wildmode=longest,list,full
set wildignore=blaze-*/**,releasetools/*/**

" See :help autoread
set autoread

" source /home/build/nonconf/google3/tools/tags/gtags.vim
highlight OverLength ctermbg=red ctermfg=white guibg=#ffD9D9
match OverLength /\%81v.\+/
