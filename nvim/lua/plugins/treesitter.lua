return  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "lua",
                "javascript",
                "typescript",
                "go",
                "gomod",
                "gowork",
                "gosum",
                "php",
                "json",
                "json5",
                "tsx",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}

