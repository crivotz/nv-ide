-- Credits to https://github.com/franco-ruggeri
-- If available, open the last chat, otherwise open a new chat
local function open_chat()
  local chat = require("codecompanion.interactions.chat").last_chat()
  if chat then
    chat.ui:open()
    vim.api.nvim_set_current_win(chat.ui.winnr)
  else
    vim.cmd("CodeCompanionChat")
  end
end

return {
  "olimorris/codecompanion.nvim",
  event = "VeryLazy",
  enabled = true,
  cmd = "CodeCompanion",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      version = false,
    },
    "nvim-treesitter/nvim-treesitter",
    "franco-ruggeri/codecompanion-spinner.nvim",
  },
  keys = {
    {
      "<Leader>Aa",
      "<Cmd>CodeCompanionActions<CR>",
      mode = { "n", "x" },
      desc = "[A]I CodeCompanion [a]ctions",
    },
    { "<Leader>Ac", open_chat, desc = "[A]I CodeCompanion [c]hat" },
    {
      "<Leader>Ac",
      "<Cmd>CodeCompanionChat Add<CR>",
      mode = "x",
      desc = "[A]I CodeCompanion [c]hat add",
    },
    {
      "<Leader>AC",
      "<Cmd>CodeCompanionChat<CR>",
      mode = { "n", "x" },
      desc = "[A]I CodeCompanion [c]hat new",
    },
    {
      "<Leader>Ai",
      ":CodeCompanion ",
      mode = { "n", "x" },
      desc = "[A]I CodeCompanion [i]nline",
    },
    {
      "<Leader>An",
      ":CodeCompanionCmd ",
      mode = { "n", "x" },
      desc = "[A]I CodeCompanion [N]eovim command",
    },
  },
  cmd = {
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
    "CodeCompanion",
  },
  opts = {
    interactions = {
      chat = {
        roles = { -- make rendered roles nicer
          llm = function(adapter)
            return (" %s"):format(adapter.formatted_name)
          end,
          user = " User",
        },
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
    extensions = {
      spinner = {
      },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,
}
