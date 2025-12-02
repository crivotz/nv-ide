return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      prompts = {
        commit = "Please propose a commit message for staged files",
      },
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
    nes = {
      enabled = true,
    }
  },
  keys = {
    {
      "<tab>",
      function()
        -- if there is a next edit, jump to it, otherwise apply it if any
        if not require("sidekick").nes_jump_or_apply() then
          return "<Tab>" -- fallback to normal tab
        end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-.>",
      function() require("sidekick.cli").toggle() end,
      desc = "Sidekick Toggle",
      mode = { "n", "t", "i", "x" },
    },
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle() end,
      desc = "Sidekick Toggle CLI",
    },
    {
      "<leader>as",
      function() require("sidekick.cli").select() end,
      -- Or to select only installed tools:
      -- require("sidekick.cli").select({ filter = { installed = true } })
      desc = "Select CLI",
    },
    {
      "<leader>ad",
      function() require("sidekick.cli").close() end,
      desc = "Detach a CLI Session",
    },
    {
      "<leader>at",
      function() require("sidekick.cli").send({ msg = "{this}" }) end,
      mode = { "x", "n" },
      desc = "Send This",
    },
    {
      "<leader>ar",
      function() require("sidekick.cli").send({ msg = "{range}" }) end,
      desc = "Send Range",
    },
    {
      "<leader>ab",
      function() require("sidekick.cli").send({ msg = "{buffers}" }) end,
      desc = "Send Buffers",
    },
    {
      "<leader>al",
      function() require("sidekick.cli").send({ msg = "{line}" }) end,
      desc = "Send Line",
    },
    {
      "<leader>af",
      function() require("sidekick.cli").send({ msg = "{file}" }) end,
      desc = "Send File",
    },
    {
      "<leader>av",
      function() require("sidekick.cli").send({ msg = "{selection}" }) end,
      mode = { "x" },
      desc = "Send Visual Selection",
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      mode = { "n", "x" },
      desc = "Sidekick Select Prompt",
    },
    -- Example of a keybinding to open Copilot directly
    {
      "<leader>ac",
      function() require("sidekick.cli").toggle({ name = "copilot", focus = true }) end,
      desc = "Sidekick Toggle Copilot",
    },
  },
}
