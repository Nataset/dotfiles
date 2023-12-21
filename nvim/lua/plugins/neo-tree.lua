return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    keys = {
        {
            "<leader>e",
            function()
                require("neo-tree.command").execute(
                    {
                        toggle = true,
                        dir = vim.loop.cwd(),
                        position = "float",
                        source = "filesystem",
                        reveal = true
                    })
            end,
        },
        {
            "<leader>E",
            function()
                require("neo-tree.command").execute(
                    {
                        toggle = true,
                        dir = vim.loop.cwd(),
                        position = "left",
                        source = "filesystem",
                        reveal = true
                    })
            end,
        },
    },
    opts = {
        filesystem= {
            hijack_netrw_behavior = "open_current",
        },
    },
    config = function(_, opts)
        require("neo-tree").setup(opts)
    end
}
