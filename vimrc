set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'elzr/vim-json.git'
Plugin 'leafgarland/typescript-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" Commands for code reviews.
command! Comments cexpr system("git5 comments --quickfix")
command! UnrepliedComments cexpr system("git5 comments --quickfix --unreplied-only")
command! Lint cexpr system("git5 lint --quickfix")

if filereadable("/usr/share/vim/google/runtime/util/piper_tools.vim")
  source /usr/share/vim/google/runtime/util/piper_tools.vim
endif

" perforce commands
command! -nargs=* -complete=file PEdit :!g4 edit %
command! -nargs=* -complete=file PRevert :!g4 revert %
command! -nargs=* -complete=file PDiff :!g4 diff %

function! s:CheckOutFile()
 if filereadable(expand("%")) && ! filewritable(expand("%"))
   let s:pos = getpos('.')
   let option = confirm("Readonly file, do you want to checkout from p4?"
         \, "&Yes\n&No", 1, "Question")
   if option == 1
     PEdit
   endif
   edit!
   call cursor(s:pos[1:3])
 endif
endfunction
au FileChangedRO * nested :call <SID>CheckOutFile()
