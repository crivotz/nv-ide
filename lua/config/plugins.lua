return {
  --[[ COLORSCHEME ]]
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = true,
    priority = 1000,
     config = function()
       require('config.colorschemes.tokyonight')
     end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = false,
    priority = 1000,
     config = function()
       require('config.colorschemes.gruvbox')
     end,
  },
  {
   "projekt0n/github-nvim-theme",
    lazy = false,
    enabled = false,
    priority = 1000,
     config = function()
       require('config.colorschemes.github')
     end,
  },
  --[[ END COLORSCHEME ]]
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
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'UIEnter',
    opts = {
      exclude = {
        -- stylua: ignore
        filetypes = {
          'dbout', 'neo-tree-popup', 'log', 'gitcommit',
          'txt', 'help', 'NvimTree', 'git', 'flutterToolsOutline',
          'undotree', 'markdown', 'norg', 'org', 'orgagenda',
        },
      },
      indent = {
        char = '│', -- ▏┆ ┊ 
        tab_char = '│',
      },
      scope = {
        char = '▎',
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      },
      --[[ show_first_indent_level = true, ]]
    },
    config = function(_, opts)
      require('ibl').setup(opts)
      local hooks = require('ibl.hooks')
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    end,
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
    "tpope/vim-capslock",
    lazy = false,
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
    "chaoren/vim-wordmotion",
    event = 'VeryLazy',
  },
  {
    "windwp/nvim-spectre",
    event = 'VeryLazy',
  },
  {
    "folke/trouble.nvim",
    event = 'VeryLazy',
  },
  {
    "mrbjarksen/neo-tree-diagnostics.nvim",
    event = 'VeryLazy',
  },
  {
    "RRethy/vim-illuminate",
    event = 'VeryLazy',
  },
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        left = { size = 40 },
        bottom = { size = 10 },
        right = { size = 40 },
        top = { size = 10 },
      },
      bottom = {
        {
          ft = "toggleterm",
          title = "TERMINAL",
          size = { height = 0.4 },
          filter = function(buf, win)
            return vim.api.nvim_win_get_config(win).relative == ""
          end,
        },
        { ft = "spectre_panel", title = "SPECTRE", size = { height = 0.4 } },
        { ft = "Trouble", title = "TROUBLE" },
        { ft = "qf", title = "QUICKFIX" },
        {
          ft = "help",
          size = { height = 20 },
          -- only show help buffers
          filter = function(buf)
            return vim.bo[buf].buftype == "help"
          end,
        },
      },
      left = {
        {
          title = "  FILE",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = { height = 0.7 },
        },
        {
          title = "  GIT",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "git_status"
          end,
          pinned = true,
          open = "Neotree position=right git_status",
        },
        {
          title = "  BUFFERS",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "buffers"
          end,
          pinned = true,
          open = "Neotree position=top buffers",
        },
        {
          ft = "裂 DIAGNOSTICS",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "diagnostics"
          end,
          pinned = true,
          open = "Neotree position=right diagnostics",
        },
        {
          title = "  OUTLINE",
          ft = "Outline",
          pinned = true,
          open = "SymbolsOutline",
        },
        "neo-tree",
      },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      position = "right",
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          -- default options: exact mode, multi window, all directions, with a backdrop
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the cursor
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          -- jump to a remote location to execute the operator
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the search matches
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      }
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
    '2kabhishek/co-author.nvim',
    dependencies = { 'stevearc/dressing.nvim' },
    cmd = 'GitCoAuthors',
  },
  {
    'axkirillov/hbac.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
    config = function ()
      require("hbac").setup({
        autoclose     = true, -- set autoclose to false if you want to close manually
        threshold     = 10, -- hbac will start closing unedited buffers once that number is reached
        close_command = function(bufnr)
          vim.api.nvim_buf_delete(bufnr, {})
          echo "󰃢 Some cleaning!"
        end,
  close_buffers_with_windows = false, -- hbac will close buffers with associated windows if this option is `true`
      })
    end
  }
}
