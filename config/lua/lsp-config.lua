local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=✖')
vim.cmd('sign define LspDiagnosticsSignWarning text=✖')
vim.cmd('sign define LspDiagnosticsSignInformation text=●')
vim.cmd('sign define LspDiagnosticsSignHint text=●')
vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{
}
require'lspconfig'.solargraph.setup{
  capabilities = capabilities,
}
require'lspconfig'.cssls.setup{
  capabilities = capabilities,
}
require'lspconfig'.dockerls.setup{
}
require'lspconfig'.jsonls.setup{
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    }
  }
}
require'lspconfig'.yamlls.setup{
}
require'lspconfig'.vimls.setup{
}
