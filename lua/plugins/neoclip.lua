return {
  "AckslD/nvim-neoclip.lua",
  requires = {
    { 'ibhagwan/fzf-lua' }
  },
  config = function()
    require("neoclip").setup()
  end
}
