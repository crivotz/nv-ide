return {
  "rockyzhang24/arctic.nvim",
  dependencies = { "rktjmp/lush.nvim" },
  lazy = false,
  name = "arctic",
  branch = "v2",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme arctic")
  end
}
