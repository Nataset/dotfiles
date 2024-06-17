return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
			ensure_installed = {
				"lua_ls",
				"gopls",
				"tsserver",
				"rust_analyzer",
				"html",
				"phpactor",
				"intelephense",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.phpactor.setup({
				capabilities = capabilities,
			})
			-- lspconfig.intelephense.setup({
			-- 	capabilities = capabilities,
			-- })

			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", builtin.lsp_definitions, {})
			vim.keymap.set("n", "gD", function()
				builtin.lsp_definitions({ jump_type = "vsplit" })
			end, {})
			vim.keymap.set("n", "gt", builtin.lsp_type_definitions, {})
			vim.keymap.set("n", "gT", function()
				builtin.lsp_type_definitions({ jump_type = "vsplit" })
			end, {})
			vim.keymap.set("n", "gi", builtin.lsp_implementations, {})
			vim.keymap.set("n", "gI", function()
				builtin.lsp_implementations({ jump_type = "vsplit" })
			end, {})
			vim.keymap.set("n", "gr", builtin.lsp_references, {})
			vim.keymap.set("n", "gR", function()
				builtin.lsp_references({ jump_type = "vsplit" })
			end, {})
			vim.keymap.set("n", "<leader>cm", vim.diagnostic.open_float, {})

			vim.keymap.set("n", "<leader>cd", builtin.diagnostics, {})
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, {})
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, {})

			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
			vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, {})
			-- vim.keymap.set("n", "<C-h>", function() vim.lsp.buf.signature_help() end, { expr = true })
		end,
	},
}
