local M = {
  "famiu/feline.nvim",
}
function M.config()
  local lsp = require('feline.providers.lsp')
  local vi_mode_utils = require('feline.providers.vi_mode')
  local gps = require("nvim-gps")
  local lazy = require("lazy.status")

  local force_inactive = {
    filetypes = {
      '^NvimTree$',
      '^packer$',
      '^startify$',
      '^fugitive$',
      '^fugitiveblame$',
      '^qf$',
      '^help$',
      '^dbui$',
      '^lazy$',
      '^toggleterm$'
    },
    buftypes = {
      '^terminal$',
    },
    bufnames = {}
  }

  local disabled = {
    filetypes = {
      '^toggleterm$'
    },
    buftypes = {
      '^terminal$',
    },
    bufnames = {}
  }

  local winbar_components = {
    active = {{}, {}, {}},
    inactive = {{}, {}, {}},
  }

  local components = {
    active = {{}, {}, {}},
    inactive = {{}, {}, {}},
  }

  local gruvbox = {
    bg = '#282828',
    black = '#282828',
    yellow = '#d8a657',
    cyan = '#89b482',
    oceanblue = '#45707a',
    green = '#a9b665',
    orange = '#e78a4e',
    violet = '#d3869b',
    magenta = '#c14a4a',
    white = '#a89984',
    fg = '#a89984',
    skyblue = '#7daea3',
    red = '#ea6962',
  }

  local catppuccin = {
    bg = '#1e1e2e',
    black = '#1e1e2e',
    yellow = '#f9e2af',
    cyan = '#94e2d5',
    oceanblue = '#89b4fa',
    green = '#a6e3a1',
    orange = '#fab387',
    violet = '#cba6f7',
    magenta = '#eba0ac',
    white = '#f5e0dc',
    fg = '#f5e0dc',
    skyblue = '#74c7ec',
    red = '#f38ba8',
  }

  local onedarkpro = {
    bg = "#282c34",
    black = "#282c34",
    yellow = "#e5c07b",
    cyan = "#56b6c2",
    oceanblue = "#61afef",
    green = "#98c379",
    orange = "#d19a66",
    violet = "#c678dd",
    magenta = "#c678dd",
    white = "#abb2bf",
    fg = "#abb2bf",
    skyblue = "#61afef",
    red = "#e06c75",
  }

  local tokyonight = {
    bg = "#1a1b26",
    black = "#1a1b26",
    yellow = "#e0af68",
    cyan = "#7dcfff",
    oceanblue = "#7aa2f7",
    green = "#9ece6a",
    orange = "#e0af68",
    violet = "#bb9af7",
    magenta = "#bb9af7",
    white = "#c0caf5",
    fg = "#c0caf5",
    skyblue = "#7dcfff",
    red = "#f7768e",
  }

  local tokyonightstorm = {
    bg = "#24283b",
    black = "#24283b",
    yellow = "#e0af68",
    cyan = "#7dcfff",
    oceanblue = "#7aa2f7",
    green = "#9ece6a",
    orange = "#e0af68",
    violet = "#bb9af7",
    magenta = "#bb9af7",
    white = "#c0caf5",
    fg = "#c0caf5",
    skyblue = "#7dcfff",
    red = "#f7768e",
  }

  local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    CONFIRM = 'red',
    VISUAL = 'skyblue',
    LINES = 'skyblue',
    BLOCK = 'skyblue',
    REPLACE = 'violet',
    ['V-REPLACE'] = 'violet',
    ENTER = 'cyan',
    MORE = 'cyan',
    SELECT = 'orange',
    COMMAND = 'green',
    SHELL = 'green',
    TERM = 'green',
    NONE = 'yellow'
  }

  local vi_mode_text = {
    NORMAL = '<|',
    OP = '<|',
    INSERT = '|>',
    VISUAL = '<>',
    LINES = '<>',
    BLOCK = '<>',
    REPLACE = '<>',
    ['V-REPLACE'] = '<>',
    ENTER = '<>',
    MORE = '<>',
    SELECT = '<>',
    COMMAND = '<|',
    SHELL = '<|',
    TERM = '<|',
    NONE = '<>',
    CONFIRM = '|>'
  }

  local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
      return true
    end
    return false
  end

  local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
      return true
    end
    return false
  end

  -- STATUSLINE
  -- LEFT

  -- vi-mode
  components.active[1][1] = {
    provider = ' NV-IDE ',
    hl = function()
      local val = {}

      val.bg = vi_mode_utils.get_mode_color()
      val.fg = 'black'
      val.style = 'bold'

      return val
    end,
    right_sep = ' '
  }
  -- vi-symbol
  components.active[1][2] = {
    provider = function()
      return vi_mode_text[vi_mode_utils.get_vim_mode()]
    end,
    hl = function()
      local val = {}
      val.fg = vi_mode_utils.get_mode_color()
      val.bg = 'bg'
      val.style = 'bold'
      return val
    end,
    right_sep = ' '
  }
  -- filename
  components.active[1][3] = {
    provider = function()
      return vim.fn.expand("%:F")
    end,
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    }
  }
  -- MID

  -- gitBranch
  components.active[2][1] = {
    provider = 'git_branch',
    hl = {
      fg = 'yellow',
      bg = 'bg',
      style = 'bold'
    }
  }
  -- diffAdd
  components.active[2][2] = {
    provider = 'git_diff_added',
    hl = {
      fg = 'green',
      bg = 'bg',
      style = 'bold'
    }
  }
  -- diffModfified
  components.active[2][3] = {
    provider = 'git_diff_changed',
    hl = {
      fg = 'orange',
      bg = 'bg',
      style = 'bold'
    }
  }
  -- diffRemove
  components.active[2][4] = {
    provider = 'git_diff_removed',
    hl = {
      fg = 'red',
      bg = 'bg',
      style = 'bold'
    },
  }

  -- RIGHT

  -- fileIcon
  components.active[3][1] = {
    provider = function()
      local filename = vim.fn.expand('%:t')
      local extension = vim.fn.expand('%:e')
      local icon  = require'nvim-web-devicons'.get_icon(filename, extension)
      if icon == nil then
        icon = ''
      end
      return icon
    end,
    hl = function()
      local val = {}
      local filename = vim.fn.expand('%:t')
      local extension = vim.fn.expand('%:e')
      local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
      if icon ~= nil then
        val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
      else
        val.fg = 'white'
      end
      val.bg = 'bg'
      val.style = 'bold'
      return val
    end,
    right_sep = ' '
  }
  -- fileType
  components.active[3][2] = {
    provider = 'file_type',
    hl = function()
      local val = {}
      local filename = vim.fn.expand('%:t')
      local extension = vim.fn.expand('%:e')
      local icon, name  = require'nvim-web-devicons'.get_icon(filename, extension)
      if icon ~= nil then
        val.fg = vim.fn.synIDattr(vim.fn.hlID(name), 'fg')
      else
        val.fg = 'white'
      end
      val.bg = 'bg'
      val.style = 'bold'
      return val
    end,
    right_sep = ' '
  }
  -- fileSize
  components.active[3][3] = {
    provider = 'file_size',
    enabled = function() return vim.fn.getfsize(vim.fn.expand('%:t')) > 0 end,
    hl = {
      fg = 'skyblue',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  }
  -- fileFormat
  components.active[3][4] = {
    provider = function() return '' .. vim.bo.fileformat:upper() .. '' end,
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  }
  -- fileEncode
  components.active[3][5] = {
    provider = 'file_encoding',
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  }
  components.active[3][6] = {
    provider = 'position',
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  }
  -- linePercent
  components.active[3][7] = {
    provider = 'line_percentage',
    hl = {
      fg = 'white',
      bg = 'bg',
      style = 'bold'
    },
    right_sep = ' '
  }
  -- Lazy.nvim
  components.active[3][8] = {
    provider = function() return " ﮮ " end,
    enabled = lazy.has_updates,
    hl = {
      fg = 'black',
      bg = 'orange',
      style = 'bold'
    }
  }
  -- scrollBar
  components.active[3][9] = {
    provider = 'scroll_bar',
    hl = {
      fg = 'yellow',
      bg = 'bg',
    },
  }

  -- INACTIVE

  -- fileType
  components.inactive[1][1] = {
    provider = 'file_type',
    hl = {
      fg = 'black',
      bg = 'cyan',
      style = 'bold'
    },
    left_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'cyan'
        }
      },
      ' '
    }
  }

  -- WINBAR
  -- LEFT

  -- nvimGps
  winbar_components.active[1][1] = {
    provider = function() return gps.get_location() end,
    enabled = function() return gps.is_available() end,
    hl = {
      fg = 'orange',
      style = 'bold'
    }
  }

  -- MID

  -- RIGHT

  -- LspName
  winbar_components.active[3][1] = {
    provider = 'lsp_client_names',
    hl = {
      fg = 'yellow',
      style = 'bold'
    },
    right_sep = ' '
  }
  -- diagnosticErrors
  winbar_components.active[3][2] = {
    provider = 'diagnostic_errors',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
    hl = {
      fg = 'red',
      style = 'bold'
    }
  }
  -- diagnosticWarn
  winbar_components.active[3][3] = {
    provider = 'diagnostic_warnings',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
    hl = {
      fg = 'yellow',
      style = 'bold'
    }
  }
  -- diagnosticHint
  winbar_components.active[3][4] = {
    provider = 'diagnostic_hints',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
    hl = {
      fg = 'cyan',
      style = 'bold'
    }
  }
  -- diagnosticInfo
  winbar_components.active[3][5] = {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
    hl = {
      fg = 'skyblue',
      style = 'bold'
    }
  }

  -- INACTIVE

  -- fileType
  winbar_components.inactive[1][1] = {
    provider = 'file_type',
    hl = {
      fg = 'black',
      bg = 'cyan',
      style = 'bold'
    },
    left_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'cyan'
      }
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'cyan'
        }
      },
      ' '
    }
  }

  require('feline').setup({
    theme = gruvbox,
    default_bg = bg,
    default_fg = fg,
    vi_mode_colors = vi_mode_colors,
    components = components,
    force_inactive = force_inactive,
    disabled = disabled,
  })

  require('feline').winbar.setup({
    components = winbar_components,
    disabled = disabled,
  })
end

return M
