local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local formatting = null_ls.builtins.formatting
local sources = {
  --formatting.google_java_format,
  --null_ls.builtins.diagnostics.eslint_d.with({
  --diagnostics_format = '[eslint] #{m}\n(#{c})'
  --})
}

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

--null_ls.setup({
--on_attach = on_attach,
--sources = sources
--})
