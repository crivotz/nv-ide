return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  branch = "next",
  cmd = "CodeDiff",
  keys = {
    {
      "<leader>d", "<cmd>CodeDiff<CR>", desc = "Toggle VSCode diff",
    },
  },
}
