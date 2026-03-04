return {
  "TheNoeTrevino/haunt.nvim",
  opts = {
    sign = "󱙝",
    sign_hl = "DiagnosticInfo",
    virt_text_hl = "HauntAnnotation",
    annotation_prefix = " 󰆉 ",
    line_hl = nil,
    virt_text_pos = "eol",
    data_dir = nil,
    picker_keys = {
      delete = { key = "d", mode = { "n" } },
      edit_annotation = { key = "a", mode = { "n" } },
    },
  },
  init = function()
    local wk = require("which-key")
    local haunt = require("haunt.api")
    local haunt_picker = require("haunt.picker")

    wk.add({
      { "<leader>h", group = "Haunt", icon = "󱙝" },

      { "<leader>ha", mode = "n", haunt.annotate, desc = "Annotate", icon = "" },
      { "<leader>ht", mode = "n", haunt.toggle_annotation, desc = "Toggle annotation" },
      { "<leader>hT", mode = "n", haunt.toggle_all_lines, desc = "Toggle all annotations" },
      { "<leader>hd", mode = "n", haunt.delete, desc = "Delete bookmark", icon = "" },
      { "<leader>hC", mode = "n", haunt.clear_all, desc = "Delete all bookmarks", icon = "" },

      { "<leader>hp", mode = "n", haunt.prev, desc = "Previous bookmark", icon = "" },
      { "<leader>hn", mode = "n", haunt.next, desc = "Next bookmark", icon = "" },

      { "<leader>hl", mode = "n", haunt_picker.show, desc = "Picker" },

      { "<leader>hq", mode = "n", haunt.to_quickfix, desc = "Quickfix (all)" },
      {
        "<leader>hQ",
        mode = "n",
        function()
          haunt.to_quickfix({ current_buffer = true })
        end,
        desc = "Quickfix (buffer)",
      },

      {
        "<leader>hy",
        mode = "n",
        function()
          haunt.yank_locations({ current_buffer = true })
        end,
        desc = "Yank locations (buffer)",
      },
      { "<leader>hY", mode = "n", haunt.yank_locations, desc = "Yank locations (all)", icon = "" },
    })
  end,
}
