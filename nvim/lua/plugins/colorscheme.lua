return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		config = function()
			require("gruvbox").setup({
				transparent_mode = true,
			})
			vim.o.background = "dark"
			vim.cmd.colorscheme("gruvbox")

			vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
			vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
		end,
	},
}
