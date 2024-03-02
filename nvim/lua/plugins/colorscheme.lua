return {
  { "ellisonleao/gruvbox.nvim",
    lazy = false,
    config = function()
            require("gruvbox").setup({
                    transparent_mode = true,
            })
            vim.o.background = "dark"
            vim.cmd.colorscheme "gruvbox"
        end
  },
}
