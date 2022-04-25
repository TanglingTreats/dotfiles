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
