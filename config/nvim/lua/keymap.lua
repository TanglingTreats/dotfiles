-- Remap leader
vim.g.mapleader = " "

local keymap = vim.keymap

-- Edit init file
keymap.set("n", "<Leader>tc", ":tabedit $MYVIMRC<Return>")

-- Tab movements
keymap.set("n", "<Leader>te", ":tabedit<Return>")

local opts = { noremap = true, silent = true }
keymap.set("n", "<S-Tab>", "<cmd>bprev<CR>", opts)
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", opts)


keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_gb<CR>", { silent = true })
-- Remove search highlight
keymap.set("n", "<BSlash>", ":nohlsearch<Bar>:echo<CR>", { silent = true })

-- Folding shortcuts
local status, ufo = pcall(require, "ufo");
if status
then
  keymap.set('n', 'zR', ufo.openAllFolds)
  keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
  keymap.set('n', 'zM', ufo.closeAllFolds)
end
keymap.set('n', 'zm', function() require('ufo').closeFoldsWith(1) end) -- closeAllFolds == closeFoldsWith(0)
