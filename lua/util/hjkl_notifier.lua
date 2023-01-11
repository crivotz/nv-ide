-- Credits to https://github.com/folke/dot
local id
for _, key in ipairs({ "h", "j", "k", "l" }) do
  local count = 0
  vim.keymap.set("n", key, function()
    if count >= 10 then
      id = vim.notify("Do not tempt me!", vim.log.levels.WARN, {
        icon = "🧙",
        replace = id,
        keep = function()
          return count >= 10
        end,
      })
    else
      count = count + 1
      vim.defer_fn(function()
        count = count - 1
      end, 5000)
      return key
    end
  end, { expr = true })
end
