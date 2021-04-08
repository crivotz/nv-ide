if vim.fn.has("termguicolors") == 1 then
  vim.o.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.o.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.o.termguicolors = true
end
vim.g.gruvbox_material_enable_italic=1
vim.cmd 'color gruvbox-material'
