require("mason-lspconfig").setup({
  ensure_installed = { "html", "tsserver", "solargraph", "cssls", "dockerls", "jsonls", "yamlls", "vimls", "rust_analyzer" }
})
