return {
  {
    "nvim-lua/popup.nvim",
    lazy = false,
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "MunifTanjim/nui.nvim",
    lazy = false,
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
  },
  {
    "onsails/lspkind-nvim",
    lazy = false,
  },
  {
    "tpope/vim-abolish",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-bundler",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-endwise",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-dispatch",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-repeat",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    opts = {},
    keys = {
      { "<leader>tT", function () Snacks.picker.todo_comments({ keywords = { "TODO" } }) end, desc = "Todo" },
      { "<leader>tF", function () Snacks.picker.todo_comments({ keywords = { "FIX", "FIXME" } }) end, desc = "Fix/Fixme" },
      { "<leader>tN", function () Snacks.picker.todo_comments({ keywords = { "NOTE" } }) end, desc = "Note" },
    },
  },
  {
    "jeffkreeftmeijer/vim-numbertoggle",
    lazy = false,
  },
  {
    "lambdalisue/suda.vim",
    event = 'VeryLazy',
  },
  {
    "chrisbra/csv.vim",
    event = 'VeryLazy',
  },
  {
    "zdharma-continuum/zinit-vim-syntax",
    event = 'VeryLazy',
  },
  {
    "nvim-tree/nvim-web-devicons",
    event = 'VeryLazy',
  },
  {
    "RRethy/vim-illuminate",
    event = 'VeryLazy',
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
  },
  {
    "xzbdmw/colorful-menu.nvim",
    lazy = false
  }
}
