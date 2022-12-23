local M = {
  "ggandor/leap.nvim",
  event = "VeryLazy",

  dependencies = {
    { "ggandor/flit.nvim" },
  },
}

function M.config()
  require("leap").add_default_mappings(true)
  require('leap').opts.highlight_unlabeled_phase_one_targets = true
  require("flit").setup({
    labeled_modes = "nv",
  })
  vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
  vim.api.nvim_set_hl(0, 'LeapLabelPrimary', { bg = '#d3869b', fg = '#282828', bold = true, nocombine = true })
  vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { bg = '#f9acc1', fg = '#282828', bold = true, nocombine = true })
  vim.api.nvim_set_hl(0, 'LeapMatch', {
    fg = '#ffedc7',  -- for light themes, set to 'black' or similar
    bold = true,
    nocombine = true,
  })
end

return M
