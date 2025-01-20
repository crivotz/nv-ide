return {
  "folke/todo-comments.nvim",
  lazy = false,
  opts = {},
  keys = {
    { "<leader>tT", function () Snacks.picker.todo_comments({ keywords = { "TODO" } }) end, desc = "Todo" },
    { "<leader>tF", function () Snacks.picker.todo_comments({ keywords = { "FIX", "FIXME" } }) end, desc = "Fix/Fixme" },
    { "<leader>tN", function () Snacks.picker.todo_comments({ keywords = { "NOTE" } }) end, desc = "Note" },
  },
}
