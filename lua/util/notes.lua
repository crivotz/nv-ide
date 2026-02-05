function NewNote()
  vim.ui.input({ prompt = "Name: ", relative = "editor" }, function(name)
    if not name or name == "" then
      vim.notify("Name not provided", vim.log.levels.WARN)
      return
    end
    local path = vim.fn.expand("~/Notes/"..name..".md")
    if vim.fn.filereadable(path) == 1 then
      vim.notify("Note already exists: "..name, vim.log.levels.ERROR)
      return
    end
    vim.api.nvim_command(":e "..path)
  end)
end
