" General settings
syntax on
set hlsearch
set incsearch
set number
set relativenumber
set splitbelow

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

" ----------------------

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

call plug#begin('~/.vim/plugged')

" Better Git integration within vim
Plug 'tpope/vim-fugitive'

" Gruvbox color scheme
Plug 'morhetz/gruvbox'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Fuzzy file finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Latex filetype
Plug 'lervag/vimtex'

Plug 'chrisbra/unicode.vim'

" Puts a line on indent spaces
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()


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

" ------ COC Mappings ------
" Use Tab for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Map CoC keys
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)


" Refresh coc tags
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Show files in directory
nnoremap <C-p> :GFiles<CR>

