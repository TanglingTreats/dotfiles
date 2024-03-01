local status, nvim_lsp = pcall(require, 'lspconfig')

if not status then return end

local protocol = require('vim.lsp.protocol')

-- LspAttach autocommand to map after LSP attach to current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }
    --[[ normal mode ]]
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts) --[[ Prefer this ]]
    vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>gc", vim.lsp.buf.code_action, opts)

    --[[ insert mode ]]
    vim.keymap.set("n", "<C-Space>", vim.lsp.buf.completion, opts)
  end
})

local on_attach = function(client, bufnr)
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

-- CSS
nvim_lsp.cssls.setup {
  capabilities = capabilities,
}

-- C/C++
nvim_lsp.ccls.setup {
  init_options = {
    cache = {
      directory = "/tmp/ccls-cache",
    }
  },
  on_attach = on_attach
}

-- Makefile
nvim_lsp.cmake.setup {

}

-- C# LSP
nvim_lsp.csharp_ls.setup {
}

-- Lua LSP
nvim_lsp.lua_ls.setup {
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
  on_attach = on_attach,
  cmd = { "pyright-langserver", "--stdio" },
  settings = {
    python = {
      analysis = {
        diagnosticMode = "openFilesOnly"
      }
    }
  }
}

-- Java LSP
--[[
--]]
local root_pattern = nvim_lsp.util.root_pattern
nvim_lsp.jdtls.setup {
  cmd = { 'jdtls' },
  filetypes = { "java" },
  root_dir = function(fname)
    return require 'lspconfig'.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
  end,
}

-- Rust
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
}
