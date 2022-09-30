-- Impatient
local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end
-- Packer
require('plugins')
require('settings')
require('settings.utils')
require('settings.color')
-- Select theme.lua fix feline and nvim-cokeline
require('settings.gruvbox')
--
require('settings.font')
require('settings.completion')
require('settings.filetype')
-- LSP Config
require('lsp')
-- Keymap
require('settings.keymap')
