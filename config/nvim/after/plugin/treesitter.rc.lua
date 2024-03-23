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
    'vimdoc',
    'tsx',
    'javascript',
    'html',
    'c',
    'cpp',
    'c_sharp',
    'rust',
    'lua',
    'json',
    'css',
    'java',
    'python',
    'yaml'
  },
  autotag = {
    enable = true,
  }
}
