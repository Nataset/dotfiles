return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
        },
        keys = {
            {
                "sF",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.find_files({
                        no_ignore = true,
                        hidden = true,
                    })
                end,
            },
        },
        opts = {
            defaults = {
                -- path_display = function(_, path)
                -- 	local tail = require("telescope.utils").path_tail(path)
                -- 	return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
                -- end,
                -- path_display = { "smart" },
                -- layout_strategy = "vertical",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.5,
                        results_width = 0.5,
                    },
                },
                sorting_strategy = "ascending",
                mappings = {
                    i = {
                        ["<c-a>"] = "toggle_all",
                    },
                },
            },
            pickers = {
                buffers = {
                    show_all_buffers = true,
                    sort_lastused = true,
                    previewer = true,
                    mappings = {
                        i = {
                            ["<c-x>"] = "delete_buffer",
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            local builtin = require("telescope.builtin")
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "TelescopeResults",
                callback = function(ctx)
                    vim.api.nvim_buf_call(ctx.buf, function()
                        vim.fn.matchadd("TelescopeParent", "\t\t.*$")
                        vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
                    end)
                end,
            })

            local function filenameFirst(_, path)
                local tail = vim.fs.basename(path)
                local parent = vim.fs.dirname(path)
                if parent == "." then
                    return tail
                end
                return string.format("%s\t\t%s", tail, parent)
            end

            opts.defaults.path_display = filenameFirst

            vim.keymap.set("n", "sf", builtin.find_files, {})
            vim.keymap.set("n", "sr", builtin.live_grep, {})
            vim.keymap.set("n", "sR", builtin.grep_string, {})
            vim.keymap.set("n", "s,", builtin.buffers, {})
            vim.keymap.set("n", "ss", builtin.lsp_document_symbols, {})
            vim.keymap.set("n", "s;", builtin.resume, {})
            vim.keymap.set("n", "sh", builtin.help_tags, {})
            vim.keymap.set("n", "sg", builtin.git_files, {})

            require("telescope").setup(opts)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
