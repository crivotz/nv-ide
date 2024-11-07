return {
  {
    "Shatur/neovim-ayu",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme ayu-dark]]
    end,
  }
}
