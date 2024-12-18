return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  -- optional: provides snippets for the snippet source
  dependencies = {
    "rafamadriz/friendly-snippets",
    "giuxtaposition/blink-cmp-copilot",
    "mikavilpas/blink-ripgrep.nvim",
  },

  -- use a release tag to download pre-built binaries
  version = "v0.*",
  -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- see the "default configuration" section below for full documentation on how to define
    -- your own keymap.
    keymap = { preset = "default" },

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- will be removed in a future release
      use_nvim_cmp_as_default = true,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "mono"
    },

    -- default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, via `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "dadbod", "copilot", "ripgrep" },
      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink"
        },
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
          transform_items = function(_, items)
            local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
            local kind_idx = #CompletionItemKind + 1
            CompletionItemKind[kind_idx] = "Copilot"
            for _, item in ipairs(items) do
              item.kind = kind_idx
            end
            return items
          end,
        },
      },
      ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          -- the options below are optional, some default values are shown
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {
            -- For many options, see `rg --help` for an exact description of
            -- the values that ripgrep expects.

            -- the minimum length of the current word to start searching
            -- (if the word is shorter than this, the search will not start)
            prefix_min_len = 3,

            -- The number of lines to show around each match in the preview
            -- (documentation) window. For example, 5 means to show 5 lines
            -- before, then the match, and another 5 lines after the match.
            context_size = 5,

            -- The maximum file size of a file that ripgrep should include in
            -- its search. Useful when your project contains large files that
            -- might cause performance issues.
            -- Examples:
            -- "1024" (bytes by default), "200K", "1M", "1G", which will
            -- exclude files larger than that size.
            max_filesize = "1M",

            -- (advanced) Any additional options you want to give to ripgrep.
            -- See `rg -h` for a list of all available options. Might be
            -- helpful in adjusting performance in specific situations.
            -- If you have an idea for a default, please open an issue!
            --
            -- Not everything will work (obviously).
            additional_rg_options = {},
          },
        },
    },
    appearance = {
      -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
      kind_icons = {
        Copilot = "",
        Text = '󰉿',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '󰒓',

        Field = '󰜢',
        Variable = '󰆦',
        Property = '󰖷',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '󰅩',

        Unit = '󰪚',
        Value = '󰦨',
        Enum = '󰦨',
        EnumMember = '󰦨',

        Keyword = '󰻾',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '󰬲',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰬛',
      },
    },

    -- experimental signature help support
    -- signature = { enabled = true }
  },
  -- allows extending the providers array elsewhere in your config
  -- without having to redefine it
  opts_extend = { "sources.default" }
}
