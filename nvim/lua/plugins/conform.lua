-- ~/.config/nvim/lua/plugins/format.lua
return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = {
            "-style=file",
            "-fallback-style=LLVM",
          },
        },
      },
    },
  },
}
