local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
vim.diagnostic.config({
  virtual_text = false,
})
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Diagnostics symbols for display in the sign column.
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

--[[ require'lspconfig'.html.setup { ]]
--[[   on_attach = on_attach, ]]
--[[   filetypes = {"html"}, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
--[[ require'lspconfig'.tsserver.setup{ ]]
--[[   on_attach = on_attach, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
--[[ require'lspconfig'.solargraph.setup{ ]]
--[[   on_attach = on_attach, ]]
--[[   filetypes = {"ruby", "eruby"}, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()), ]]
--[[   settings = { ]]
--[[     solargraph = { ]]
--[[       -- autoformat = true, ]]
--[[       completion = true, ]]
--[[       diagnostics = true, ]]
--[[       -- folding = true, ]]
--[[       -- references = true, ]]
--[[       -- rename = true, ]]
--[[       -- symbols = true ]]
--[[     } ]]
--[[   } ]]
--[[ } ]]
--[[ require'lspconfig'.cssls.setup{ ]]
--[[   on_attach = on_attach, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
--[[ require'lspconfig'.dockerls.setup{ ]]
--[[   on_attach = on_attach, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
--[[ require'lspconfig'.jsonls.setup{ ]]
--[[   on_attach = on_attach, ]]
--[[   commands = { ]]
--[[     Format = { ]]
--[[       function() ]]
--[[         vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0}) ]]
--[[       end ]]
--[[     } ]]
--[[   }, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
--[[ require'lspconfig'.yamlls.setup{ ]]
--[[   on_attach = on_attach, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
--[[ require'lspconfig'.vimls.setup{ ]]
--[[   on_attach = on_attach, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
--[[ require'lspconfig'.rust_analyzer.setup { ]]
--[[   on_attach = on_attach, ]]
--[[   settings = { ]]
--[[     ["rust-analyzer"] = { ]]
--[[       assist = { ]]
--[[         importMergeBehavior = "last", ]]
--[[         importPrefix = "by_self", ]]
--[[       }, ]]
--[[       diagnostics = { ]]
--[[         disabled = { "unresolved-import" } ]]
--[[       }, ]]
--[[       cargo = { ]]
--[[         loadOutDirsFromCheck = true ]]
--[[       }, ]]
--[[       procMacro = { ]]
--[[         enable = true ]]
--[[       }, ]]
--[[       checkOnSave = { ]]
--[[         command = "clippy" ]]
--[[       }, ]]
--[[     } ]]
--[[   }, ]]
--[[   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()) ]]
--[[ } ]]
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
require('ufo').setup()
