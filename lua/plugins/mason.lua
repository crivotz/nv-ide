local servers = {
  'html',
  'ts_ls',
  'solargraph',
  'cssls',
  'dockerls',
  'jsonls',
  'vimls',
  'clangd',
  'pyright',
  'bashls',
  "yamlls",
  "graphql",
  "eslint",
   "rubocop",
   "copilot",
   "ruby_lsp",
}

return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require("mason").setup()
      local registry = require("mason-registry")

      -- auto install formatters
      for _, pkg_name in ipairs({ "prettierd" }) do
        local ok, pkg = pcall(registry.get_package, pkg_name)
        if ok then
          if not pkg:is_installed() then
            pkg:install()
          end
        end
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        automatic_enable = true,
        automatic_installation = true,
        ensure_installed = servers
      })
    end,
  }
}
