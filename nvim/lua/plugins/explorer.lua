return {
  "folke/snacks.nvim",
  opts = {
    explorer = {
      replace_netrw = true,
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            preset = "default",
            preview = "picker",
          },
          auto_close = true,
        },
      },
    },
  },
}
