local status, ts = pcall(require, 'nvim-treesitter.configs')

if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {}
  },
  indent = {
    enable = true,
    disable = {}
  },
  ensure_installed = {
    'tsx',
    'html',
    'c',
    'c_sharp',
    'lua',
    'json',
    'css'
  },
  autotag = {
    enable = true,
  }
}
