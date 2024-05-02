local status, jdtls = pcall(require, "jdtls")
if not status then return; end

local home = os.getenv("HOME")
local ustatus, util = pcall(require, 'util')
if not ustatus then return; end

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local function returnJdtlsPath()
  local os = util.getOS()
  local switch = {}
  switch['unix'] = home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar"
  switch['win'] = "C:\\Users\\d1331622\\scoop\\apps\\jdtls\\current\\bin\\jdtls.bat"

  return switch[os]
end

local function returnFormatSettingsUrl()
  local os = util.getOS()
  local switch = {}
  switch['unix'] = '/.config/nvim/lsp-config/code-style.xml'
  switch['win'] = '\\AppData\\Local\\nvim\\lsp-config\\code-style.xml'

  return home .. switch[os]
end

local function returnCacheFolder()
  local os = util.getOS()
  local switch = {}
  switch['unix'] = '/.local/share/nvim/mason/packages/jdtls/config_linux'
  switch['win'] = '/config_win'

  return switch[os]
end

local on_attach = function(client, bufnr)
  local _, _ = pcall(vim.lsp.codelens.refresh)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd [[
    augroup Format
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
    augroup END
    ]]
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = 'rounded',
          source = 'always',
          prefix = ' ',
          scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
      end
    })
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      pattern = { "*.java" },
      callback = function()
        local _, _ = pcall(vim.lsp.codelens.refresh)
      end
    })
  end
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-javaagent:' .. home .. '/.local/share/nvim/mason/share/jdtls/lombok.jar',
    '-Xmx4g',
    '-jar', returnJdtlsPath(),
    '-configuration', home .. returnCacheFolder(),
    '-data', home .. '/.cache/jdtls-workspace' .. workspace_dir
  },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
}
local formatSettingsUrl = returnFormatSettingsUrl()
config.settings = {
  java = {
    format = {
      enabled = true,
      tabSize = 4,
      insertSpaces = true,
      settings = {
        profile = "Default",
        url = formatSettingsUrl
      }
    },
    maven = {
      downloadSources = true
    },
    referencesCodeLens = {
      enabled = true
    },
    references = {
      includeDecompiledSources = true,
    },
    signatureHelp = { enabled = true },
    extendedClientCapabilities = extendedClientCapabilities
  }
}

config.on_attach = on_attach
config.capabilities = require("cmp_nvim_lsp").default_capabilities()

jdtls.start_or_attach(config)
