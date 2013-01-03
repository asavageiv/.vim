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
" Configure CtrlP to only scan the directories I care about for citc clients.
let g:ctrlp_user_command = 'echo %s > /dev/null; find videoconf/gvc java/com/google/buzz buzz/ production/config/cdd/buzz experimental/users/asavage javascript/apps/gcomm javascript/apps/chat javascript/apps/realtime javascript/closure -type f -not -name ".*"' 

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
