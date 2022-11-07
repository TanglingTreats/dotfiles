-- Global mapping

-- Global options
local set = vim.opt
set.encoding="utf-8"

set.hlsearch=true
set.incsearch=true

set.number=true
set.relativenumber=true

set.splitbelow=true

-- Indentation
set.expandtab=true
set.tabstop=4
set.shiftwidth=4
-- Character limit
set.colorcolumn="80"

-- General
set.bg="dark"
--vim.cmd.colorscheme="gruvbox"
vim.cmd('colorscheme gruvbox')

-- Statusline settings
set.statusline="%f - Filetype:%y"
set.laststatus=2

-- Folding
set.foldmethod="syntax"
set.foldnestmax=10
set.foldenable=true
set.foldlevel=2


