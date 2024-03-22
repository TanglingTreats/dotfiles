local status, telescope = pcall(require, 'telescope')

if (not status) then return end

function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local fb_actions = telescope.extensions.file_browser.actions

-- local previewers = require("telescope.previewers")
-- local Job = require("plenary.job")
-- local new_maker = function(filepath, bufnr, opts)
--   filepath = vim.fn.expand(filepath)
--   Job:new({
--     command = "file",
--     args = { "--mime-type", "-b", filepath },
--     on_exit = function(j)
--       local mime_type = vim.split(j:result()[1], "/")[1]
--       if mime_type == "text" then
--         previewers.buffer_previewer_maker(filepath, bufnr, opts)
--       else
--         -- maybe we want to write something to the buffer here
--         vim.schedule(function()
--           vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
--         end)
--       end
--     end
--   }):sync()
-- end

telescope.setup {
  defaults = {
    -- buffer_previewer_maker = new_maker,
    file_ignore_patterns = {
      "node_modules", ".git", "yarn.lock"
    },
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
        ["<C-c>"] = actions.close
      },
      n = {
        ["<C-h>"] = "which_key",
        ["<C-c>"] = actions.close,
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
      theme = "dropdown",
      hijack_netrw = true,
    }
  }
}

-- Load file browser extension
telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<leader>e',
  function() telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_git_ignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    layout_config={height=40}
  }) end, opts)

vim.keymap.set('n', '<leader>ff', function() builtin.find_files({ no_ignore = false, hidden = true }) end, opts)
vim.keymap.set('n', '<leader>lg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', function() builtin.buffers({ initial_mode = "normal" }) end, opts)
vim.keymap.set('n', '<leader>ht', builtin.help_tags, opts)
vim.keymap.set('n', '<leader>qf', builtin.quickfix, opts)
