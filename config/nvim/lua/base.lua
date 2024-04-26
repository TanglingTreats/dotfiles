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
set.colorcolumn = "120"

-- General
set.bg = "dark"

-- Statusline settings
set.statusline = "%f - Filetype:%y"
set.laststatus = 2

-- Folding
set.foldcolumn = '1'
set.foldlevel = 99
set.foldlevelstart = 99
set.foldenable = true

set_local.updatetime = 100

-- Cursorline highlight
set.cursorline = true

-- Softwrap
set.textwidth = 0
set.wrapmargin = 0
set.wrap = true
set.linebreak = true
