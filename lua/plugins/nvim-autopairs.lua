return {
  "windwp/nvim-autopairs",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('nvim-autopairs').setup({
        --[[ map_cr = false, ]]
      })
  end,
}
