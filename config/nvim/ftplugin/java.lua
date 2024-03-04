local status, util = pcall(require, 'util')
if not status then return; end


local function returnJdtlsPath()
  local os = util.getOS()
  local switch = {}
  switch['macOS'] = "/opt/homebrew/bin/jdtls"
  switch['unix'] = "/usr/bin/jdtls"

  return switch[os]
end

local config = {
  cmd = {
    returnJdtlsPath(),
    '-configuration', os.getenv("HOME") .. '/.cache/config_linux'
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
