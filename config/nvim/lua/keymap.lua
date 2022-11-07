-- Remap leader
vim.g.mapleader=" "

local keymap = vim.keymap

-- Edit init file
keymap.set("n", "<Leader>ec", ":tabedit $MYVIMRC<Return>")

-- Tab movements
keymap.set("n", "<Leader>te", ":tabedit<Return>")
keymap.set("n", "<Tab>", ":tabnext<Return>", {silent = true})
keymap.set("n", "<S-Tab>", ":tabprev<Return>", {silent = true})

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


keymap.set("n", "<F6>", ":setlocal spell! spelllang=en_gb<CR>", {silent = true})
-- Remove search highlight
keymap.set("n", "<BSlash>", ":nohlsearch<Bar>:echo<CR>", {silent = true})
