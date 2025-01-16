return {
  "folke/trouble.nvim",
  event = 'VeryLazy',
  keys = {
    { "<leader>tt", ":Trouble todo filter = { tag = {TODO} }<CR>", desc="Trouble TODO" },
    { "<leader>tf", ":Trouble todo filter = { tag = {FIX,FIXME} }<CR>", desc="Trouble FIX" },
    { "<leader>tn", ":Trouble todo filter = { tag = {NOTE} }<CR>", desc="Trouble NOTE" },
    { "<leader>tr", "<cmd>TroubleToggle<cr>", desc="Trouble" },
    { "<leader>tw", "<cmd>Trouble workspace_diagnostics<cr>", desc="Trouble WS Diagnostics" },
    { "<leader>td", "<cmd>Trouble document_diagnostics<cr>", desc="Trouble diagnostics" },
    { "<leader>tll", "<cmd>Trouble loclist<cr>", desc="Trouble loclist" },
    { "<leader>tq", "<cmd>Trouble quickfix<cr>", desc="Trouble quickfix" },
    { "<leader>tl", "<cmd>Trouble lsp_references<cr>", desc="Trouble lsp" }
  },
  opts = {},
  specs = {
    "folke/snacks.nvim",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts or {}, {
        picker = {
          actions = require("trouble.sources.snacks").actions,
          win = {
            input = {
              keys = {
                ["<c-t>"] = {
                  "trouble_open",
                  mode = { "n", "i" },
                },
              },
            },
          },
        },
      })
    end,
  },
}
