return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    { "<leader>x", desc = "Terminal" },
    { "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", desc = "Lazygit" },
    { "<leader>ld", "<cmd>lua _lazydocker_toggle()<CR>", desc = "Lazydocker" },
    { "<leader>se", "<cmd>lua _serpl_toggle()<CR>", desc = "Serpl" },
    { "<leader>ob", "<cmd>lua _overmind_backend_toggle()<CR>", desc = "Overmind backend" },
    { "<leader>of", "<cmd>lua _overmind_frontend_toggle()<CR>", desc = "Overmind frontend" },
    { "<leader>oc", "<cmd>lua _overmind_console_toggle()<CR>", desc = "Overmind console" },
  },
  config = function()
    require("toggleterm").setup({
      size = 20,
      hide_numbers = true,
      open_mapping = [[<leader>x]],
      shade_filetypes = {},
      shade_terminals = false,
      shading_factor = 0.1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      persist_size = true,
      direction = "horizontal",
      close_on_exit = true,
      float_opts = {
        border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
      }
    })

    -- Hide number column for
    -- vim.cmd [[au TermOpen * setlocal nonumber norelativenumber]]

    -- Esc twice to get to normal mode
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", close_on_exit = true, float_opts = { width = vim.o.columns, height = vim.o.lines } })
    local serpl = Terminal:new({ cmd = "serpl", hidden = true, direction = "float", close_on_exit = true, float_opts = { width = vim.o.columns, height = vim.o.lines } })
    local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float", close_on_exit = true })
    local overmind_frontend = Terminal:new({ cmd = "overmind connect frontend", hidden = true, direction = "vertical", close_on_exit = true })
    local overmind_backend = Terminal:new({ cmd = "overmind connect backend", hidden = true, direction = "vertical", close_on_exit = true })
    local overmind_console = Terminal:new({ cmd = "overmind connect console", hidden = true, direction = "vertical", close_on_exit = true })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _serpl_toggle()
      serpl:toggle()
    end

    function _lazydocker_toggle()
      lazydocker:toggle()
    end

    function _overmind_frontend_toggle()
      overmind_frontend:toggle()
    end

    function _overmind_backend_toggle()
      overmind_backend:toggle()
    end

    function _overmind_console_toggle()
      overmind_console:toggle()
    end

  end,
}
