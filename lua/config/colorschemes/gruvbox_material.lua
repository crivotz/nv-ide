vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
vim.g.gruvbox_material_foreground = "material" -- original, mix, material
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_sign_column_background = 'none'

grpid = vim.api.nvim_create_augroup('custom_highlights_gruvboxmaterial', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = grpid,
  pattern = 'gruvbox-material',
  command =
  'hi NvimTreeNormal                     guibg=#181818 |' ..
  'hi NvimTreeEndOfBuffer                guibg=#181818 |' ..
  'hi NoiceCmdlinePopupBorderCmdline     guifg=#ea6962 guibg=#282828 |' ..
  'hi TelescopePromptBorder              guifg=#ea6962 guibg=#282828 |' ..
  'hi TelescopePromptNormal              guifg=#ea6962 guibg=#282828 |' ..
  'hi TelescopePromptTitle               guifg=#ea6962 guibg=#282828 |' ..
  'hi TelescopePromptPrefix              guifg=#ea6962 guibg=#282828 |' ..
  'hi TelescopePromptCounter             guifg=#ea6962 guibg=#282828 |' ..
  'hi TelescopePreviewTitle              guifg=#89b482 guibg=#282828 |' ..
  'hi TelescopePreviewBorder             guifg=#89b482 guibg=#282828 |' ..
  'hi TelescopeResultsTitle              guifg=#89b482 guibg=#282828 |' ..
  'hi TelescopeResultsBorder             guifg=#89b482 guibg=#282828 |' ..
  'hi TelescopeMatching                  guifg=#d8a657 guibg=#282828 |' ..
  'hi TelescopeSelection                 guifg=#ffffff guibg=#32302f |' ..
  'hi FloatBorder                        guifg=#ea6962 guibg=#282828 |' ..
  'hi BqfPreviewBorder                   guifg=#ea6962 guibg=#282828 |' ..
  'hi NormalFloat                        guibg=#282828 |' ..
  'hi IndentBlanklineContextChar         guifg=#d3869b |' ..
  'hi StatusColumnBorder                 guifg=#232323 |' ..
  'hi StatusColumnBuffer                 guibg=#282828 |' ..
  'hi CursorLineNr                       guifg=#d8a657 |' ..
  'hi CodewindowBorder                   guifg=#ea6962 |' ..
  'hi TabLine                            guibg=#282828 |'
})
vim.cmd'colorscheme gruvbox-material'
