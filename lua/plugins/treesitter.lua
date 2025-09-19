return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  opts_extend = { "ensure_installed" },
  ---@class lazyvim.TSConfig: TSConfig
  opts = {
    -- LazyVim config for treesitter
    indent = { enable = true },
    highlight = { enable = true },
    matchup = { enable = true },
    folds = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "css",
      "csv",
      "diff",
      "dockerfile",
      "editorconfig",
      "erlang",
      "folds",
      "git_config",
      "gitcommit",
      "gitignore",
      "html",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "php",
      "powershell",
      "printf",
      "python",
      "query",
      "regex",
      "ruby",
      "scss",
      "sql",
      "sway",
      "tmux",
      "toml",
      "tsv",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
      "zig",
    },
  },
  -- config = function()
    --   require'nvim-treesitter.configs'.setup {
      --     ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      --     ignore_install = { "ipkg" },
      --     highlight = {
        --       enable = true,
        --       --[[ disable = { "embedded_template" } ]]
        --       disable = function(lang, buf)
          --       local max_filesize = 100 * 1024 -- 100 KB
          --       local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          --       if ok and stats and stats.size > max_filesize then
          --           return true
          --       end
          --   end,
          --     },
          --     indent = {
            --       enable = true
            --     },
            --     matchup = {
              --       enable = true
              --     }
              --   }
              -- end,
            }
