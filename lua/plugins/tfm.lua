return {
  "rolv-apneseth/tfm.nvim",
  enabled = true,
  lazy = false,
  opts = {
    file_manager = "yazi",
    replace_netrw = true,
    enable_cmds = false,
    ui = {
      border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
      height = 1,
      width = 1,
      x = 0.5,
      y = 0.5,
    },
  },
  keys = {
    {
      "<F7>",
      function()
        require("tfm").open()
      end,
      desc = "TFM",
    },
  },
}
