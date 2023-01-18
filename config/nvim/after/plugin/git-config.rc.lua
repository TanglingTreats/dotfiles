local status, git_config = pcall(require, 'git-config')

if not status then return end

git_config.setup({
  default_mappings = true,
  default_commands = true,
  disable_diagnostics = false,
  highlight = {
    incoming = 'DiffText',
    current = 'DiffAdd'
  }
})
