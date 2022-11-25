-- Global mapping

-- Global options
local set = vim.opt
local set_local = vim.opt_local

set.fileencoding = "utf-8"
set.encoding = "utf-8"

set.incsearch = false
--set.hlsearch = false

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

set_local.updatetime = 100
