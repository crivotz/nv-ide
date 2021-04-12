-- Global
vim.o.fillchars = vim.o.fillchars .. 'vert: '
vim.o.showtabline = 2
vim.o.scrolloff = 5
vim.o.mouse = 'a'
vim.o.backupcopy = 'yes'
vim.o.undolevels = 1000
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.showmode = false
vim.o.hidden = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.wrapscan = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.showcmd = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.hlsearch = true
vim.o.smartcase = true
vim.o.errorbells = false
vim.o.joinspaces = false
vim.o.title = true
vim.o.lazyredraw = true
vim.o.listchars = 'tab:▸ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣'
vim.o.encoding = 'UTF-8'
vim.o.completeopt = 'menu,menuone,noselect'
vim.o.clipboard = 'unnamedplus'
-- From buffer
vim.o.fileformat = vim.bo.fileformat
vim.o.tabstop = vim.bo.tabstop
vim.o.spelllang = vim.bo.spelllang
vim.o.softtabstop = vim.bo.softtabstop
vim.o.swapfile = vim.bo.swapfile
vim.o.undofile = vim.bo.undofile
-- From window
vim.o.number = vim.wo.number
vim.o.colorcolumn = vim.wo.colorcolumn
vim.o.foldmethod = vim.wo.foldmethod
vim.o.foldlevel = vim.wo.foldlevel
vim.o.foldnestmax = vim.wo.foldnestmax
vim.o.signcolumn = vim.wo.signcolumn
vim.o.list = vim.wo.list
vim.o.relativenumber = vim.wo.relativenumber
vim.o.foldenable = vim.wo.foldenable
vim.o.cursorline = vim.wo.cursorline
-- Buffer
vim.bo.fileformat = 'unix'
vim.bo.tabstop = 2
vim.bo.spelllang = 'it'
vim.bo.softtabstop = 2
vim.bo.swapfile = false
vim.bo.undofile = false
-- Window
vim.wo.number = true
vim.wo.colorcolumn = vim.wo.colorcolumn .. '+' .. 1
vim.wo.foldmethod = 'indent'
vim.wo.foldlevel = 1
vim.wo.foldnestmax = 10
vim.wo.signcolumn = 'yes'
vim.wo.list = false
vim.wo.relativenumber = true
vim.wo.foldenable = false
vim.wo.cursorline = true

vim.cmd[[autocmd BufReadPost * lua goto_last_pos()]]
function goto_last_pos()
  local last_pos = vim.fn.line("'\"")
  if last_pos > 0 and last_pos <= vim.fn.line("$") then
    vim.api.nvim_win_set_cursor(0, {last_pos, 0})
  end
end

vim.cmd 'au TextYankPost * silent! lua vim.highlight.on_yank()'
