return {
  "chrisgrieser/nvim-rip-substitute",
  lazy = "VeryLazy",
  keys = {
    {
      "<leader>srf",
      function() require("rip-substitute").sub() end,
      mode = { "n", "x" },
      desc = " rip substitute",
    },
  },
}
