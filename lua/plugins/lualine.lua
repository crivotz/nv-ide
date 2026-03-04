local colors = {}
if package.loaded["tokyonight"] then
  colors = require("tokyonight.colors").setup({ transform = true })
end
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sections = {
      lualine_a = {
        {
          function()
            return ""
          end,
          color = function()
            local mode_color = {
              n = colors.green,
              i = colors.red,
              v = colors.purple,
              [""] = colors.purple,
              V = colors.purple,
              c = colors.purple,
              no = colors.red,
              s = colors.orange,
              S = colors.orange,
              [""] = colors.orange,
              ic = colors.yellow,
              R = colors.purple,
              Rv = colors.purple,
              cv = colors.red,
              ce = colors.red,
              r = colors.cyan,
              rm = colors.cyan,
              ["r?"] = colors.cyan,
              ["!"] = colors.red,
              t = colors.green,
            }
            return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
          end,
        },
      },
    },
  },
}
