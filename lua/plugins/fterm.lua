local fterm = require("FTerm")
fterm.setup({
  border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
})
local lazydocker = fterm:new({
  ft = 'fterm_lazydocker',
  cmd = 'lazydocker',
  dimensions = {
    height = 0.9,
    width = 0.9,
    x = 0.5,
    y = 0.5,
  },
})
local lazygit = fterm:new({
  ft = 'fterm_lazygit',
  cmd = 'lazygit',
  border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
  dimensions = {
    height = 1,
    width = 1,
    x = 0.5,
    y = 0.5,
  },
})
local ranger = fterm:new({
  ft = 'fterm_ranger',
  cmd = 'ranger',
  border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
  dimensions = {
    height = 0.9,
    width = 0.9,
    x = 0.5,
    y = 0.5,
  },
})
vim.api.nvim_create_user_command('LD', function()
  lazydocker:toggle()
end, { bang = true })
vim.api.nvim_create_user_command('LG', function()
  lazygit:toggle()
end, { bang = true })
vim.api.nvim_create_user_command('Ranger', function()
  ranger:toggle()
end, { bang = true })
