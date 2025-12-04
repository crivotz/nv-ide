return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
    "mikavilpas/blink-ripgrep.nvim",
  },
  version = "1.*",
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    keymap = {
      preset = "enter",
      ["<Tab>"] = {
        function() -- sidekick next edit suggestion
          return require("sidekick").nes_jump_or_apply()
        end,
        function() -- if you are using Neovim's native inline completions
          return vim.lsp.inline_completion.get()
        end,
        "snippet_forward",
        "fallback",
      },
    },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      menu = {
        border = "single"
      },
      documentation = {
        auto_show = true,
        window  = {
          border = "single"
        },
      },
    },
    sources = {
      default = {  "lsp", "path", "snippets", "buffer", "copilot", "dadbod", "ripgrep" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink"
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          opts = {
          },
        },
      },
    },
    cmdline = {
      enabled = true,
      completion = { menu = { auto_show = true } }
    },
    signature = { enabled = true }
  },
  opts_extend = { "sources.default" }
}
