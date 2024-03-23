vim.cmd [[set runtimepath=$VIMRUNTIME]]
vim.cmd [[set packpath=/tmp/nvim/site]]
local package_root = '/tmp/nvim/site/pack'
local install_path = package_root .. '/packer/start/packer.nvim'
local function load_plugins()
  require('packer').startup {
    {
      'wbthomason/packer.nvim',
      {
        'nvim-telescope/telescope.nvim',
        requires = {
          'nvim-lua/plenary.nvim',
          { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        },
      },
      -- ADD PLUGINS THAT ARE _NECESSARY_ FOR REPRODUCING THE ISSUE
      {
        'nvim-telescope/telescope-file-browser.nvim',
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
      },
      { 'nvim-treesitter/nvim-treesitter',
        run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
        end,
      }
    },
    config = {
      package_root = package_root,
      compile_path = install_path .. '/plugin/packer_compiled.lua',
      display = { non_interactive = true },
    },
  }
end
_G.load_config = function()
  require('telescope').setup({
    extensions = {
      file_browser = {
        initial_mode = "normal",
        theme = "dropdown",
        hijack_netrw = true,
      }
    }
  })
  require('telescope').load_extension('fzf')
  -- ADD INIT.LUA SETTINGS THAT ARE _NECESSARY_ FOR REPRODUCING THE ISSUE
  require('telescope').load_extension('file_browser')
  local opts = { noremap = true, silent = true }
  local function telescope_buffer_dir()
    return vim.fn.expand('%:p:h')
  end
  vim.keymap.set('n', '<leader>e',
    function()
      require('telescope').extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_git_ignore = false,
        hidden = true,
        grouped = true,
        previewer = true,
        layout_config = { height = 40 } -- height needs to be modified such that previewer is 2 lines tall
      })
    end,
    opts)
end
if vim.fn.isdirectory(install_path) == 0 then
  print("Installing Telescope and dependencies.")
  vim.fn.system { 'git', 'clone', '--depth=1', 'https://github.com/wbthomason/packer.nvim', install_path }
end
load_plugins()
require('packer').sync()
vim.cmd [[autocmd User PackerComplete ++once echo "Ready!" | lua load_config()]]
