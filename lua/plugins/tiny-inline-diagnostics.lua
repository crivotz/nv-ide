return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts  = {
    preset = "powerline",
    options = {
      show_source = {
        enabled = true
      },
      use_icons_from_diagnostic = false,
      set_arrow_to_diag_color = true,
    }
  }
}
