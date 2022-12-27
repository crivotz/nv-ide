return {
  "akinsho/nvim-toggleterm.lua",
  keys = { '<leader>x', '<leader>gg', '<leader>ld', '<F5>' },
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
      highlights = {
        Normal = {
          guibg = "#181818",
        },
        NormalFloat = {
          link = '#181818'
        },
        FloatBorder = {
          guifg = "#ea6962",
          guibg = "#282828",
        },
      },
      float_opts = {
        border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
      }
    })

    -- Hide number column for
    -- vim.cmd [[au TermOpen * setlocal nonumber norelativenumber]]

    -- Esc twice to get to normal mode
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
    local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })
    local ranger = Terminal:new({ cmd = "ranger", hidden = true, direction = "float" })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _lazydocker_toggle()
      lazydocker:toggle()
    end

    function _ranger_toggle()
      ranger:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua _lazydocker_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua _ranger_toggle()<CR>", {noremap = true, silent = true})
  end,
}
