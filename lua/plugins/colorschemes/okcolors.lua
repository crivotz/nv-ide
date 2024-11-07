return {
  {
    "e-q/okcolors.nvim", name = "okcolors",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme okcolors-smooth]]
    end,
  }
}

