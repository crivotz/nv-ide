return {
  "OXY2DEV/markview.nvim",
  lazy = false,      -- Recommended
  ft = { "markdown", "codecompanion", "Avante" }, -- If you decide to lazy-load anyway
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    experimental = { check_rtp_message = false }
  }
}
