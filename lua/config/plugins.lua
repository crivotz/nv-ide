return {
  -- Colorschema
  'sainnhe/gruvbox-material',
  -- 'catppuccin/nvim', as = "catppuccin",
  -- 'olimorris/onedarkpro.nvim',
  -- 'folke/tokyonight.nvim',
  'MunifTanjim/nui.nvim',
  -- LSP
  {'williamboman/mason.nvim',
  config = function()
    require("mason").setup({
      ui = {
        border = {"┏", "━", "┓", "┃", "┛", "━", "┗", "┃"},
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    })
  end,
},
{'williamboman/mason-lspconfig.nvim',
config =function()
  require("mason-lspconfig").setup({
    ensure_installed = { "html", "tsserver", "solargraph", "cssls", "dockerls", "jsonls", "yamlls", "vimls", "rust_analyzer" }
  })
end,
},
'neovim/nvim-lspconfig',
'onsails/lspkind-nvim',
'weilbith/nvim-code-action-menu',
-- Autocomplete
'hrsh7th/nvim-cmp',
'hrsh7th/cmp-nvim-lsp',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-vsnip',
'hrsh7th/vim-vsnip',
'hrsh7th/cmp-path',
'hrsh7th/cmp-calc',
'hrsh7th/cmp-cmdline',
'ray-x/cmp-treesitter',
'lukas-reineke/cmp-rg',
'quangnguyen30192/cmp-nvim-tags',
'rafamadriz/friendly-snippets',
{'windwp/nvim-ts-autotag',
config = function()
  require('nvim-ts-autotag').setup()
end,
},
'andymass/vim-matchup',
-- Treesitter
'David-Kunz/markid',
{'nvim-treesitter/nvim-treesitter',
config = function()
  require'nvim-treesitter.configs'.setup {
    markid = { 
      enable = true,
      colors = false 
    },
    ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
      enable = true,              -- false will disable the whole extension
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    matchup = {
      enable = true  
    }
  }
end,
},
{'p00f/nvim-ts-rainbow',
config = function()
  require'nvim-treesitter.configs'.setup {
    rainbow = {
      enable = true
    }
  }
end,
},
{ 'lukas-reineke/indent-blankline.nvim',
config = function()
  require("indent_blankline").setup {
    buftype_exclude = {'terminal'},
    filetype_exclude = {'trouble', 'noice', 'help', 'startify', 'alpha', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'mason.nvim'},
    char = '▏',
    show_current_context = true,
    show_current_context_start = true,  -- underline first line
    use_treesitter = true,
    show_trailing_blankline_indent = false,
  }
end,
},
'JoosepAlviste/nvim-ts-context-commentstring',
'lewis6991/nvim-treesitter-context',
{'SmiteshP/nvim-gps',
config = function()
  require("nvim-gps").setup({
    icons = {
      ["class-name"] = ' ',      -- Classes and class-like objects
      ["function-name"] = ' ',   -- Functions
      ["method-name"] = ' ',     -- Methods (functions inside class-like objects)
      ["container-name"] = '⛶ ',  -- Containers (example: lua tables)
      ["tag-name"] = '炙'         -- Tags (example: html tags)
    }
  })
end,
},
-- Syntax
'chrisbra/csv.vim',
'junegunn/vim-easy-align',
'zdharma-continuum/zinit-vim-syntax',
-- Icons
'nvim-tree/nvim-web-devicons',
-- Status Line and Bufferline
'kazhala/close-buffers.nvim',
-- Telescope
-- Color
-- Git
'rhysd/committia.vim',
-- Registers & clipboard
{ 'AckslD/nvim-neoclip.lua',
config = function()
  require('neoclip').setup()
end
},
-- Move & Search & replace
{ 'nacro90/numb.nvim',
config = function()
  require('numb').setup{
    show_numbers = true, -- Enable 'number' for the window while peeking
    show_cursorline = true -- Enable 'cursorline' for the window while peeking
  }
end,
},
'ggandor/lightspeed.nvim',
{'karb94/neoscroll.nvim',
config = function()
  require('neoscroll').setup()
end,
},
'chaoren/vim-wordmotion',
'windwp/nvim-spectre',
'fedepujol/move.nvim',
-- Tim Pope docet
'tpope/vim-rails',
'tpope/vim-abolish',
'tpope/vim-sleuth',
'tpope/vim-bundler',
'tpope/vim-capslock',
'tpope/vim-repeat',
'tpope/vim-endwise',
'tpope/vim-dispatch',
'tpope/vim-dadbod',
'tpope/vim-jdaddy',
'tpope/vim-fugitive',
-- Tmux
'christoomey/vim-tmux-navigator',
-- Tags
{'ludovicchabant/vim-gutentags',
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
-- Debugger
{'rcarriga/nvim-dap-ui',
config = function()
  require("dapui").setup()
end,
},
{'theHamsta/nvim-dap-virtual-text',
config = function()
  require("nvim-dap-virtual-text").setup()
end,
},
-- General Plugins
{'machakann/vim-sandwich',
config = function()
  vim.cmd([[
  runtime macros/sandwich/keymap/surround.vim

  " Text objects to select
  " the nearest surrounded text automatically
  xmap iss <Plug>(textobj-sandwich-auto-i)
  xmap ass <Plug>(textobj-sandwich-auto-a)
  omap iss <Plug>(textobj-sandwich-auto-i)
  omap ass <Plug>(textobj-sandwich-auto-a)

  " remap to override again
  xmap S <Plug>Lightspeed_S
  let g:sandwich#recipes += [
  \   {
    \     'buns':     ['<%= ', ' %>'],
    \     'filetype': ['eruby'],
    \     'input':    ['='],
    \     'nesting':  1
    \   },
    \   {
      \     'buns':     ['<% ', ' %>'],
      \     'filetype': ['eruby'],
      \     'input':    ['-'],
      \     'nesting':  1
      \   },
      \   {
        \     'buns':     ['<%# ', ' %>'],
        \     'filetype': ['eruby'],
        \     'input':    ['#'],
        \     'nesting':  1
        \   }
        \ ]
        ]])
      end,
    },
    'folke/trouble.nvim',
    {'folke/todo-comments.nvim',
    config = function()
      require("todo-comments").setup {}
    end,
  },
  { 'folke/which-key.nvim',
  config = function()
    require("which-key").setup({
      window = {
        border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
      },
    })
  end,
},
{'airblade/vim-rooter',
config = function()
  vim.g.rooter_silent_chdir = 1
  vim.g.rooter_cd_cmd = 'lcd'
  vim.g.rooter_resolve_links = 1
  vim.g.rooter_patterns = { '.git', '.git/' }
end,
},
'jeffkreeftmeijer/vim-numbertoggle',
'lambdalisue/suda.vim',
{'wfxr/minimap.vim',
config = function()
  vim.g.minimap_width = 10
  vim.g.minimap_auto_start = 0
  vim.g.minimap_auto_start_win_enter = 0
  vim.g.minimap_highlight_range = 1
end,
},
{ 'beauwilliams/focus.nvim',
config = function()
  require("focus").setup({})
end,
},
{'kevinhwang91/nvim-bqf',
config = function()
  require('bqf').setup({
    preview = {
      border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'}
    },
  })
end,
},
-- 'dstein64/vim-startuptime',
}
