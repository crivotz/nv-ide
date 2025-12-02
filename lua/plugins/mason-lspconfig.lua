return {
  "mason-org/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    automatic_enable = true,
    automatic_installation = true,
    ensure_installed = {
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
      'copilot',
    }
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {}
    },
    { "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        'prettierd',
      }
    }
  },
  "neovim/nvim-lspconfig",
}
}
