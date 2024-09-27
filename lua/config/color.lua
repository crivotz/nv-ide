if vim.fn.has("termguicolors") == 1 then
  --[[ vim.t_8f = "[[38;2;%lu;%lu;%lum" ]]
  --[[ vim.t_8b = "[[48;2;%lu;%lu;%lum" ]]
  vim.opt.termguicolors = true
  -- vim.opt.background = "light"
end
