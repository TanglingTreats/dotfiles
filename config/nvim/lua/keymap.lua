-- Remap leader
vim.g.mapleader = " "

local keymap = vim.keymap

-- Edit init file
keymap.set("n", "<Leader>tc", ":tabedit $MYVIMRC<Return>")

-- Tab movements
keymap.set("n", "<Leader>te", ":tabedit<Return>")

function TabMove(dir)
  local ntp = vim.fn.tabpagenr("$")
  if ntp > 1 then
    local ctpn = vim.fn.tabpagenr()
    if ctpn == 1 and dir < 0 then
      print("Unable to move tab left")
    elseif ctpn == ntp and dir > 0 then
      print("Unable to move tab right")
    else
      if dir > 0 then
        vim.cmd("tabm +1")
      else
        vim.cmd("tabm -1")
      end
    end
  end
end

keymap.set("n", "<F9>", "<cmd>lua TabMove(-1)<CR>")
keymap.set("n", "<F10>", "<cmd>lua TabMove(1)<CR>")

keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_gb<CR>", { silent = true })
-- Remove search highlight
keymap.set("n", "<BSlash>", ":nohlsearch<Bar>:echo<CR>", { silent = true })

-- Terminal shortcuts
-- Add require for terminal and trigger open and close
keymap.set("t", "<Leader>`", "<C-\\><C-n><bar> <cmd>lua ToggleTerminal() <CR>", { silent = true })
keymap.set("n", "<Leader>`", "<cmd>lua ToggleTerminal() <CR>", { silent = true })

-- Folding shortcuts
local status, ufo = pcall(require, "ufo");
if status
then
  keymap.set('n', 'zR', ufo.openAllFolds)
  keymap.set('n', 'zr', ufo.openFoldsExceptKinds)
  keymap.set('n', 'zM', ufo.closeAllFolds)
end
keymap.set('n', 'zm', function() require('ufo').closeFoldsWith(1) end) -- closeAllFolds == closeFoldsWith(0)
