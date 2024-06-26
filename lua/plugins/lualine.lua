local M = {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  enabled = true
}
function M.config()
  local arrow = require("arrow.statusline")
  local navic = require("nvim-navic").setup({
    highlight = true,
    icons = {
      File = ' ',
      Module = ' ',
      Namespace = ' ',
      Package = ' ',
      Class = ' ',
      Method = ' ',
      Property = ' ',
      Field = ' ',
      Constructor = ' ',
      Enum = ' ',
      Interface = ' ',
      Function = ' ',
      Variable = ' ',
      Constant = ' ',
      String = ' ',
      Number = ' ',
      Boolean = ' ',
      Array = ' ',
      Object = ' ',
      Key = ' ',
      Null = ' ',
      EnumMember = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' '
    },
  })

  local lazy = require("lazy.status")
  local colors = {}
  if package.loaded["tokyonight"] then
    colors = require("tokyonight.colors").setup({ transform = true })
  elseif package.loaded["cyberdream"] then
    colors = require("cyberdream.colors")
  elseif package.loaded["okcolors"] then
    colors = require("okcolors.palette")
  elseif package.loaded["neovim-ayu"] then
    colors = require("ayu.colors")
    colors.generate()
  else
    colors = {
      bg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg),
      fg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg),
      black = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "EndOfBuffer", link = false }).fg),
      white = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg),
      red = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Error", link = false }).fg),
      green = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "String", link = false }).fg),
      blue = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Question", link = false }).fg),
      yellow = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Type", link = false }).fg),
      cyan = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Keyword", link = false }).fg),
      orange = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Title", link = false }).fg),
      purple = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Todo", link = false }).fg),
    }
  end
  local filename_with_icon = require("lualine.components.filename"):extend()
  filename_with_icon.apply_icon = require("lualine.components.filetype").apply_icon
  filename_with_icon.icon_hl_cache = {}

  local function shorten_path(path, sep)
    -- ('([^/])[^/]+%/', '%1/', 1)
    return path:gsub(string.format("([^%s])[^%s]+%%%s", sep, sep, sep), "%1" .. sep, 1)
  end

  local function count(base, pattern)
    return select(2, string.gsub(base, pattern, ""))
  end

  local default_options = {
    symbols = { modified = "", readonly = "󰌾", unnamed = "[No Name]" },
    file_status = true,
    path = 0,
    shorting_target = 40,
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand("%:p:h")
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  local scrollbar_component = require("lualine.component"):extend()

  function scrollbar_component:init(opts)
    opts.reverse = opts.reverse or false
    scrollbar_component.super.init(self, opts)
  end

  function scrollbar_component:update_status()
    local scroll_bar_blocks = { '▁', '▂', '▃', '▄', '▅', '▆', '▇', '█' }
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)

    if lines == 0 or curr_line > lines then
      return ''
    end

    if self.options.reverse then
      return string.rep(scroll_bar_blocks[8 - math.floor(curr_line / lines * 7)], 2)
    else
      return string.rep(scroll_bar_blocks[math.floor(curr_line / lines * 7) + 1], 2)
    end
  end

  local options = vim.tbl_deep_extend("keep", {}, default_options)

  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = {
        normal = {
          a = {bg = colors.bg, fg = colors.fg},
          b = {bg = colors.bg, fg = colors.fg},
          c = {bg = colors.bg, fg = colors.fg}
        },
      },
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {
        statusline = { "alpha" },
        winbar = { "alpha", "edgy", "toggleterm", "Trouble", "spectre_panel", "qf", "noice", "dbui" },
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    extension = {
      "mason",
      "lazy",
      -- "neo-tree",
      -- "oil",
      "quickfix",
      "toggleterm",
      "trouble",
    },
    sections = {
      lualine_a = {
        {
          function()
            return ' '
          end,
          color = function()
            local mode_color = {
              n = colors.green,
              i = colors.red,
              v = colors.blue,
              [""] = colors.blue,
              V = colors.blue,
              c = colors.purple,
              no = colors.red,
              s = colors.orange,
              S = colors.orange,
              [""] = colors.orange,
              ic = colors.yellow,
              R = colors.purple,
              Rv = colors.purple,
              cv = colors.red,
              ce = colors.red,
              r = colors.cyan,
              rm = colors.cyan,
              ["r?"] = colors.cyan,
              ["!"] = colors.red,
              t = colors.green,
            }
            return { fg = mode_color[vim.fn.mode()], bg = colors.bg }
          end
        }
      },
      lualine_b = {
        {
          function()
            local dir = vim.fn.expand("%:p:h")

            if dir == vim.fn.getcwd() then
              return " Root"
            else
              local windwidth = options.globalstatus and vim.go.columns or vim.fn.winwidth(0)
              local estimated_space_available = windwidth - options.shorting_target

              local data = vim.fn.fnamemodify(dir, ":~:.")
              for _ = 0, count(data, "/") do
                if windwidth <= 84 or #data > estimated_space_available then
                  data = shorten_path(data, "/")
                end
              end

              return " " .. data
            end
          end,
          cond = conditions.buffer_not_empty,
          color = { fg = colors.violet },
        },
        {
          'filename',
          symbols = { modified = "", readonly = "󰌾", unnamed = "[No Name]" },
          file_status = true,
          path = 0,
          shorting_target = 40,
          cond = conditions.buffer_not_empty,
          colored = true,
          color = function()
            if arrow.is_on_arrow_file() then
              return { fg = colors.green, gui='bold' }
            else
              return { fg = colors.yellow, gui='bold' }
            end
          end,
        },
        {
          function()
            return arrow.text_for_statusline_with_icons()
          end,
          color = { fg = colors.red }
        }
      },
      lualine_c = {
        {
          function()
            return "%="
          end,
        },
      },
      lualine_x = {
        {
          function() return require("noice").api.status.command.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          color = {bg = colors.teal , fg = colors.bg, gui='bold' }
        },
        {
          function() return require("noice").api.status.mode.get() end,
          cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          color = {bg = colors.orange, fg = colors.bg, gui='bold' }
        },
        {
          "diagnostics",
          update_in_insert = true,
          symbols = { error = " ", warn = " ", info = " " },

          diagnostics_color = {
            color_error = { fg = colors.red },
            color_warn = { fg = colors.yellow },
            color_info = { fg = colors.cyan },
          },
          color = { bg = colors.bg }
        },
        {
          function()
            local lsps = vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })
            local icon = require("nvim-web-devicons").get_icon_by_filetype(
              vim.api.nvim_buf_get_option(0, "filetype")
            )
            if lsps and #lsps > 0 then
              local names = {}
              for _, lsp in ipairs(lsps) do
                table.insert(names, lsp.name)
              end
              return string.format("%s %s", table.concat(names, ", "), icon)
            else
              return icon or ""
            end
          end,
          on_click = function()
            vim.api.nvim_command("LspInfo")
          end,
          color = function()
            local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
              vim.api.nvim_buf_get_option(0, "filetype")
            )
            return { fg = color }
          end,
        },
      },
      lualine_y = {
        {
          function()
            return " ﮮ "
          end,
          cond = lazy.has_updates,
          color = { fg = colors.cyan },
        },
        {
          "fileformat",
          symbols = {
            unix = '󰌽', -- e712
            dos = '󰍲',  -- e70f
            mac = '',  -- e711
          },
          color = { fg = colors.purple, gui='bold' },
        },
        {
          "encoding",
          fmt = string.upper,
          color = { fg = colors.blue, gui='bold' },
        },
      },
      lualine_z = {
        {
          function()
            return "󰕭 %-2v"
          end,
          color = { fg = colors.yellow, gui='bold' },
        },
        scrollbar_component,
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {
      lualine_a = {
        {
          function() return require("nvim-navic").get_location() end,
          cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
          color = { fg = colors.blue },
        },
      },
      lualine_b = {},
      lualine_c = {
        {
          function()
            return "%="
          end,
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {
        {
          'b:gitsigns_head',
          icon ='󰘬',
          color = {
            bg = colors.bg,
            fg = colors.yellow,
          }
        },
        {
          'diff',
          symbols = { added = " ", modified = "柳", removed = " " },
          diff_color = {
            added = { fg = colors.green },
            modified = { fg = colors.orange },
            removed = { fg = colors.red },
          },
          source = function()
            local gitsigns = vim.b.gitsigns_status_dict
            if gitsigns then
              return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
              }
            end
          end,
          on_click = function()
            vim.cmd("DiffviewOpen")
          end,
          color = { bg = colors.bg }
        },
      }
    },
    inactive_winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {
        {
          function()
            return "%="
          end,
        },
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    extensions = {}
  }
end

return M
