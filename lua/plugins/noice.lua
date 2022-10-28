require("noice").setup({
  cmdline = {
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    format = {
      cmdline = { pattern = "^:", icon = "|>", lang = "vim", title = "" },
    }
  },
  views = {
    cmdline_popup = {
      size = {
        height = "auto",
        width = "90%",
      },
      position = {
        row = "90%",
        col = "50%",
      },
      border = {
        style = "single"
      },
    },
  },
})
