return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  branch = "next",
  cmd = "CodeDiff",
  keys = {
    {
      "<leader>gc",
      "<cmd>CodeDiff<CR>",
      desc = "Toggle VSCode diff",
    },
  },
}
