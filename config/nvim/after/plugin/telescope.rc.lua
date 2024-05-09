local status, telescope = pcall(require, 'telescope')

if (not status) then return end

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local actions = require('telescope.actions')

local fb_actions = telescope.extensions.file_browser.actions

telescope.setup {
  defaults = {
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.45,
      },
    },
    file_ignore_patterns = {
      "node_modules", ".git", "yarn.lock"
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-c>"] = actions.close,
        ["<C-e>"] = actions.send_to_qflist + actions.open_qflist,
      },
      n = {
        ["<C-h>"] = "which_key",
        ["<C-c>"] = actions.close,
        ["<C-e>"] = actions.send_to_qflist + actions.open_qflist,
      }
    },
  },
  pickers = {
    find_files = {
    },
    buffers = {
      mappings = {
        n = {
          ["dd"] = actions.delete_buffer
        }
      }
    }
  },
  extensions = {
    file_browser = {
      initial_mode = "normal",
      mappings = {
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
          ["<A-n>"] = fb_actions.create
        },
        ["n"] = {
          ["n"] = fb_actions.create,
          ["dd"] = fb_actions.remove,
          ["h"] = fb_actions.goto_parent_dir,
          ["l"] = actions.select_default,
          ["/"] = function()
            vim.cmd('startinsert')
          end,
        }
      },
      hijack_netrw = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({

      })
    }
  }
}

-- Load file browser extension
telescope.load_extension('file_browser')
telescope.load_extension('ui-select')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>e',
  function()
    telescope.extensions.file_browser.file_browser({
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_git_ignore = false,
      hidden = true,
      grouped = true,
      previewer = true,
    })
  end, opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ no_ignore = false, hidden = true }) end, opts)
vim.keymap.set('n', '<leader>lg', function() builtin.live_grep() end, opts)
vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }) end, opts)
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ initial_mode = "normal" }) end, opts)
vim.keymap.set('n', '<leader>ht', function() builtin.help_tags() end, opts)
vim.keymap.set('n', '<leader>qf', function() builtin.quickfix() end, opts)
