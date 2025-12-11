return {
  "folke/trouble.nvim",
  event = 'VeryLazy',
  keys = {
    { "<leader>tt", ":Trouble todo filter = { tag = {TODO} }<CR>", desc="Trouble TODO" },
    { "<leader>tf", ":Trouble todo filter = { tag = {FIX,FIXME} }<CR>", desc="Trouble FIX" },
    { "<leader>tn", ":Trouble todo filter = { tag = {NOTE} }<CR>", desc="Trouble NOTE" },
    { "<leader>td", ":Trouble diagnostics<cr>", desc = "Diagnostics (Trouble)", },
    { "<leader>tl", ":Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)", },
    { "<leader>tq", ":Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)", },
  },
  opts = {
  },
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
