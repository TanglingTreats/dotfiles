-- Remap leader
vim.g.mapleader=" "

local keymap = vim.keymap

-- Edit init file
keymap.set("n", "<Leader>ec", ":tabedit $MYVIMRC<Return>")

keymap.set("n", "<Leader>te", ":tabedit<Return>")
keymap.set("n", "<Tab>", ":tabnext<Return>", {silent = true})
keymap.set("n", "<S-Tab>", ":tabprev<Return>", {silent = true})
