local status, telescope = pcall(require, 'telescope')

if (not status) then return end

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')


local fb_actions = telescope.extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-c>"] = actions.close
      },
      n = {
        ["<C-c>"] = actions.close,
        ["dd"] = actions.delete_buffer
      }
    },
  },
  extensions = {
    file_browser = {
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
          ["<A-n>"] = fb_actions.create
        },
        ["n"] = {
          ["n"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          ["/"] = function()
            vim.cmd('startinsert')
          end,
        }
      },
      theme = 'dropdown',
      hijack_netrw = true,
    }
  }
}

-- Load file browser extension
telescope.load_extension('file_browser')
telescope.load_extension('mapper')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>e',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode= "normal", layout_config={height = 40}})<CR>'
  , opts)

vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ no_ignore = false, hidden = true }) end, opts)
vim.keymap.set('n', '<leader>lg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ initial_mode = "normal" }) end, opts)
vim.keymap.set('n', '<leader>ht', builtin.help_tags, opts)
