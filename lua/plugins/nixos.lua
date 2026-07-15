local is_nixos = vim.uv.fs_stat("/etc/NIXOS") ~= nil

if not is_nixos then
  return {}
end

return {
  { "mason-org/mason.nvim", enabled = false },
  { "mason-org/mason-lspconfig.nvim", enabled = false },
  { "WhoIsSethDaniel/mason-tool-installer.nvim", enabled = false },
}
