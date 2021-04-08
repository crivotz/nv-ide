if vim.fn.has('unix') == 1 then
  local uname = vim.fn.system('uname')
  if uname == "Darwin\n" then
    vim.o.guifont = 'FuraCode Nerd Font Mono:h11'
  else
    vim.o.guifont = 'FiraCode Nerd Font Mono 8'
  end
end
