return {
    {
        "fgheng/winbar.nvim",
        enabled = false,
        config = function(_, opts)
            require("winbar").setup({
                enabled = true,

                show_file_path = true,
                show_symbols = true,

                colors = {
                    path = "", -- You can customize colors like #c946fd
                    file_name = "",
                    symbols = "",
                },

                icons = {
                    file_icon_default = "",
                    separator = ">",
                    editor_state = "●",
                    lock_icon = "",
                },

                exclude_filetype = {
                    "help",
                    "startify",
                    "dashboard",
                    "packer",
                    "neogitstatus",
                    "NvimTree",
                    "Trouble",
                    "alpha",
                    "lir",
                    "Outline",
                    "spectre_panel",
                    "toggleterm",
                    "qf",
                },
            })
        end,
    },
    {
        "LunarVim/breadcrumbs.nvim",
        dependencies = {
            { "SmiteshP/nvim-navic" },
        },
        config = function(_, opts)
            require("nvim-navic").setup({
                lsp = {
                    auto_attach = true,
                },
            })
            require("breadcrumbs").setup()
        end,
    },
}
