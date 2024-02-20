local opt = vim.opt

opt.sidescrolloff = 8 -- Columns of context
-- Global
vim.g.autoformat = true
vim.opt.fillchars = {
  fold = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
vim.opt.listchars = {
  tab = ">>>",
  trail = "·",
  precedes = "←",
  extends = "→",eol = "↲",
  nbsp = "␣",
}
opt.autowrite = true -- Enable auto write
opt.foldnestmax = 4
opt.foldlevel = 1
opt.foldcolumn = "1"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.foldlevelstart = 99
opt.foldenable = true
-- opt.showtabline = 2
opt.mouse = 'a'
opt.backupcopy = 'yes'
opt.undolevels = 10000
opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.shortmess:append { c = true, S = true }
opt.showmode = false
opt.hidden = true
opt.splitright = true
opt.splitbelow = true
opt.wrapscan = true
opt.backup = false
opt.writebackup = false
opt.showcmd = true
opt.showmatch = true
opt.ignorecase = true
opt.hlsearch = true
opt.smartcase = true
opt.errorbells = false
opt.joinspaces = false
opt.title = true
opt.encoding = 'UTF-8'
opt.completeopt = { 'menu', 'menuone', 'noselect' }
opt.clipboard = 'unnamedplus'
opt.laststatus = 3
opt.timeoutlen = 500
opt.splitkeep = 'screen'
opt.termguicolors = true -- True color support
opt.timeoutlen = 500
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
-- opt.wrap = false -- Disable line wrap
opt.fileformat = 'unix'
opt.tabstop = 2
opt.spelllang = 'it'
opt.softtabstop = 2
opt.swapfile = false
opt.undofile = false
opt.smartindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.number = true
opt.colorcolumn = "+1"
opt.list = true
opt.signcolumn = 'yes:1'
opt.relativenumber = false
opt.cursorline = true
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.inccommand = "nosplit" -- preview incremental substitute
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
opt.shiftround = true -- Round indent

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, {last_pos, 0})
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback =  function()
    vim.highlight.on_yank()
  end,
})
--
-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
