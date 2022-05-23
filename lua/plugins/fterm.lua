require'FTerm'.setup({
  -- dimensions  = {
  --   height = 0.8,
  --   width = 0.8,
  --   x = 0.5,
  --   y = 0.5
  -- },
  -- border = 'single' -- or 'double'
  border = { "┏", "━", "┓", "┃", "┛","━", "┗", "┃" },
})
vim.cmd([[
hi FloatBorder guifg=#f2594b guibg=#282828
hi NormalFloat guibg=#282828
]])
