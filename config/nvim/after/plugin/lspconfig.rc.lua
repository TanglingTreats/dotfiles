local status, nvim_lsp = pcall(require, 'lspconfig')

if not status then return end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentFormattingProvider then
    vim.cmd [[
    augroup Format
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()
    augroup END
    ]]
  end
end


-- Typescript LSP
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

-- HTML LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

nvim_lsp.html.setup {
  filetypes = { "html" },
  capabilities = capabilities
}

-- C# LSP
nvim_lsp.csharp_ls.setup {
}

-- Lua LSP
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      telemetry = {
        enable = false,
      }
    }
  }
}

-- Python LSP
nvim_lsp.pyright.setup {
  cmd = { "pyright-langserver", "--stdio" }
}

-- Java LSP
--[[
--]]
local root_pattern = nvim_lsp.util.root_pattern
nvim_lsp.jdtls.setup {
  cmd = { 'jdtls' },
  filetypes = { "java" },
  root_dir = root_pattern("pom.xml", ".git", "mvnw"),
}
