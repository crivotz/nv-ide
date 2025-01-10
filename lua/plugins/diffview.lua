return {
  "sindrets/diffview.nvim",
  lazy = true,
  cmd = { "DiffviewOpen", "DiffviewClose" },
  keys = {
    { "<leader>gd",function() if next(require('diffview.lib').views) == nil then vim.cmd('DiffviewOpen') else vim.cmd('DiffviewClose') end end, desc = "Git diff" },
  },
  config = function()
    require("diffview").setup({
      view = {
        file_history = {
          layout = "diff2_vertical",
        },
      },
    })
  end
}
