" General settings
syntax on
set hlsearch
set incsearch
set number
set relativenumber
set splitbelow
filetype plugin on

" Source all other vim files
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/coc_config.vim
source $HOME/.config/nvim/language.vim

" Remap leader key
:let mapleader = "\<Space>"

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

" Custom mappings
" ---- Toggle terminal ----
let g:is_term_open=0
function! ToggleTerminal()
    if g:is_term_open
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&buftype") == "terminal")
                silent exe "bdelete! " . i 
            endif
            let i-=1
        endwhile
        let g:is_term_open=0
    else
        let g:is_term_open=1
        silent :split
        silent :terminal
    endif
endfunction

" Terminal toggle shortcut
tnoremap <leader>` <C-\><C-n><bar> :call ToggleTerminal() <CR>
nnoremap <leader>` :call ToggleTerminal() <CR>

" Fugitive shortcuts
nmap <leader>gs :G<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>

" Live Server behaviour
autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
          \ vimXo = content.window.pageXOffset;
          \ BrowserReload();
          \ content.window.scrollTo(vimXo,vimYo);
          \ repl.quit();'  |
          \ nc -w 1 localhost 4242 2>&1 > /dev/null
  endif
endfunction

" Statusline settings
:set statusline=%f         " Path to the file
:set statusline+=\ -\      " Separator
:set statusline+=FileType: " Label
:set statusline+=%y        " Filetype of the file

:set laststatus=2

" Vim Plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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

" File explorer with Netrw
let g:netrw_is_open=0

function! ToggleNetrw()
    if g:netrw_is_open
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
nnoremap <leader>e :call ToggleNetrw()  <CR>

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

" Set indent settings
filetype plugin indent on
" Show existing tab with 4 spaces
set tabstop=4
" When indenting with '>', use 4 spaces
set shiftwidth=4
" On pressing 'Tab', insert 4 spaces
set expandtab

set colorcolumn=80

map <F6> :setlocal spell! spelllang=en_gb<CR>
:nnoremap <silent> <Bslash> :nohlsearch<Bar>:echo<CR>

" Show files in directory
nnoremap <C-p> :GFiles<CR>

