local M = {
  "stevearc/oil.nvim",
  enabled = true,
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "SirZenith/oil-vcs-status" },
  },
  keys = {
    { "<leader>o", "<cmd>Oil<cr>", desc = "Oil" },
    { "<leader>of", "<cmd>Oil --float<cr>", desc = "Oil (float)" },
  }
}

function M.config()
  require("oil").setup({
    win_options = {
      signcolumn = "yes:2",
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["l"] = "actions.select",
      ["<C-k>"] = "actions.select_vsplit",
      ["<C-j>"] = "actions.select_split",
      ["<C-t>"] = "actions.select_tab",
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = "actions.close",
      ["q"] = "actions.close",
      ["esc"] = "actions.close",
      ["r"] = "actions.refresh",
      ["h"] = "actions.parent",
      ["_"] = "actions.open_cwd",
      ["`"] = "actions.cd",
      ["~"] = "actions.tcd",
      ["gs"] = "actions.change_sort",
      ["gx"] = "actions.open_external",
      ["."] = "actions.toggle_hidden",
      ["g\\"] = "actions.toggle_trash",
    },
    view_options = {
      show_hidden = true,
    },
  })

  local status_const = require("oil-vcs-status.constant.status")

  local StatusType = status_const.StatusType

  require("oil-vcs-status").setup({
    status_symbol = {
      [StatusType.Added] = "",
      [StatusType.Copied] = "󰆏",
      [StatusType.Deleted] = "",
      [StatusType.Ignored] = "",
      [StatusType.Modified] = "",
      [StatusType.Renamed] = "",
      [StatusType.TypeChanged] = "󰉺",
      [StatusType.Unmodified] = " ",
      [StatusType.Unmerged] = "",
      [StatusType.Untracked] = "",
      [StatusType.External] = "",

      [StatusType.UpstreamAdded] = "󰈞",
      [StatusType.UpstreamCopied] = "󰈢",
      [StatusType.UpstreamDeleted] = "",
      [StatusType.UpstreamIgnored] = " ",
      [StatusType.UpstreamModified] = "󰏫",
      [StatusType.UpstreamRenamed] = "",
      [StatusType.UpstreamTypeChanged] = "󱧶",
      [StatusType.UpstreamUnmodified] = " ",
      [StatusType.UpstreamUnmerged] = "",
      [StatusType.UpstreamUntracked] = " ",
      [StatusType.UpstreamExternal] = "",
    },

  })
end

return M
