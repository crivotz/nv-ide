require("noice").setup({
  cmdline = {
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline
    icons = {
      ["/"] = { icon = " ", hl_group = "DiagnosticWarn",firstc = false },
      ["?"] = { icon = " ", hl_group = "DiagnosticWarn", firstc = false },
      [":"] = { icon = "|> ", hl_group = "DiagnosticInfo", firstc = false },
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = "80%",
        col = "50%",
      },
      border = {
        style = "single",
        text = {
          top = ""
        }
      },
      win_options = {
        winhighlight = "Normal:IndentBlanklineContextChar,FloatBorder:float",
      },
    },
  },
})
