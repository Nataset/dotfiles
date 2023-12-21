-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- <ESC> to "kj" in insert mode
keymap.set("i", "kj", "<Esc>", { noremap = true })

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", "tabedit", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- change terminal map from <C--> to <C-t>
local Util = require("lazyvim.util")
local term = function()
  Util.terminal(nil, { cwd = Util.root() })
end

keymap.set("n", "<c-t>", term)
keymap.set("t", "<c-t>", "<cmd>close<cr>")

-- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")

-- keymap.set("n", "<C-j>", function()
--   vim.diagnostic.goto_next()
-- end, opts)
--
-- keymap.set("n", "<C-j>", function()
--   vim.diagnositic.goto_next()
-- end, opts)
