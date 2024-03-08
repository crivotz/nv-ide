return {
  "akinsho/nvim-toggleterm.lua",
  keys = {
    { "<leader>x", desc = "Terminal" },
    { "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", desc = "Lazygit" },
    { "<leader>ld", "<cmd>lua _lazydocker_toggle()<CR>", desc = "Lazydocker" },
    { "<leader>ff", "<cmd>lua _yazi_toggle()<CR>", desc = "Yazi" },
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
    local lazydocker = Terminal:new({ cmd = "lazydocker", hidden = true, direction = "float", close_on_exit = true })
    local yazi = Terminal:new({
      cmd = "yazi",
      dir = vim.fn.expand('%:p:h'),
      direction = "float",
      close_on_exit = true,
      start_in_insert = true,
      hidden = true,
      -- on_close = function()
      --   data = Path:new(path):read()
      --   vim.schedule(function()
      --     vim.cmd('e ' .. data)
      --   end)
      -- end
      on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
			end,
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
    })

    function _lazygit_toggle()
      lazygit:toggle()
    end

    function _lazydocker_toggle()
      lazydocker:toggle()
    end

    function _yazi_toggle()
      yazi:toggle()
    end

    vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua _lazydocker_toggle()<CR>", {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua _yazi_toggle()<CR>", {noremap = true, silent = false})
  end,
}
