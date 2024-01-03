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
    'python'
  },
  autotag = {
    enable = true,
  }
}
