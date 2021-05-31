if vim.fn.has('unix') == 1 then
  local uname = vim.fn.system('uname')
  if uname == "Darwin\n" then
    vim.opt.guifont = 'FuraCode Nerd Font Mono:h11'
  else
    vim.opt.guifont = 'FiraCode Nerd Font Mono 8'
  end
end
