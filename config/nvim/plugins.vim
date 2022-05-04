" Description: Plugins and plugin manager

" Vim Plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Installed plugins
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

" Auto close brackets
Plug 'cohama/lexima.vim'

" Syntax highlighting
Plug 'sheerun/vim-polyglot'

" Lightweight statusline
Plug 'itchyny/lightline.vim'

call plug#end()
