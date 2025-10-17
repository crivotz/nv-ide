--luacheck: globals Difft

return {
  "ahkohd/difft.nvim",
  keys = {
    {
      "<leader>d",
      function()
        if Difft.is_visible() then
          Difft.hide()
        else
          Difft.diff()
        end
      end,
      desc = "Toggle Difft",
    },
  },
  config = function()
    require("difft").setup({
      layout = "ivy_taller",
      no_diff_message = "All clean! No changes detected.",
      loading_message = "Loading diff...",
      window = {
        number = false,
        relativenumber = false,
        border = "rounded",
      },
    --- Custom header content with webdev icons
      header = {
        content = function(filename, step, _language)
          local devicons = require("nvim-web-devicons")
          local basename = vim.fn.fnamemodify(filename, ":t")
          local icon, hl = devicons.get_icon(basename)

          -- Get the bg from FloatTitle (what DifftFileHeader links to)
          local header_hl = vim.api.nvim_get_hl(0, { name = "FloatTitle", link = false })

          -- Create custom highlight with devicon fg + header bg
          local icon_hl = hl
          if hl and header_hl.bg then
            local devicon_colors = vim.api.nvim_get_hl(0, { name = hl })
            if devicon_colors.fg then
              local custom_hl_name = "DifftIcon_" .. hl
              vim.api.nvim_set_hl(0, custom_hl_name, {
                fg = devicon_colors.fg,
                bg = header_hl.bg,
              })
              icon_hl = custom_hl_name
            end
          end

          local result = {}
          table.insert(result, { " " })
          table.insert(result, { icon and (icon .. " ") or "", icon_hl })
          table.insert(result, { filename })
          table.insert(result, { " " })

          if step then
            table.insert(result, { "• " })
            table.insert(result, { tostring(step.current) })
            table.insert(result, { "/" })
            table.insert(result, { tostring(step.of) })
            table.insert(result, { " " })
          end

          return result
        end,
        highlight = {
          link = "FloatTitle",
          full_width = true,
        },
      },
    })
  end,
}
