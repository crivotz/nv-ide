return {
  "akinsho/nvim-toggleterm.lua",
  keys = { '<leader>x', '<leader>gg', '<leader>ld' },
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
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float", float_opts = { width = vim.o.columns, height = vim.o.lines } })
    local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float" })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _lazydocker_toggle()
      lazydocker:toggle()
    end


    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua _lazydocker_toggle()<CR>", {noremap = true, silent = true})
  end,
}
