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
" Gtags search
" nmap <C-]> :exe 'let searchtag= "' . expand('<cword>') . '"' \| :exe 'let @/= "' . searchtag . '"'<CR> \| :exe 'Gtlist ' . searchtag <CR>
" set expandtab
" set shiftwidth=2
" set softtabstop=2
" set tabstop=8
" set list
" au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" source /home/build/nonconf/google3/tools/tags/gtags.vim
highlight OverLength ctermbg=red ctermfg=white guibg=#ffD9D9
match OverLength /\%81v.\+/
