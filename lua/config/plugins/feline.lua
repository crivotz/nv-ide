local M = {
  "freddiehaddad/feline.nvim",
  lazy = false,
}
function M.config()
  local lsp = require('feline.providers.lsp')
  local vi_mode_utils = require('feline.providers.vi_mode')
  local navic = require("nvim-navic")
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

  local colors = {
    bg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Normal", link = false }).bg),
    fg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg),
    black = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "EndOfBuffer", link = false }).fg),
    yellow = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Type", link = false }).fg),
    aqua = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Keyword", link = false }).fg),
    green = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "String", link = false }).fg),
    orange = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Operator", link = false }).fg),
    purple = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Identifier", link = false }).fg),
    white = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Normal", link = false }).fg),
    blue = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Comment", link = false }).fg),
    red = string.format('#%06x', vim.api.nvim_get_hl(0, { name = "Error", link = false }).fg),
  }

  local vi_mode_colors = {
    NORMAL = 'green',
    OP = 'green',
    INSERT = 'red',
    CONFIRM = 'red',
    VISUAL = 'blue',
    LINES = 'blue',
    BLOCK = 'blue',
    REPLACE = 'purple',
    ['V-REPLACE'] = 'purple',
    ENTER = 'aqua',
    MORE = 'aqua',
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
      fg = 'blue',
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
      bg = 'aqua',
      style = 'bold'
    },
    left_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'aqua'
      }
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'aqua'
        }
      },
      ' '
    }
  }

  -- WINBAR
  -- LEFT

  -- nvim-navic
  winbar_components.active[1][1] = {
    provider = function() return navic.get_location() end,
    enabled = function() return navic.is_available() end,
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
      fg = 'aqua',
      style = 'bold'
    }
  }
  -- diagnosticInfo
  winbar_components.active[3][5] = {
    provider = 'diagnostic_info',
    enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
    hl = {
      fg = 'blue',
      style = 'bold'
    }
  }

  -- INACTIVE

  -- fileType
  winbar_components.inactive[1][1] = {
    provider = 'file_type',
    hl = {
      fg = 'black',
      bg = 'aqua',
      style = 'bold'
    },
    left_sep = {
      str = ' ',
      hl = {
        fg = 'NONE',
        bg = 'aqua'
      }
    },
    right_sep = {
      {
        str = ' ',
        hl = {
          fg = 'NONE',
          bg = 'aqua'
        }
      },
      ' '
    }
  }

  require('feline').setup({
    theme = colors,
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
