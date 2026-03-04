return {
  "folke/sidekick.nvim",
  opts = {
    cli = {
      prompts = {
        commit = "Please propose a commit message for staged files",
        refactor = "Please propose a refactor for the attached file {file}",
        haunt_all = function()
          return require("haunt.sidekick").get_locations()
        end,
        haunt_buffer = function()
          return require("haunt.sidekick").get_locations({ current_buffer = true })
        end,
      },
      mux = {
        backend = "tmux",
        enabled = true,
      },
    },
  },
  keys = {
    {
      "<leader>ac",
      function()
        require("sidekick.cli").toggle({ name = "copilot", focus = true })
      end,
      desc = "Sidekick Toggle Copilot",
    },
  },
}
