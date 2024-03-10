local format_on_save = true

return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.goimports,
                -- null_ls.builtins.formatting.golines,
                -- null_ls.builtins.formatting.gofumpt,
                -- null_ls.builtins.code_actions.gomodifytags,
                null_ls.builtins.code_actions.impl,
                -- null_ls.builtins.diagnostics.eslint_d,
                -- null_ls.builtins.diagnostics.misspell,
                null_ls.builtins.formatting.phpcsfixer,
                require("none-ls.diagnostics.eslint_d"),
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            if format_on_save then
                                vim.lsp.buf.format({ async = false })
                            end
                        end,
                    })
                end
            end,
        })

        vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, {})
        vim.keymap.set("n", "<leader>cF", function()
            format_on_save = not format_on_save
            vim.notify("Format on Save: " .. (format_on_save and "Enabled" or "Disabled"))
        end, {})
    end,
}
