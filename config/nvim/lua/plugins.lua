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

vim.cmd [[packadd packer.nvim]]


packer.startup(function(use)

  use 'morhetz/gruvbox' -- Theme
  use 'nvim-lua/plenary.nvim' -- Lua functions
  use 'nvim-telescope/telescope.nvim' -- Fuzzy file-finder
  use 'nvim-treesitter/nvim-treesitter' -- tree-sitter interface
  use 'neovim/nvim-lspconfig' -- LSP
  use 'onsails/lspkind.nvim' -- Pictograms for autocompletion
  use 'hrsh7th/nvim-cmp' -- Autocompletion
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for in-built LSP
  use 'hrsh7th/cmp-buffer' -- source for buffer
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip' -- snippet engine

  if packer_bootstrap then
    require('packer').sync()
  end

end)
