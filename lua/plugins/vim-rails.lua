return {
  "tpope/vim-rails",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
  },
  config = function()
    -- disable autocmd set filetype=eruby.yaml
    vim.api.nvim_create_autocmd(
      { 'BufNewFile', 'BufReadPost' },
      {
        pattern = { '*.yml' },
        callback = function()
          vim.bo.filetype = 'yaml'
        end
      }
    )
  end
}
