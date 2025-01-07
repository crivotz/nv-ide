return {
  "tpope/vim-dadbod",
  dependencies = {
    { "kristijanhusak/vim-dadbod-ui" },
    { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
  },
  opts = {
  },
  config = function(_, opts)
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_save_location = vim.fn.stdpath "config" .. require("plenary.path").path.sep .. "db_ui"

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "sql",
      },
      command = [[setlocal omnifunc=vim_dadbod_completion#omni]],
    })
  end,
  keys = {
    { "<leader>dt", "<cmd>DBUIToggle<cr>",        desc = "Toggle UI" },
    { "<leader>df", "<cmd>DBUIFindBuffer<cr>",    desc = "Find Buffer" },
    { "<leader>dr", "<cmd>DBUIRenameBuffer<cr>",  desc = "Rename Buffer" },
    { "<leader>dq", "<cmd>DBUILastQueryInfo<cr>", desc = "Last Query Info" },
  },
}
