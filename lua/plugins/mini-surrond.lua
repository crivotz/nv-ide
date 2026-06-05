return {
  "nvim-mini/mini.surround",
  opts = {
    mappings = {
      add = "gsa",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
    },
    custom_surroundings = {
      -- ERB output: <%= %>
      ["="] = {
        input = { "<%=.-%s*().-()%s*%->", "^<%=().*()%->$" },
        output = { left = "<%= ", right = " %>" },
      },
      -- ERB code: <% %>
      ["-"] = {
        input = { "<%%[^=]%s*().-()%s*%->", "^<%%().*()%->$" },
        output = { left = "<% ", right = " %>" },
      },
      -- ERB comment: <%# %>
      ["#"] = {
        input = { "<%#%s*().-()%s*%->", "^<%#().*()%->$" },
        output = { left = "<%# ", right = " %>" },
      },
    },
  },
}
