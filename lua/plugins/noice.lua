require("noice").setup({
  cmdline = {
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
    icons = {
      ["/"] = { icon = " ", hl_group = "red",firstc = false },
      ["?"] = { icon = " ", hl_group = "red", firstc = false },
      [":"] = { icon = "|> ", hl_group = "red", firstc = false },
    },
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
        style = "single",
        text = {
          top = ""
        }
      },
      win_options = {
        winhighlight = "Normal:Normal,FloatBorder:red",
      },
    },
  },
})
