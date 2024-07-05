return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"leoluz/nvim-dap-go",
			enabled = true,
			config = true,
		},
		{
			"rcarriga/nvim-dap-ui",
			keys = {
				{
					"<leader>du",
					function()
						require("dapui").toggle({})
					end,
					desc = "Dap UI",
				},
				{
					"<leader>de",
					function()
						require("dapui").eval()
					end,
					desc = "Eval",
					mode = { "n", "v" },
				},
			},

			opts = {
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.5,
							},
							{
								id = "breakpoints",
								size = 0.5,
							},
						},
						position = "left",
						size = 50,
					},
					{
						elements = {
							{
								id = "repl",
								size = 1,
							},
						},
						position = "bottom",
						size = 15,
					},
				},
			},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)

				dap.listeners.before.attach.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.launch.dapui_config = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated.dapui_config = function()
					dapui.close()
				end
				dap.listeners.before.event_exited.dapui_config = function()
					dapui.close()
				end
			end,
		},
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"theHamsta/nvim-dap-virtual-text",
	},
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
		vim.keymap.set("n", "<Leader>dc", dap.continue, {})

		if vim.fn.filereadable(".vscode/launch.json") then
			require("dap.ext.vscode").load_launchjs()
		end

		dap.adapters.go = {
			type = "server",
			port = 38697,
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:38697" },
			},
			enrich_config = function(finalConfig, on_config)
				local launchPath = (vim.fn.getcwd())

				local final_config = vim.deepcopy(finalConfig)

				-- Placeholder expansion for launch directives
				local placeholders = {
					["${file}"] = function(_)
						return vim.fn.expand("%:p")
					end,
					["${fileBasename}"] = function(_)
						return vim.fn.expand("%:t")
					end,
					["${fileBasenameNoExtension}"] = function(_)
						return vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
					end,
					["${fileDirname}"] = function(_)
						return vim.fn.expand("%:p:h")
					end,
					["${fileExtname}"] = function(_)
						return vim.fn.expand("%:e")
					end,
					["${relativeFile}"] = function(_)
						return vim.fn.expand("%:.")
					end,
					["${relativeFileDirname}"] = function(_)
						return vim.fn.fnamemodify(vim.fn.expand("%:.:h"), ":r")
					end,
					["${workspaceFolder}"] = function(_)
						return vim.fn.getcwd()
					end,
					["${workspaceFolderBasename}"] = function(_)
						return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					["${env:([%w_]+)}"] = function(match)
						return os.getenv(match) or ""
					end,
				}

				if final_config.envFile then
					local filePath = final_config.envFile
					for key, fn in pairs(placeholders) do
						filePath = filePath:gsub(key, fn)
					end

					for line in io.lines(filePath) do
						if not line:match("^%s*#") then
							local key, value = line:match("([^=]*)=(.*)")

							if not final_config.env then
								final_config.env = {}
							end

							if key ~= nil and value ~= nil then
								final_config.env[key] = value
							end
						end
					end
				end

				on_config(final_config)
			end,
		}
	end,
}
