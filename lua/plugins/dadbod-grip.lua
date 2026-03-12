return {
  "joryeugene/dadbod-grip.nvim",
  keys = {
    { "<leader>db", "<cmd>GripToggle<cr>", desc = "DB connect" },
    { "<leader>dg", "<cmd>Grip<cr>", desc = "DB grid" },
    { "<leader>dt", "<cmd>GripTables<cr>", desc = "DB tables" },
    { "<leader>dq", "<cmd>GripQuery<cr>", desc = "DB query pad" },
    { "<leader>ds", "<cmd>GripSchema<cr>", desc = "DB schema" },
    { "<leader>dh", "<cmd>GripHistory<cr>", desc = "DB history" },
  },
  opts = {
    connections_path = vim.fn.stdpath("config") .. "/grip/connections.json",
    keymaps = { qpad_execute = "<C-r>" }, -- or whatever key you prefer
  },
}
