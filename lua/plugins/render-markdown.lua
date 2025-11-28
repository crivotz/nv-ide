return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = true,
  lazy = false,      -- Recommended
  ft = { "markdown", "codecompanion", "Avante" }, -- If you decide to lazy-load anyway
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    completions = { lsp = { enabled = true } },
  }
}
