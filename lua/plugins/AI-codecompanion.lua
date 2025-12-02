-- Credits to https://github.com/franco-ruggeri
-- If available, open the last chat, otherwise open a new chat
local function open_chat()
  local chat = require("codecompanion.strategies.chat").last_chat()
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
  enabled = false,
  cmd = "CodeCompanion",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      version = false,
    },
    "ravitemer/mcphub.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    { "franco-ruggeri/codecompanion-spinner.nvim" },
  },
  opts = {
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    }
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
    { "<Leader>Ah", "<Cmd>CodeCompanionHistory<CR>", desc = "[A]I CodeCompanion chat [h]istory" },
  },
  cmd = {
    "CodeCompanionActions",
    "CodeCompanionChat",
    "CodeCompanionCmd",
    "CodeCompanion",
    "CodeCompanionHistory",
  },
  opts = {
    strategies = {
      chat = {
        roles = { -- make rendered roles nicer
          llm = function(adapter)
            return (" %s"):format(adapter.formatted_name)
          end,
          user = " User",
        },
      },
    },
    extensions = {
      history = {
        opts = {
          expiration_days = 7,
          chat_filter = function(chat_data) -- only chats for the cwd
            return chat_data.cwd == vim.fn.getcwd()
          end,
          -- WARNING: The models used for titles and summaries default to the models used in the chats.
          -- So, it is crucial to set them, in order not to waste requests potentially from premium models.
          -- ====================
          title_generation_opts = {
            adapter = "copilot",
            model = "gpt-4.1",
          },
          summary = {
            generation_opts = {
              adapter = "copilot",
              model = "gpt-4.1",
            },
          },
          -- ====================
        },
      },
      spinner = {
      },
      mcphub = { callback = "mcphub.extensions.codecompanion" },
    },
  },
  config = function(_, opts)
    require("codecompanion").setup(opts)
  end,
}
