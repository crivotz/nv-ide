return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = {
      'html',
      'ts_ls',
      'solargraph',
      'cssls',
      'dockerls',
      'jsonls',
      'vimls',
      -- 'rust_analyzer',
      'clangd',
      'pyright',
      'bashls',
    }
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
