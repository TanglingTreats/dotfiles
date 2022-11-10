local status, telescope = pcall(require, 'telescope')
if (not status) then return end

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.load_extension('file_browser')

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>lg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>ht', builtin.help_tags, opts)

vim.keymap.set('n', '<leader>e',
  '<cmd>lua require("telescope").extensions.file_browser.file_browser({path = "%:p:h", cwd = telescope_buffer_dir(), respect_git_ignore = false, hidden = true, grouped = true, previewer = false, initial_mode= "normal", layout_config={height = 48}})<CR>'
  , opts)

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup = {
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<esc>"] = actions.close
      }
    },
  },
  extensions = {
    file_browser = {
      theme = 'dropdown',
      hijack_netrw = true,
      mappings = {
        ['i'] = {
          ['<C-w>'] = function() vim.cmd('normal vbd') end,
        },
        ['n'] = {
          ['N'] = fb_actions.create,
          ['h'] = fb_actions.goto_parent_dir,
          ['/'] = function()
            vim.cmd('startinsert')
          end,
        }
      }
    }
  }
}
