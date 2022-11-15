-- Global mapping

-- Global options
local set = vim.opt

set.fileencoding = "utf-8"
set.encoding = "utf-8"

set.hlsearch = true
set.incsearch = true

set.number = true
set.relativenumber = true

set.splitbelow = true

-- Indentation
set.expandtab = true
set.tabstop = 2
set.shiftwidth = 2
-- Character limit
set.colorcolumn = "80"

-- General
set.bg = "dark"

-- Statusline settings
set.statusline = "%f - Filetype:%y"
set.laststatus = 2

-- Folding
set.foldmethod = "syntax"
set.foldnestmax = 10
set.foldenable = true
set.foldlevel = 2
