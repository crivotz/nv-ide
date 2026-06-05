# Check if needed

```
 return {
    {
      "tpope/vim-dispatch",
      event = { "BufReadPre", "BufNewFile" },
    },
  }
  return {
    {
      "tpope/vim-sleuth",
      event = { "BufReadPre", "BufNewFile" },
    },
  }
  return {
    "ton/vim-bufsurf",
    event = 'VeryLazy',
    keys = {
      { "<leader>bn", ":BufSurfForward<CR>", desc ="Surf >>>" },
      { "<leader>bp", ":BufSurfBack<CR>", desc ="Surf <<<" },
      { "<leader>bl", ":BufSurfList<CR>", desc ="Surf list" },
    }
  }
```
