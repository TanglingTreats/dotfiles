-- Global mapping
vim.g.map="<Space>"

-- Global options
vim.opt.encoding="utf-8"

vim.opt.hlsearch=true
vim.opt.incsearch=true

vim.opt.number=true
vim.opt.relativenumber=true

vim.opt.splitbelow=true

-- Indentation
vim.opt.expandtab=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4

-- Character limit
vim.opt.colorcolumn="80"

-- General
vim.opt.bg="dark"
--vim.cmd.colorscheme="gruvbox"
vim.cmd('colorscheme gruvbox')

-- Statusline settings
vim.opt.statusline="%f - Filetype:%y"
vim.opt.laststatus=2

-- Folding
vim.opt.foldmethod="syntax"
vim.opt.foldnestmax=10
vim.opt.foldenable=true
vim.opt.foldlevel=2


