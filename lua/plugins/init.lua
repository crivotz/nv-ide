return {
  --[[ COLORSCHEME ]]
  {
    "folke/tokyonight.nvim",
    -- "rose-pine/neovim", name = "rose-pine",
    -- "loctvl842/monokai-pro.nvim",
    -- "rebelot/kanagawa.nvim",
    -- "sainnhe/gruvbox-material",
    -- "olimorris/onedarkpro.nvim",
    -- "projekt0n/github-nvim-theme",
    -- "Shatur/neovim-ayu",
    -- "scottmckendry/cyberdream.nvim",
    -- "e-q/okcolors.nvim", name = "okcolors",
    -- enabled = false,
    lazy = false,
    priority = 1000,
     config = function()
       require('config.colorschemes.tokyonight')
       -- require('config.colorschemes.rosepine')
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
  --[[ UI ]]
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
  --[[ END UI ]]
  {
    "hrsh7th/nvim-cmp",
    priority = 1000,
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-cmdline",
      "ray-x/cmp-treesitter",
      "lukas-reineke/cmp-rg",
      "quangnguyen30192/cmp-nvim-tags",
      "rafamadriz/friendly-snippets",
    }
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
    'weizheheng/ror.nvim'
  },
  {
    "tpope/vim-rails",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "tpope/vim-abolish",
      "tpope/vim-bundler",
      "tpope/vim-endwise",
      "tpope/vim-dispatch",
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
    "folke/todo-comments.nvim",
    event = 'VeryLazy',
    config = function()
      require("todo-comments").setup {}
    end,
  },
  {
    "folke/which-key.nvim",
    event = 'VeryLazy',
    opts = {
        win = {
          border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
        },
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
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
    config = function()
      require("spider").setup {
        skipInsignificantPunctuation = false,
      }
    end
  },
  {
    'MagicDuck/grug-far.nvim',
    event = 'VeryLazy',
    keys = {
      {
        "<leader>sr",
        "<cmd>lua require('grug-far').toggle_instance({ instanceName='far', staticTitle='Search and Replace' })<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "<leader>srw",
        "<cmd>lua require('grug-far').grug_far({ prefills = { search = vim.fn.expand('<cword>') } })<CR>",
        mode = { "n", "o", "x" },
      },
      -- I use nvim-rip-substitute for file search and replace
      -- {
      --   "<leader>srf",
      --   "<cmd>lua require('grug-far').grug_far({ prefills = { flags = vim.fn.expand('%') } })<CR>",
      --   mode = { "n", "o", "x" },
      -- },
    },
    config = function()
      require('grug-far').setup({
        -- startInInsertMode = false,
      });
    end
  },
  {
    "folke/trouble.nvim",
    event = 'VeryLazy',
    config = function()
      require('trouble').setup({
      })
    end
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
      right = {
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
    opts = {
      modes = {
        search = {
          enabled = true,
        }
      }
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
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
    event = 'VeryLazy',
  },
  {
    "brenoprata10/nvim-highlight-colors",
    event = 'VeryLazy',
    config = function()
      require('nvim-highlight-colors').setup({
        render = "virtual",
        virtual_symbol = '■',
        -- virtual_symbol = '',
        -- virtual_symbol = '',
        -- virtual_symbol = '󰉦',
      })
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
    "chentoast/marks.nvim",
    event = "VeryLazy",
    config = function()
      require("marks").setup({})
    end
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    lazy = false,
    enabled = true,
    config = function ()
      require("hardtime").setup({
        disable_mouse = false,
        disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "grug-far", "dbui", "Trouble", "trouble" },
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
    "chrisgrieser/nvim-rip-substitute",
    lazy = "VeryLazy",
    keys = {
      {
        "<leader>srf",
          function() require("rip-substitute").sub() end,
          mode = { "n", "x" },
          desc = " rip substitute",
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken", -- Only on MacOS or Linux
    opts = {
      debug = false, -- Enable debugging
      model = "claude-3.5-sonnet",
      question_header = '## User ', -- Header to use for user questions
      answer_header = '## Copilot ', -- Header to use for AI answers
      error_header = '## Error ', -- Header to use for errors
    },
    keys = {
      { "<leader>c", ":CopilotChatToggle<CR>", desc = "Copilot toggle" },
      {
        "<leader>cs",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
          end
        end,
        desc = "CopilotChat - Quick chat selected",
        mode = { "v" },
      },
      {
        "<leader>cch",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
  -- Show prompts actions with telescope
      {
        "<leader>ccp",
        function()
          local actions = require("CopilotChat.actions")
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
  },
}
