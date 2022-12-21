vim.g.gruvbox_material_background = "medium" -- hard, soft, medium
vim.g.gruvbox_material_palette = "material" -- original, mix, material
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
  'hi markid1                            guifg=#ff8f88 |' ..
  'hi markid2                            guifg=#ffb074 |' ..
  'hi markid3                            guifg=#cfdc8b |' ..
  'hi markid4                            guifg=#a3d4c9 |' ..
  'hi markid5                            guifg=#f9acc1 |' ..
  'hi markid6                            guifg=#afdaa8 |' ..
  'hi markid7                            guifg=#fecc7d |' ..
  'hi markid8                            guifg=#eed8b2 |' ..
  'hi markid9                            guifg=#ffedc7 |' ..
  'hi markid10                           guifg=#cebfaa |' ..
  'hi CodewindowBorder                   guifg=#ea6962 |'
})
vim.cmd'colorscheme gruvbox-material'
