return {
  --[[ COLORSCHEME ]]
  {
    "folke/tokyonight.nvim",
    -- "loctvl842/monokai-pro.nvim",
    -- "rebelot/kanagawa.nvim",
    -- "sainnhe/gruvbox-material",
    -- "olimorris/onedarkpro.nvim",
    -- "projekt0n/github-nvim-theme",
    -- "Shatur/neovim-ayu",
    -- "scottmckendry/cyberdream.nvim",
    -- "e-q/okcolors.nvim", name = "okcolors",
    lazy = false,
    priority = 1000,
     config = function()
       require('config.colorschemes.tokyonight')
       -- require('config.colorschemes.monokai_pro')
       -- require('config.colorschemes.kanagawa')
       -- require('config.colorschemes.gruvbox_material')
       -- require('config.colorschemes.cyberdream')
       -- vim.cmd [[colorscheme onedark]]
       -- vim.cmd [[colorscheme github_dark_dimmed]]
       -- vim.cmd [[colorscheme ayu-dark]]
       -- vim.cmd [[colorscheme okcolors-smooth]]
     end,
  },
  --[[ END COLORSCHEME ]]
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
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
    "hrsh7th/nvim-cmp",
    priority = 1000,
    lazy = false,
  },
  {
    "hrsh7th/cmp-buffer",
    lazy = false,
  },
  {
    "hrsh7th/cmp-vsnip",
    lazy = false,
  },
  {
    "hrsh7th/vim-vsnip",
    lazy = false,
  },
  {
    "hrsh7th/cmp-path",
    lazy = false,
  },
  {
    "hrsh7th/cmp-calc",
    lazy = false,
  },
  {
    "hrsh7th/cmp-cmdline",
    lazy = false,
  },
  {
    "ray-x/cmp-treesitter",
    lazy = false,
  },
  {
    "lukas-reineke/cmp-rg",
    lazy = false,
  },
  {
    "quangnguyen30192/cmp-nvim-tags",
    lazy = false,
  },
  {
    "rafamadriz/friendly-snippets",
    lazy = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        highlight = {
          enable = true,
          --[[ disable = { "embedded_template" } ]]
        },
        indent = {
          enable = true
        },
        matchup = {
          enable = true
        }
      }
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    config = function()
      require("statuscol").setup({
        separator = " ",
        setopt = true,
      })
    end
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end
  },
  {
    "nacro90/numb.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("numb").setup{
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true -- Enable 'cursorline' for the window while peeking
      }
    end,
  },
  {
    "tpope/vim-rails",
    event = { "BufReadPre", "BufNewFile" },
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
  },
  {
    "tpope/vim-abolish",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-sleuth",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-bundler",
    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "tpope/vim-repeat",
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
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "ludovicchabant/vim-gutentags",
    lazy = false,
    config = function()
      vim.cmd('set tags+=tags,.git/tags')
      vim.g.gutentags_enabled = 1
      vim.g.gutentags_generate_on_missing = 1
      vim.g.gutentags_generate_on_write = 1
      vim.g.gutentags_resolve_symlinks = 1
      vim.g.gutentags_ctags_tagfile = '.git/tags'
      vim.g.gutentags_project_root = { '.git' }
      vim.g.gutentags_ctags_extra_args = { '--fields=+l' }
      vim.g.gutentags_add_default_project_roots = 0
      vim.g.gutentags_ctags_executable_ruby = 'ripper-tags'
      vim.g.gutentags_ctags_extra_args_ruby = { '--ignore-unsupported-options', '--recursive' }
      -- vim.g.gutentags_trace = 1
    end,
  },
  {
    "nvim-neotest/nvim-nio",
    event = 'VeryLazy'
  },
  {
    "rcarriga/nvim-dap-ui",
    event = 'VeryLazy',
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = 'VeryLazy',
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = 'VeryLazy',
    config = function()
      require("todo-comments").setup {}
    end,
  },
  {
    "folke/which-key.nvim",
    event = 'VeryLazy',
    config = function()
      require("which-key").setup({
        window = {
          border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
        },
        triggers_blacklist = {
          n = { "d", "y" }
        }
      })
    end,
  },
  {
    "airblade/vim-rooter",
    lazy = false,
    config = function()
      vim.g.rooter_silent_chdir = 1
      vim.g.rooter_cd_cmd = 'lcd'
      vim.g.rooter_resolve_links = 1
      vim.g.rooter_patterns = { '.git', '.git/' }
    end,
  },
  {
    "jeffkreeftmeijer/vim-numbertoggle",
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = false,
        tmux = false,
        twilight = true,
      },
    },
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
    "kazhala/close-buffers.nvim",
    event = 'VeryLazy',
  },
  {
    "folke/twilight.nvim",
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
    "chrisgrieser/nvim-spider",
    event = 'VeryLazy',
    keys = {
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
      },
		},
  },
  {
    "nvim-pack/nvim-spectre",
    event = 'VeryLazy',
  },
  {
    'MagicDuck/grug-far.nvim',
    event = 'VeryLazy',
    config = function()
      require('grug-far').setup({
        keymaps = {
          replace = '<leader>r',
          qflist = '<C-q>',
          gotoLocation = '<enter>',
          close = '<C-x>'
        },
      });
    end
  },
  {
    "folke/trouble.nvim",
    event = 'VeryLazy',
  },
  {
    "RRethy/vim-illuminate",
    event = 'VeryLazy',
  },
  {
    "folke/edgy.nvim",
    event = "BufReadPost",
    opts = {
      fix_win_height = vim.fn.has "nvim-0.10.0" == 0,
      options = {
        left = { size = 40 },
        bottom = { size = 10 },
        right = { size = 40 },
        top = { size = 10 },
      },
      bottom = {
        {
          ft = "spectre_panel",
          title = "SPECTRE",
          size = { height = 0.4 },
        },
        {
          ft = "toggleterm",
          title = "TERMINAL",
          size = { height = 0.4 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "Trouble",
          title = "TROUBLE",
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        { ft = "qf", title = "QUICKFIX" },
        {
          ft = "noice",
          size = { height = 0.4 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'smoka7/hydra.nvim',
    },
    opts = function()
      local N = require 'multicursors.normal_mode'
      local I = require 'multicursors.insert_mode'
      return {
        normal_keys = {
          -- to change default lhs of key mapping change the key
          [','] = {
            -- assigning nil to method exits from multi cursor mode
            method = N.clear_others,
            -- you can pass :map-arguments here
            opts = { desc = 'Clear others' },
          },
        },
        insert_keys = {
          -- to change default lhs of key mapping change the key
          ['<CR>'] = {
            -- assigning nil to method exits from multi cursor mode
            method = I.Cr_method,
            -- you can pass :map-arguments here
            opts = { desc = 'New line' },
          },
        },
        hint_config = {
          border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
        },
        generate_hints = {
          normal = true,
          insert = true,
          extend = true,
        },
      }
    end,
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
      {
        mode = { 'v', 'n' },
        '<Leader>mc',
        '<cmd>MCstart<cr>',
        desc = 'Create a selection for selcted text or word under the cursor',
      },
    },
  },
  {
    'weizheheng/ror.nvim'
  },
  {
  "otavioschwanck/arrow.nvim",
    event = 'VeryLazy',
    opts = {
      show_icons = true,
      leader_key = '-'
    }
  },
  {
    "ton/vim-bufsurf",
    event = 'VeryLazy'
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = 'VeryLazy',
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    keys = {
      { "<leader>gb", "<cmd>BlameToggle virtual<CR>", desc = "Git blame" },
    },
    config = function()
      require("blame").setup()
    end
  },
  {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = {
      { "<leader>gd",function() if next(require('diffview.lib').views) == nil then vim.cmd('DiffviewOpen') else vim.cmd('DiffviewClose') end end, desc = "Git diff" },
    },
    config = function()
      require("diffview").setup({
        view = {
          file_history = {
            layout = "diff2_vertical",
          },
        },
      })
    end
  },
  {
    "gen740/SmoothCursor.nvim",
    event = "VeryLazy",
    config = function()
      require("smoothcursor").setup({
      disable_float_win = true,
      disabled_filetypes = { "TelescopePrompt" },
      cursor = "",
      texthl = "String",
      })
    end
  },
  {
    "mvllow/modes.nvim",
    tag = "v0.2.0",
    event = "VeryLazy",
    config = function()
      require("modes").setup({
        ignore_filetypes = { 'NvimTree', 'TelescopePrompt', 'alpha' }
      })
    end,
  },
  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup({})
    end
  },
  {
    "NeogitOrg/neogit",
    branch = "nightly",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
    },
    config = true
  },
  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- "ibhagwan/fzf-lua",
      "nvim-tree/nvim-web-devicons",
    },
    config = function ()
      require"octo".setup()
    end
  },
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup({
         keymaps = {
            accept_suggestion = "<C-l>",
            clear_suggestion = "<C-]>",
          },
      })
    end,
  },
}
