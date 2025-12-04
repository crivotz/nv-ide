-- vim.api.nvim_create_autocmd("User", {
--   pattern = "BlinkCmpMenuOpen",
--   callback = function()
--     vim.b.copilot_suggestion_hidden = true
--   end,
-- })
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "BlinkCmpMenuClose",
--   callback = function()
--     vim.b.copilot_suggestion_hidden = false
--   end,
-- })
return {
  "zbirenbaum/copilot.lua",
  -- requires = {
  --   "copilotlsp-nvim/copilot-lsp",
  --   init = function()
  --     vim.g.copilot_nes_debounce = 500
  --   end,
  enabled = false,
  cmd = "Copilot",
  event = "InsertEnter",
    opts = {
      panel = {
        enabled = false,
      },
      suggestion = {
        -- enabled = true,
        auto_trigger = false, -- Automatically show suggestions. If false, use keymap accept, next or prev to trigger suggestion.
        keymap = {
          accept = false, -- Use custom keymap in keys section instead '<Tab>'.
          accept_word = '<C-f>',
          accept_line = '<C-F>',
          next = '<C-g>', -- '<M-]>'
          prev = '<C-G>', -- '<M-[>'
          dismiss = '<C-e>',
        },
      },
      nes = {
        enabled = false,
      },
    },
    keys = {
      {
        '<Leader>taa',
        function()
          if require('copilot.client').is_disabled() then
            require('copilot.command').enable()
            vim.notify('Copilot enabled')
          else
            require('copilot.command').disable()
            vim.notify('Copilot disabled')
          end
        end,
        desc = 'Toggle Copilot',
      },
      {
        '<Tab>',
        function()
          if require('copilot.suggestion').is_visible() then
            require('copilot.suggestion').accept()
            return
          end
          return '<Tab>' -- Fallback to normal tab.
        end,
        mode = { 'i' },
        desc = 'Copilot: Accept',
        expr = true,
      },
    },
  }
