local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

local status, dev_paths = pcall(require, 'dev')

vim.cmd [[packadd packer.nvim]]


packer.startup(function(use)
  -- Color schemes
  use { "ellisonleao/gruvbox.nvim" } -- Theme

  -- Utility
  use 'nvim-lua/plenary.nvim'                                                     -- Lua functions
  use {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }
  use 'nvim-telescope/telescope.nvim'                                             -- Fuzzy file-finder
  use { 'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" } } -- Telescope file browser extension
  use {
    "lazytanuki/nvim-mapper",
    before = "telescope.nvim"
  }
  use 'MunifTanjim/nui.nvim'

  use { 'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  } -- tree-sitter interface

  -- LSP
  use 'neovim/nvim-lspconfig'   -- LSP
  use 'onsails/lspkind.nvim'    -- Pictograms for autocompletion
  use 'hrsh7th/nvim-cmp'        -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp'    -- nvim-cmp source for in-built LSP
  use 'hrsh7th/cmp-buffer'      -- source for buffer
  use 'hrsh7th/cmp-path'        -- Form filepaths
  use 'L3MON4D3/LuaSnip'        -- snippet engine
  use 'mfussenegger/nvim-jdtls' -- Java LSP

  use 'williamboman/mason.nvim' -- LSP plugin manager
  use 'williamboman/mason-lspconfig.nvim'

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'} -- Ultra Folding experience

  use({
    "folke/trouble.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  })

  -- git
  use("tpope/vim-fugitive")
  use { 'akinsho/git-conflict.nvim', tag = '*',
    config = function ()
      require('git-conflict').setup()
    end
  }


  -- Formatters
  use 'nvimtools/none-ls.nvim'    -- Set nvim as LSP
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for nvim
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs' -- Bracket plugin
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  -- Looks
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = false } }

  -- Plugin Development
  if dev_paths ~= nil and type(dev_paths) == "table"
  then
    for _, dev_path in ipairs(dev_paths) do
      use { dev_path }
    end
  end

  if packer_bootstrap then
    require('packer').sync()
  end
end)
