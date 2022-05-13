if vim.fn.has("termguicolors") == 1 then
  vim.go.t_8f = "[[38;2;%lu;%lu;%lum"
  vim.go.t_8b = "[[48;2;%lu;%lu;%lum"
  vim.opt.termguicolors = true
end
vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
vim.g.gruvbox_material_palette = "mix" -- original, mix, material
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_sign_column_background = 'none'
vim.cmd 'color gruvbox-material'
-- #282828 #45403d #5a524c #3a3735 #504945
-- #34381b #3b4439 #402120 #4c3432 #0e363e #374141 #4f422e #3c3836
-- #e2cca9 #f2594b #f28534 #e9b143 #b0b846 #8bba7f #80aa9e #d3869b #db4740

vim.cmd([[
hi TelescopePromptBorder guifg=#f28534 guibg=#f28534
hi TelescopePromptNormal  guifg=#282828 guibg=#f28534
hi TelescopePromptTitle  guifg=#282828 guibg=#f28534
hi TelescopePromptPrefix  guifg=#282828 guibg=#f28534
hi TelescopePromptCounter  guifg=#282828 guibg=#f28534

hi TelescopePreviewTitle  guifg=#282828 guibg=#b0b846
hi TelescopePreviewBorder guifg=#b0b846 guibg=#282828

hi TelescopeResultsTitle  guifg=#282828 guibg=#b0b846
hi TelescopeResultsBorder guifg=#b0b846 guibg=#282828

hi TelescopeMatching guifg=#282828 guibg=#b0b846
hi TelescopeSelection guifg=#ffffff guibg=#32302f
]])
