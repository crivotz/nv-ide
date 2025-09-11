return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    model = "gpt-4", -- Example: specify model if supported
  },
  keys = {
    { "<leader>c", ":CodeCompanionChat<CR>", desc = "Copilot toggle" },
  }
}
