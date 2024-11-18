  return {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = false, -- Enable debugging
      model = "claude-3.5-sonnet",
      question_header = '## User ', -- Header to use for user questions
      answer_header = '## Copilot ', -- Header to use for AI answers
      error_header = '## Error ', -- Header to use for errors
    },
    keys = {
      { "<leader>c", ":CopilotChatToggle<CR>", desc = "Copilot toggle" },
      { "<leader>cc", ":CopilotChatCommitStaged<CR>", desc = "Copilot create staged" },
      { "<leader>co", ":CopilotChatOptimize<CR>", desc = "Copilot create staged" },
      { "<leader>cr", ":CopilotChatReview<CR>", desc = "Copilot create staged" },
      { "<leader>ce", ":CopilotChatExplain<CR>", desc = "Copilot create staged" },
      {
        "<leader>cq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
          end
        end,
        desc = "CopilotChat - Quick chat selected",
        mode = { "v" },
      },
      {
        "<leader>cch",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
  -- Show prompts actions with telescope
      {
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
  }
