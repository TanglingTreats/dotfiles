" Source all other vim files
source $HOME/.config/nvim/maps.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/coc_config.vim
source $HOME/.config/nvim/language.vim

" General settings
syntax on
set hlsearch
set incsearch
set number
set relativenumber
set splitbelow
set expandtab
filetype plugin on

" Set indent settings
filetype plugin indent on
" Show existing tab with 4 spaces
set tabstop=2
" When indenting with '>', use 4 spaces
set shiftwidth=2
" On pressing 'Tab', insert 4 spaces
set expandtab

set colorcolumn=80

" General vim settings
set nocompatible
filetype off
if has("multi_byte")
    set encoding=utf-8
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    setglobal fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,latin1
endif

" Statusline settings
:set statusline=%f         " Path to the file
:set statusline+=\ -\      " Separator
:set statusline+=FileType: " Label
:set statusline+=%y        " Filetype of the file

:set laststatus=2

" Theme
set bg=dark
let g:gruvbox_contrast_dark = 'medium'
colorscheme gruvbox

" Allow hidden buffers with existing changes
set hidden

" Set folding method
setlocal foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Netrw settings for pleasant looks
"let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=25
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END

function! MoveFile(newspec)
     let old = expand('%')
     " could be improved:
     if (old == a:newspec)
         return 0
     endif
     exe 'sav' fnameescape(a:newspec)
     call delete(old)
endfunction

command! -nargs=1 -complete=file -bar MoveFile call MoveFile('<args>')

