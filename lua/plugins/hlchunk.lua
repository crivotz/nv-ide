return {
  "shellRaining/hlchunk.nvim",
  event = { "UIEnter" },
  enabled = false,
  config = function()
    require('hlchunk').setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        chars = {
          horizontal_line = "━",
          vertical_line = "┃",
          left_top = "┏",
          left_bottom = "┗",
          right_arrow = "━",
        },
      },
      blank = {
        enable = false,
      },
      line_num = {
        enable = false,
        use_treesitter = true,
      },
    })
  end
}
