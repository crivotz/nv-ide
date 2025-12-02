return {
  "saghen/blink.cmp",
  lazy = false, -- lazy loading handled internally
  dependencies = {
    "rafamadriz/friendly-snippets",
    "fang2hou/blink-copilot",
    "mikavilpas/blink-ripgrep.nvim",
    "xzbdmw/colorful-menu.nvim",
  },

  version = "v0.*",
  opts = {
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    keymap = {
      preset = "super-tab",
      ['<A-1>'] = { function(cmp) cmp.accept({ index = 1 }) end },
      ['<A-2>'] = { function(cmp) cmp.accept({ index = 2 }) end },
      ['<A-3>'] = { function(cmp) cmp.accept({ index = 3 }) end },
      ['<A-4>'] = { function(cmp) cmp.accept({ index = 4 }) end },
      ['<A-5>'] = { function(cmp) cmp.accept({ index = 5 }) end },
      ['<A-6>'] = { function(cmp) cmp.accept({ index = 6 }) end },
      ['<A-7>'] = { function(cmp) cmp.accept({ index = 7 }) end },
      ['<A-8>'] = { function(cmp) cmp.accept({ index = 8 }) end },
      ['<A-9>'] = { function(cmp) cmp.accept({ index = 9 }) end },
      ['<A-0>'] = { function(cmp) cmp.accept({ index = 10 }) end },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
      kind_icons = {
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
    completion = {
      menu = {
        border = "single",
        -- highlight = 'VertSplit',
        draw = {
          -- columns = { { 'item_idx' }, { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
          -- components = {
            --   item_idx = {
              --     text = function(ctx) return ctx.idx == 10 and '0' or ctx.idx >= 10 and ' ' or tostring(ctx.idx) end,
              --     highlight = 'Constant' -- optional, only if you want to change its color
              --   }
              -- }
              columns = { { "kind_icon" }, { "label", gap = 1 } },
              components = {
                label = {
                  text = require("colorful-menu").blink_components_text,
                  highlight = require("colorful-menu").blink_components_highlight,
                },
              },
            }
          },
          documentation = {
            window = {
              border = "single",
            }
          }
        },
        signature = { window = { border = 'single' } },
        cmdline = { enabled = true },
        sources = {
          default = {  "lsp", "path", "snippets", "buffer", "copilot", "dadbod", "ripgrep" },
          providers = {
            copilot = {
              name = "copilot",
              module = "blink-copilot",
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
                -- prefix_min_len = 3,
                -- context_size = 5,
                -- max_filesize = "1M",
                -- additional_rg_options = {},
              },
            },
          },
        },
      },
      opts_extend = {
        "sources.default",
        "sources.providers",
      },
    }
