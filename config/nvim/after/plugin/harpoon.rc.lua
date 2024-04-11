local status, harpoon = pcall(require, 'harpoon')
if not status then return end

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>hr", function() harpoon:list():remove() end)
vim.keymap.set("n", "<leader>hc", function() harpoon:list():clear() end)

vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<F9>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<F10>", function() harpoon:list():next() end)
