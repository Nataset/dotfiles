return {
    {
        'tpope/vim-fugitive',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup()

            vim.keymap.set('n', '<leader>gp', ":Gitsigns preview_hunk<CR>", {})
            vim.keymap.set('n', '<leader>gb', ":Gitsigns blame_line<CR>", {})
            vim.keymap.set('n', '<leader>gB', ":Gitsigns toggle_current_line_blame<CR>", {})
        end
    },
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function()

            vim.keymap.set('n', '<leader>gl', ":LazyGit<CR>", {})
        end
    },
}
